from flask import Blueprint, request, jsonify
from app.models import Contact
from app.schema.contact_schema import ContactSchema
from app import db
from app.utils.token_manager import decode_token

bp = Blueprint('contacts', __name__)

contact_schema = ContactSchema()
contacts_schema = ContactSchema(many=True)

@bp.route('/contact', methods=["POST"])
def add_contact():

    data = request.form

    required_fields = ['contacts_name', 'contacts_subject', 'contacts_email', 'contacts_message']
    for field in required_fields:
        if field not in data or not data[field]:
            return jsonify({'error': f'Field {field} is required'}), 400

    contacts_name = data['contacts_name']
    contacts_subject = data['contacts_subject']
    contacts_email = data['contacts_email']
    contacts_message = data['contacts_message']
    contacts_check = data.get('contacts_check', 'true').lower() == 'true'

    new_contact = Contact(
        contacts_name=contacts_name,
        contacts_subject=contacts_subject,
        contacts_email=contacts_email,
        contacts_message=contacts_message,
        contacts_check=contacts_check
    )

    try:
        db.session.add(new_contact)
        db.session.commit()
    except Exception as e:
        db.session.rollback()
        return jsonify({'error': 'Unable to add contact'}), 500

    contact = Contact.query.get(new_contact.contacts_id)
    return jsonify(contact_schema.dump(contact)), 201

@bp.route('/contacts', methods=['GET'])
def all_contacts():
    all_contacts = Contact.query.all()
    result = contacts_schema.dump(all_contacts)
    return jsonify(result)
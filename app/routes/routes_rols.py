from flask import Blueprint, request, jsonify
from app.models.rol import Rol
from app.schema.rol_schema import RolSchema
from app import db

from app.config import Config
from app.utils.token_manager import decode_token, encode_token

bp = Blueprint('rols', __name__)

rol_schema = RolSchema()
rols_schema = RolSchema(many=True)

@bp.route('/rol', methods=["POST"])
def add_rol():

    auth_header = request.headers.get('Authorization')
    try:
        decoded_token = decode_token(auth_header)
    except ValueError as e:
        return jsonify({'error': str(e)}), 401

    data = request.json

    required_fields = ['rols_name']

    for field in required_fields:
        if field not in data:
            return jsonify({'error': f'Campo {field} es obligatorio'}), 400

    rols_name = data['rols_name']

    existing_rol = Rol.query.filter_by(rols_name=rols_name).first()
    if existing_rol:
        return jsonify({'error': 'El Rol ya existe'}), 400

    new_rol = Rol(rols_name=rols_name)
    
    try:
        db.session.add(new_rol)
        db.session.commit()
    except Exception as e:
        db.session.rollback()
        return jsonify({'error': 'No se pudo agregar el rol', 'details': str(e)}), 500

    return jsonify(rol_schema.dump(new_rol)), 201

@bp.route('/rols', methods=["GET"])
def all_rols():

    auth_header = request.headers.get('Authorization')
    try:
        decoded_token = decode_token(auth_header)
    except ValueError as e:
        return jsonify({'error': str(e)}), 401

    all_rols = Rol.query.all()
    result = rols_schema.dump(all_rols)

    return jsonify(result)

@bp.route('/rol/<id>', methods = ["GET"])
def get_rol(id):
    
    auth_header = request.headers.get('Authorization')
    try:
        decoded_token = decode_token(auth_header)
    except ValueError as e:
        return jsonify({'error': str(e)}), 401

    rol = Rol.query.get(id)

    if rol is None:
        return jsonify({'message': 'Rol not found'}), 404
    
    return rol_schema.dump(rol)

@bp.route('/rol/<id>', methods= ["PUT"])
def update_rol(id):

    auth_header = request.headers.get('Authorization')
    try:
        decoded_token = decode_token(auth_header)
    except ValueError as e:
        return jsonify({'error': str(e)}), 401
    
    rol = Rol.query.get(id)

    if rol is None:
        return jsonify({'message': 'Rol not found'}), 404
    
    data = request.json
    rol.rols_name = data.get('rols_name', rol.rols_name)

    db.session.commit()

    return rol_schema.dump(rol)

@bp.route('/rol/<id>', methods=["DELETE"])
def delete_rol(id):
    
    auth_header = request.headers.get('Authorization')
    try:
        decoded_token = decode_token(auth_header)
    except ValueError as e:
        return jsonify({'error': str(e)}), 401
    
    rol = Rol.query.get(id)

    if rol is None:
        return jsonify({'message': 'Rol not found'}), 404
    
    db.session.delete(rol)
    db.session.commit()

    return jsonify({'message': 'Rol deleted'})
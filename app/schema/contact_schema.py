from app import ma
from app.models.contact import Contact

class ContactSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = Contact
        include_relationships = True

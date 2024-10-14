from app import db
from sqlalchemy import Boolean, Integer, String, Column, TIMESTAMP
from datetime import datetime

class Contact(db.Model):
    __tablename__ = 'contacts'
    contacts_id = Column(Integer, primary_key=True, autoincrement=True)
    contacts_name = Column(String(255), nullable=False)
    contacts_subject = Column(String(255), nullable=False)
    contacts_email = Column(String(255), nullable=False)
    contacts_message = Column(String(1000), nullable=False)
    contacts_check = Column(Boolean, default=True)
    contacts_date = Column(TIMESTAMP, default=datetime.utcnow)

    def __init__(self, contacts_name, contacts_subject, contacts_email, contacts_message, contacts_check=True):
        self.contacts_name = contacts_name
        self.contacts_subject = contacts_subject
        self.contacts_email = contacts_email
        self.contacts_message = contacts_message
        self.contacts_check = contacts_check

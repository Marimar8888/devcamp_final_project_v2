import jwt
from app.config import Config
from datetime import datetime, timedelta


def decode_token(auth_header):
      
    if not auth_header:
         raise ValueError('Token is missing')
    
    try:
        token = auth_header.split(" ")[1]
        decoded_token = jwt.decode(token, Config.SECRET_KEY, algorithms=['HS256'])
        token_type = decoded_token.get('token_type')
        if token_type == 'access':
            return decoded_token 
        elif token_type == 'reset':
            return decoded_token  
        else:
            raise ValueError('Invalid token type')  

        return decoded_token
    except jwt.ExpiredSignatureError:
        raise ValueError('Token has expired')
    except jwt.InvalidTokenError as e:
        raise ValueError(f'Invalid Token: {str(e)}')
    except Exception as e:
        raise ValueError(f'Unexpected error: {str(e)}')

def encode_token(user_id):

    token_payload = {
        'users_id': user_id,
        'token_type': 'access',
        'exp': datetime.utcnow() + timedelta(hours=1)
    }

    token = jwt.encode(token_payload, Config.SECRET_KEY, algorithm='HS256')

    return token

def encode_password_reset_token(user_id):

    token_payload = {
        'users_id': user_id,
        'token_type': 'reset',
        'exp': datetime.utcnow() + timedelta(minutes=3)
    }

    token = jwt.encode(token_payload, Config.SECRET_KEY, algorithm='HS256')

    return token


def get_user_id_from_token(auth_header):

    try:
        decoded_token = decode_token(auth_header)
        return decoded_token.get('users_id')
    except ValueError as e:
        raise ValueError(f"Error al decodificar el token: {str(e)}")
        

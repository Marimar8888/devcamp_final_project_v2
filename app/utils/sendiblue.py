import sib_api_v3_sdk
from flask import jsonify
from sib_api_v3_sdk.rest import ApiException
from app.config import Config
from app.utils import encode_token
from app.models import User    


# Inicializar el cliente de Sendinblue
configuration = sib_api_v3_sdk.Configuration()
configuration.api_key['api-key'] = Config.SENDINBLUE_API_KEY

# Envía un correo de recuperación de contraseña
def send_email(email, reset_token):
    # Crear instancia de la API
    api_instance = sib_api_v3_sdk.TransactionalEmailsApi(sib_api_v3_sdk.ApiClient(configuration))

    # Configurar los detalles del correo    
    send_smtp_email = sib_api_v3_sdk.SendSmtpEmail(    
        to=[{"email": email}],  # Usa la variable 'email' pasada a la función    
        subject="Recuperación de contraseña",    
        html_content=f"""    
        <html>
        <body>
            <p>Haz clic en el siguiente enlace para restablecer tu contraseña:</p>
            <a href="http://localhost:3000/reset-password?token={reset_token}">Recuperar Contraseña</a>
        </body>
        </html>
        """,
        sender={"email": "alonsomarimar23@gmail.com", "name": "CourseOnline"}
    )

    try:
        # Enviar el correo
        api_instance.send_transac_email(send_smtp_email)
        return jsonify({'message': 'Correo de recuperación enviado'}), 200
    except ApiException as e:
        print(f"Error al enviar el correo: {e}")
        return jsonify({'error': 'No se pudo enviar el correo'}), 500
from app import create_app
import requests

app, logger = create_app()

@app.route('/') # Creo la ruta de acceso a nuestra aplicación con el decorador
def hello():
    return "Hey Flask"

@app.route('/get-ip')
def get_ip():
    try:
        # Consulta a un servicio externo para obtener la IP
        response = requests.get('https://ifconfig.me')
        return f"Your public IP is: {response.text}"
    except Exception as e:
        return f"Error getting IP: {str(e)}"


if __name__ == '__main__':
    app.run(debug=True)
# Proyecto Backend (Tienda Online Venta de Cursos)

## Introducción

Se trata de una API RESTful de un proyecto de tienda online de cursos, desarrollado en Python utilizando **Flask** como framework principal. La API permite gestionar la lógica de negocio y las interacciones con la base de datos, facilitando el manejo de datos para estudiantes, profesores y centros de estudio. Está diseñada para soportar un dashboard dedicado en el frontend, proporcionando endpoints para el registro de usuarios, autenticación, gestión de cursos, profesores, centros de estudios y más. Esta arquitectura permite una separación clara entre la lógica del servidor y la presentación, asegurando un desarrollo modular y escalable.

## Tabla de Contenidos

  - [Tienda Online de Cursos](#tienda-online-de-cursos)
  - [Tabla de Contenidos](#tabla-de-contenidos)
  - [Características](#características)
  - [Tecnologías Utilizadas](#tecnologías-utilizadas)
  - [Requisitos](#requisitos)
  - [Estructura del Proyecto](#estructura-del-proyecto)
  - [Uso](#uso)
  - [Pruebas](#pruebas)
  - [Despliegue](#despliegue)
  - [Licencia](#licencia)
  - [Créditos](#créditos)

## Características

- **Gestión de Cursos**: Permite a los usuarios gestionar la creación, actualización y eliminación de cursos a través de la API.
- **Autenticación y Autorización**: Implementa un sistema seguro para el registro, inicio de sesión y recuperación de contraseñas a través de enmail y token.
- **Endpoints para Dashboard de Estudiante**: Proporciona acceso a información sobre cursos adquiridos y progreso de aprendizaje a través de la API.
- **Endpoints para Dashboard de Profesor**: Facilita la gestión de cursos, permitiendo a los profesores interactuar con la base de datos de manera eficiente.
- **Administración del Centro de Estudios**: Permite a los administradores gestionar profesores, cursos y centros mediante un conjunto de endpoints específicos.
- **API RESTful en Python**: La lógica del negocio y la gestión de datos se manejan a través de una API RESTful, garantizando una comunicación clara y estructurada entre el frontend y el backend.

## Tecnologías Utilizadas

- **Python**: Lenguaje de programación utilizado para desarrollar la lógica del backend.
- **Flask**: Microframework web utilizado para construir la API RESTful de la aplicación.
- **Flask-SQLAlchemy**: Extensión que proporciona un ORM (Object-Relational Mapping) para facilitar la interacción con bases de datos SQL.
- **Flask-Marshmallow**: Extensión que integra Flask con Marshmallow, permitiendo la serialización y deserialización de datos.
- **Marshmallow-SQLAlchemy**: Extensión que facilita la integración de Marshmallow con SQLAlchemy para la manipulación de datos.

### Explicación de la Configuración

1. **Configuración de la URI de la Base de Datos:**
   ```python
   app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:mypassword@localhost:3306/mydatabase'
   ```
   - **`mysql://`**: Protocolo para conectar con MySQL.
   - **`root`**: Usuario de MySQL.
   - **`mypassword`**: Contraseña del usuario de MySQL.
   - **`localhost`**: Nombre del host de tu servidor MySQL.
   - **`3306`**: Puerto de MySQL.
   - **`mydatabase`**: Nombre de la base de datos en MySQL.

2. **Inicialización de SQLAlchemy y Marshmallow:**
   ```python
   db = SQLAlchemy(app)
   ma = Marshmallow(app)
   ```
   - **`SQLAlchemy(app)`**: Inicializa SQLAlchemy con tu aplicación Flask, permitiendo la interacción con la base de datos MySQL.
   - **`Marshmallow(app)`**: Inicializa Marshmallow con tu aplicación Flask para la serialización y deserialización de datos JSON.

## Requisitos 

Para instalar y configurar el proyecto, sigue estos pasos:

1. **Instalar Python**: Asegúrate de tener Python instalado en tu sistema. Puedes descargarlo desde [Python.org](https://www.python.org/downloads/).

2. **Verificar la Instalación de Python y `pip`**:
   ```bash
   python --version
   pip --version
   ```

3. **Instalar `pipenv`**:
   ```bash
   pip install pipenv
   ```

4. **Configurar un Proyecto Python con `pipenv`**:
   - Navega al directorio de tu proyecto y crea un entorno virtual:
     ```bash
     cd <ruta_a_tu_proyecto>
     pipenv install
     ```

5. **Activar el Entorno Virtual**:
   ```bash
   pipenv shell
   ```

6. **Instalar Dependencias**:
   - Instala las bibliotecas necesarias para el proyecto:
     ```bash
     pipenv install flask flask_sqlalchemy flask-marshmallow marshmallow-sqlalchemy
     ```

7. **Configurar la Base de Datos**:
   - Asegúrate de configurar la URI de la base de datos en tu aplicación:
     ```python
     app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:mypassword@localhost:3306/mydatabase'
     ```
   - Inicializa SQLAlchemy y Marshmallow en tu aplicación:
     ```python
     db = SQLAlchemy(app)
     ma = Marshmallow(app)
     ```

8. **Salir del Entorno Virtual**:
   ```bash
   exit
   ```

## Estructura del Proyecto

La estructura utilizada para esta la API realizada en Python, para servir a una aplicación web utilizando Flask como framework, permite una fácil escalabilidad, mantenibilidad y comprensión del código. A continuación, se describen las diferentes secciones y sus propósitos.

### Descripción de las Secciones

#### 1. Archivos Raíz
- **`.gitignore`**: Especifica archivos o directorios que Git debe ignorar, ayudando a mantener el repositorio limpio.
- **`main.py`**: Archivo principal de la aplicación, donde se inicializa y ejecuta la app Flask.
- **`Pipfile` y `Pipfile.lock`**: Archivos de configuración para el gestor de paquetes `pipenv`, que aseguran que las dependencias estén bien gestionadas y versionadas.
- **`README.md`**: Proporciona información esencial sobre el proyecto, incluyendo instalación, uso y documentación.
- **`requirements.txt`**: Lista las dependencias del proyecto para su instalación rápida.

#### 2. Directorio `app`
Este directorio contiene la mayor parte de la lógica de la aplicación, organizada en subdirectorios por funcionalidad.

##### - `config.py`
Aquí se almacenan las configuraciones de la aplicación, facilitando cambios centralizados y evitando la dispersión de configuraciones a lo largo del código.

##### - `models`
Contiene los modelos de datos, que definen la estructura de la base de datos y la interacción con ella a través de SQLAlchemy. Separar los modelos mejora la claridad y facilita la extensión.

##### - `routes`
Agrupa las rutas de la API, organizando las solicitudes HTTP y sus controladores. Esto mejora la legibilidad y hace que el código sea más modular, facilitando la prueba y el mantenimiento.

##### - `schema`
Define los esquemas de serialización para las respuestas y solicitudes de la API, asegurando que los datos sean consistentes y correctamente estructurados.

##### - `static`
Contiene archivos estáticos como imágenes, CSS y JavaScript. Los subdirectorios ayudan a organizar los recursos multimedia.

#### 3. Directorio `utils`
Contiene funciones utilitarias que pueden ser reutilizadas en diferentes partes de la aplicación. Esto promueve la reutilización del código y mejora la organización general.

### Ventajas de esta Estructura

1. **Modularidad**: La separación de diferentes componentes en directorios específicos facilita la localización y modificación del código. Cada parte de la aplicación tiene su propio espacio, lo que ayuda a evitar el desorden.

2. **Mantenibilidad**: Con una estructura bien definida, es más fácil hacer cambios y añadir nuevas funcionalidades sin afectar el código existente.

3. **Escalabilidad**: Al tener una base estructurada, puedes añadir nuevos modelos, rutas y esquemas sin complicar la organización general del proyecto.

4. **Colaboración**: Una estructura clara permite que múltiples desarrolladores trabajen en diferentes partes del proyecto simultáneamente, minimizando conflictos y mejorando la eficiencia del trabajo en equipo.

5. **Facilidad de Pruebas**: Las unidades de código bien definidas son más fáciles de probar, permitiendo la implementación de pruebas unitarias y funcionales de manera eficiente.

### Buenas Prácticas

- **Uso de Archivos de Configuración**: Mantener configuraciones y credenciales en archivos separados y no incluirlos en el repositorio para proteger información sensible.
  
- **Documentación Clara**: Mantener un archivo `README.md` actualizado y bien documentado facilita a otros desarrolladores entender cómo utilizar y contribuir al proyecto.

- **Control de Versiones**: Utilizar `.gitignore` adecuadamente para evitar que archivos innecesarios o sensibles se incluyan en el control de versiones.

- **Consistencia en Nombres**: Utilizar convenciones de nombres consistentes para archivos y carpetas para mejorar la legibilidad.

### Estructura de Archivos

Para una representación detallada de la estructura de archivos, consulta el documento correspondiente en el siguiente enlace:

- [Estructura de archivos](doc/estructura-archivos.md)

## Uso

### Endpoints (API)

Puedes encontrar la documentación completa de la API [aquí](doc/api.md).
  
### Base de Datos

#### 1. **Subir el archivo SQL a tu servidor de hosting**

1. **Acceso al panel de control del hosting**:
   - Inicia sesión en el panel de control de tu hosting (como cPanel, Plesk, etc.).

2. **Acceder a phpMyAdmin**:
   - Busca la opción de **phpMyAdmin** en tu panel de control y ábrelo.

3. **Seleccionar la base de datos**:
   - Si aún no tienes una base de datos, crea una nueva base de datos en phpMyAdmin. Haz clic en **"Bases de datos"** y selecciona el archivo schema.sql que se encuentra en la carpeta database.

4. **Importar el archivo SQL**:
   - Selecciona la base de datos que acabas de crear o en la que deseas implementar la estructura.
   - Haz clic en la pestaña **"Importar"**.
   - En la sección de **"Archivo a importar"**, haz clic en **"Elegir archivo"** y selecciona el archivo SQL que exportaste anteriormente.
   - Asegúrate de que la opción de **"Formato"** esté configurada en **SQL**.
   - Haz clic en el botón **"Ejecutar"** o **"Importar"** para cargar el archivo SQL en tu base de datos.

#### 2. **Verificar la creación de tablas**

Después de la importación, es importante verificar que todas las tablas se hayan creado correctamente. Haz lo siguiente:

- Selecciona la base de datos en phpMyAdmin y revisa la lista de tablas. Asegúrate de que todas las tablas necesarias estén presentes.

#### 3. **Configuración adicional**

Dependiendo de la aplicación, puede que necesites insertar datos iniciales o realizar configuraciones adicionales en las tablas. Asegúrate de revisar cualquier archivo de configuración o documentación adicional que acompañe a la aplicación.


## Pruebas

En esta sección se describen las pruebas realizadas para asegurar el correcto funcionamiento de la aplicación. Esto incluye:

### Pruebas Unitarias

1. **Tipos de Pruebas**:
   - **Pruebas Unitarias**: Se han implementado pruebas unitarias para verificar el correcto funcionamiento de los componentes y funciones individuales.
   - **Pruebas de Integración**: Se realizan pruebas para comprobar la interacción entre diferentes módulos del sistema y garantizar que funcionen correctamente en conjunto.


## Despliegue

Este proyecto se puede desplegar en la plataforma **Render** para el frontend y el backend, mientras que la base de datos se alojará en **Nominalia**. A continuación, se describen los pasos para realizar el despliegue.

### Despliegue en Render

1. **Crear una cuenta en Render**:
   - Si aún no tienes una cuenta, regístrate en [Render.com](https://render.com).

2. **Despliegue del Frontend**:
   - En el panel de control de Render, selecciona la opción para crear un nuevo servicio.
   - Selecciona **Web Service** para el frontend.
   - Conecta tu repositorio de GitHub donde está alojado el código del frontend.
   - Configura el entorno de producción:
     - **Build Command**: `npm install && npm run build`
     - **Start Command**: `npm start`
     - **Environment**: Elige `Node` o el que corresponda a tu aplicación.
   - Define la variable de entorno `REACT_APP_API_URL` con la URL de tu backend en Render.

3. **Despliegue del Backend**:
   - Crea otro servicio en Render para el backend siguiendo el mismo proceso.
   - Configura el entorno de producción:
     - **Build Command**: `npm install`
     - **Start Command**: `npm start`
   - Asegúrate de definir todas las variables de entorno necesarias para tu aplicación, incluyendo detalles de la conexión a la base de datos.


### Configuración de la Base de Datos en Hostalia

1. **Contratar un servicio de base de datos**:
   - Regístrate en [Hostalia](https://www.hostalia.com) y selecciona un plan que se ajuste a tus necesidades.
  
2. **Crear la base de datos**:
   - Sigue las instrucciones de Hostalia para crear tu base de datos y anotar los detalles de conexión (nombre, usuario, contraseña, URL).

3. **Configurar la conexión en el Backend**:
   - En el backend, define las variables de entorno necesarias para conectarte a la base de datos, utilizando los detalles obtenidos de Hostalia.

### Notas Adicionales

- Asegúrate de probar la aplicación después del despliegue para verificar que tanto el frontend como el backend se comunican correctamente con la base de datos.
- Consulta la documentación de Render y Nominalia para obtener detalles específicos sobre la configuración y opciones avanzadas.

## Licencia

Este proyecto está bajo la licencia **MIT**. Puedes ver el texto completo de la licencia en el archivo [LICENSE](./LICENSE).

## Créditos

- **Autor del proyecto**: [Maria del Mar Alonso](https://tu-sitio-web-o-perfil.github.io) (si deseas incluir un enlace a tu perfil o sitio web).

## Documentación

- [Diagrama de Relaciones Roles](doc/diagrama-ERD-roles-relaciones.png)
- [Diagrama de Relaciones cursos-inscripciones-contacto](doc/diagrama-ERD-courses-enrollments-contact.png)
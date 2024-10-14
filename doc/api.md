## Endpoints (API)

La API proporciona varios endpoints que permiten realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) sobre los recursos del sistema. A continuación, se detallan algunos de los principales endpoints disponibles:

### 1. **Usuarios**

- **Registro de usuario**
  - **Método**: `POST`
  - **Endpoint**: `/user`
  - **Cuerpo de la solicitud**:
    ```json
    {
      "users_name": "nombre_de_usuario",
      "users_email": "correo@example.com",
      "users_password": "contraseña"
    }
    ```

- **Inicio de sesión**
  - **Método**: `POST`
  - **Endpoint**: `/login`
  - **Cuerpo de la solicitud**:
    ```json
    {
      "users_email": "correo@example.com",
      "users_password": "contraseña"
    }
    ```

- **Obtener todos los usuarios**
  - **Método**: `GET`
  - **Endpoint**: `/users`

- **Obtener un usuario específico**
  - **Método**: `GET`
  - **Endpoint**: `/user/<id>`

- **Actualizar un usuario**
  - **Método**: `PATCH`
  - **Endpoint**: `/user/<id>`
  - **Cuerpo de la solicitud**:
    ```json
    {
      "users_name": "nuevo_nombre_de_usuario",
      "users_email": "nuevo_correo@example.com",
      "users_password": "nueva_contraseña"
    }
    ```

- **Eliminar un usuario**
  - **Método**: `DELETE`
  - **Endpoint**: `/user/<id>`

- **Obtener el ID del usuario autenticado**
  - **Método**: `GET`
  - **Endpoint**: `/get_user_id`

- **Verificar si el token es válido**
  - **Método**: `GET`
  - **Endpoint**: `/get_verify_token`

- **Recuperar contraseña**
  - **Método**: `POST`
  - **Endpoint**: `/forgot-password`
  - **Cuerpo de la solicitud**:
    ```json
    {
      "users_email": "correo@example.com"
    }
    ```
    
---

### 2. **Profesores**

- **Agregar profesor**
  - **Método**: `POST`
  - **Endpoint**: `/professor`
  - **Cuerpo de la solicitud**:
    ```json
    {
      "professors_first_name": "nombre_de_profesor",
      "professors_last_name": "apellido_de_profesor",
      "professors_email": "correo@example.com",
      "professors_user_id": "id_de_usuario",
      "professors_dni": "dni_del_profesor",
      "professors_address": "dirección_del_profesor",
      "professors_city": "ciudad_del_profesor",
      "professors_postal": "código_postal",
      "professors_number_card": "número_de_tarjeta",
      "professors_exp_date": "fecha_de_expiración",
      "professors_cvc": "cvc_de_la_tarjeta"
    }
    ```

- **Obtener todos los profesores**
  - **Método**: `GET`
  - **Endpoint**: `/professors`

- **Obtener un profesor específico**
  - **Método**: `GET`
  - **Endpoint**: `/professor/<id>`

- **Obtener el ID de un profesor por el ID de usuario**
  - **Método**: `GET`
  - **Endpoint**: `/professor/user_id/<user_id>`

- **Actualizar un profesor**
  - **Método**: `PATCH`
  - **Endpoint**: `/professor/<id>`
  - **Cuerpo de la solicitud**:
    ```json
    {
      "professors_first_name": "nuevo_nombre_de_profesor",
      "professors_last_name": "nuevo_apellido_de_profesor",
      "professors_email": "nuevo_correo@example.com",
      "professors_user_id": "nuevo_id_de_usuario",
      "professors_dni": "nuevo_dni",
      "professors_address": "nueva_dirección",
      "professors_city": "nueva_ciudad",
      "professors_postal": "nuevo_código_postal",
      "professors_number_card": "nuevo_número_de_tarjeta",
      "professors_exp_date": "nueva_fecha_de_expiración",
      "professors_cvc": "nuevo_cvc"
    }
    ```

- **Eliminar un profesor**
  - **Método**: `DELETE`
  - **Endpoint**: `/professor/<id>`

- **Obtener todas las fechas de un profesor**
  - **Método**: `GET`
  - **Endpoint**: `/professor/all_dates/<professorId>`

- **Obtener un profesor por ID de usuario**
  - **Método**: `GET`
  - **Endpoint**: `/professor/userId/<user_id>`

---

### 3. **Estudiantes**

- **Agregar estudiante**
  - **Método**: `POST`
  - **Endpoint**: `/student`
  - **Cuerpo de la solicitud**:
    ```json
    {
      "students_user_id": "id_de_usuario",
      "students_first_name": "nombre_de_estudiante",
      "students_last_name": "apellido_de_estudiante",
      "students_dni": "dni_del_estudiante",
      "students_address": "dirección_del_estudiante",
      "students_city": "ciudad_del_estudiante",
      "students_postal": "código_postal",
      "students_email": "correo@example.com",
      "students_number_card": "número_de_tarjeta",
      "students_exp_date": "fecha_de_expiración",
      "students_cvc": "cvc_de_la_tarjeta"
    }
    ```

- **Obtener todos los estudiantes**
  - **Método**: `GET`
  - **Endpoint**: `/students`

- **Obtener un estudiante específico**
  - **Método**: `GET`
  - **Endpoint**: `/student/<id>`

- **Obtener el ID de un estudiante por el ID de usuario**
  - **Método**: `GET`
  - **Endpoint**: `/student/user_id/<user_id>`

- **Actualizar un estudiante**
  - **Método**: `PATCH`
  - **Endpoint**: `/student/<id>`
  - **Cuerpo de la solicitud**:
    ```json
    {
      "students_user_id": "nuevo_id_de_usuario",
      "students_first_name": "nuevo_nombre_de_estudiante",
      "students_last_name": "nuevo_apellido_de_estudiante",
      "students_dni": "nuevo_dni",
      "students_address": "nueva_dirección",
      "students_city": "nueva_ciudad",
      "students_postal": "nuevo_código_postal",
      "students_email": "nuevo_correo@example.com",
      "students_number_card": "nuevo_número_de_tarjeta",
      "students_exp_date": "nueva_fecha_de_expiración",
      "students_cvc": "nuevo_cvc"
    }
    ```

- **Eliminar un estudiante**
  - **Método**: `DELETE`
  - **Endpoint**: `/student/<id>`

- **Obtener todas las fechas de un estudiante**
  - **Método**: `GET`
  - **Endpoint**: `/student/all_dates/<studentId>`

- **Obtener un estudiante por ID de usuario**
  - **Método**: `GET`
  - **Endpoint**: `/student/userId/<user_id>`

---

### 4. **Centros de Estudio**

- **Agregar centro de estudio**
  - **Método**: `POST`
  - **Endpoint**: `/studycenter`
  - **Cuerpo de la solicitud**:
    ```json
    {
      "studyCenters_name": "nombre_del_centro",
      "studyCenters_email": "correo@example.com",
      "studyCenters_user_id": "id_de_usuario",
      "studyCenters_cif": "cif_del_centro",
      "studyCenters_address": "dirección_del_centro",
      "studyCenters_city": "ciudad_del_centro",
      "studyCenters_postal": "código_postal",
      "studyCenters_number_card": "número_de_tarjeta",
      "studyCenters_exp_date": "fecha_de_expiración",
      "studyCenters_cvc": "cvc_de_la_tarjeta"
    }
    ```

- **Obtener todos los centros de estudio**
  - **Método**: `GET`
  - **Endpoint**: `/studycenters`

- **Obtener un centro de estudio específico**
  - **Método**: `GET`
  - **Endpoint**: `/studycenter/<id>`

- **Obtener un centro de estudio por ID de usuario**
  - **Método**: `GET`
  - **Endpoint**: `/studycenter/user_id/<user_id>`

- **Actualizar un centro de estudio**
  - **Método**: `PATCH`
  - **Endpoint**: `/studycenter/<id>`
  - **Cuerpo de la solicitud** (se pueden omitir campos que no se desean actualizar):
    ```json
    {
      "studyCenters_name": "nuevo_nombre_del_centro",
      "studyCenters_email": "nuevo_correo@example.com",
      "studyCenters_user_id": "nuevo_id_de_usuario",
      "studyCenters_cif": "nuevo_cif",
      "studyCenters_address": "nueva_dirección",
      "studyCenters_city": "nueva_ciudad",
      "studyCenters_postal": "nuevo_código_postal",
      "studyCenters_number_card": "nuevo_número_de_tarjeta",
      "studyCenters_exp_date": "nueva_fecha_de_expiración",
      "studyCenters_cvc": "nuevo_cvc",
      "studyCenters_active": true  // opcional
    }
    ```

- **Actualizar el estado de un centro de estudio**
  - **Método**: `PATCH`
  - **Endpoint**: `/studycenter/status/<center_id>`
  - **Cuerpo de la solicitud**:
    ```json
    {
      "studyCenters_active": true  // nuevo estado
    }
    ```

- **Eliminar un centro de estudio**
  - **Método**: `DELETE`
  - **Endpoint**: `/studycenter/<id>`

---

### 5. **Cursos**

- **Agregar curso**
  - **Método**: `POST`
  - **Endpoint**: `/course`
  - **Cuerpo de la solicitud** (formato `multipart/form-data`):
    ```json
    {
      "courses_image": "archivo_de_imagen",
      "courses_title": "título_del_curso",
      "courses_content": "contenido_del_curso",
      "courses_price": "precio_del_curso",
      "courses_discounted_price": "precio_descuento_del_curso",
      "courses_professor_id": "id_del_profesor",
      "courses_studycenter_id": "id_del_centro_de_estudio",
      "courses_category_id": "id_de_categoria",
      "courses_active": "estado_del_curso" // true o false
    }
    ```

- **Obtener todos los cursos**
  - **Método**: `GET`
  - **Endpoint**: `/courses`
  - **Parámetros de consulta**:
    - `page` (opcional): número de página para la paginación.
    - `limit` (opcional): cantidad de cursos por página.

- **Obtener un curso específico**
  - **Método**: `GET`
  - **Endpoint**: `/course/<id>`

- **Obtener cursos por categoría**
  - **Método**: `GET`
  - **Endpoint**: `/store/courses/<categoryId>`
  - **Parámetros de consulta**:
    - `page` (opcional): número de página para la paginación.
    - `limit` (opcional): cantidad de cursos por página.

- **Obtener cursos de un profesor filtrados por tipo**
  - **Método**: `GET`
  - **Endpoint**: `/courses/professor/<int:professorId>/type/<int:TypeId>`
  - **Parámetros de consulta**:
    - `page` (opcional): número de página para la paginación.
    - `limit` (opcional): cantidad de cursos por página.

- **Obtener cursos de un estudiante filtrados por tipo**
  - **Método**: `GET`
  - **Endpoint**: `/courses/student/<int:studentId>/type/<int:TypeId>`
  - **Parámetros de consulta**:
    - `page` (opcional): número de página para la paginación.
    - `limit` (opcional): cantidad de cursos por página.

- **Obtener cursos por ID de estudiante**
  - **Método**: `GET`
  - **Endpoint**: `/courses/student_id/<studentId>`

- **Obtener cursos favoritos de un usuario**
  - **Método**: `GET`
  - **Endpoint**: `/courses/favorites/<userId>`

- **Actualizar un curso**
  - **Método**: `PUT`
  - **Endpoint**: `/course/<id>`
  - **Cuerpo de la solicitud** (pueden omitirse campos que no se desean actualizar):
    ```json
    {
      "courses_title": "nuevo_título_del_curso",
      "courses_content": "nuevo_contenido_del_curso",
      "courses_image": "nuevo_archivo_de_imagen",
      "courses_price": "nuevo_precio_del_curso",
      "courses_discounted_price": "nuevo_precio_descuento_del_curso",
      "courses_professor_id": "nuevo_id_del_profesor",
      "courses_studycenter_id": "nuevo_id_del_centro_de_estudio",
      "courses_category_id": "nuevo_id_de_categoria",
      "courses_active": true  
    }
    ```

---

### 6. **Inscripciones**

- **Agregar inscripción**
  - **Método**: `POST`
  - **Endpoint**: `/enrollment`
  - **Cuerpo de la solicitud** (formato `multipart/form-data`):
    ```json
    {
      "enrollments_student_id": "id_del_estudiante",
      "enrollments_course_ids": ["id_del_curso_1", "id_del_curso_2"],
      "enrollments_start_date": "fecha_de_inicio",
      "enrollments_end_date": "fecha_de_fin",
      "enrollments_price": "precio_de_la_inscripción"
    }
    ```

- **Obtener todas las inscripciones**
  - **Método**: `GET`
  - **Endpoint**: `/enrollments`
  - **Parámetros de consulta**:
    - `page` (opcional): número de página para la paginación.
    - `limit` (opcional): cantidad de inscripciones por página.

- **Obtener una inscripción específica**
  - **Método**: `GET`
  - **Endpoint**: `/enrollment/<enrollmentId>`

- **Obtener inscripciones por ID de estudiante**
  - **Método**: `GET`
  - **Endpoint**: `/enrollments/<studentId>`

- **Obtener inscripciones por ID de profesor**
  - **Método**: `GET`
  - **Endpoint**: `/enrollments/professor/<professorId>`

- **Actualizar una inscripción**
  - **Método**: `PUT`
  - **Endpoint**: `/enrollment/<id>`
  - **Cuerpo de la solicitud** (pueden omitirse campos que no se desean actualizar):
    ```json
    {
      "enrollments_student_id": "nuevo_id_del_estudiante",
      "enrollments_course_id": "nuevo_id_del_curso",
      "enrollments_start_date": "nueva_fecha_de_inicio",
      "enrollments_end_date": "nueva_fecha_de_fin",
      "enrollments_finalized": true, 
      "enrollments_price": "nuevo_precio_de_la_inscripción"
    }
    ```

- **Eliminar una inscripción**
  - **Método**: `DELETE`
  - **Endpoint**: `/enrollment/<id>`

---

### 7. **Categorías**

- **Agregar categoría**
  - **Método**: `POST`
  - **Endpoint**: `/category`
  - **Cuerpo de la solicitud** (formato `application/json`):
    ```json
    {
      "categories_name": "nombre_de_la_categoria"
    }
    ```

- **Obtener todas las categorías**
  - **Método**: `GET`
  - **Endpoint**: `/categories`

- **Obtener una categoría específica**
  - **Método**: `GET`
  - **Endpoint**: `/category/<id>`

- **Actualizar una categoría**
  - **Método**: `PUT`
  - **Endpoint**: `/category/<id>`
  - **Cuerpo de la solicitud** (pueden omitirse campos que no se desean actualizar):
    ```json
    {
      "categories_name": "nuevo_nombre_de_la_categoria"
    }
    ```

---

### 8. **Contactos**

- **Agregar contacto**
  - **Método**: `POST`
  - **Endpoint**: `/contact`
  - **Cuerpo de la solicitud** (formato `multipart/form-data`):
    ```json
    {
      "contacts_name": "nombre_del_contacto",
      "contacts_subject": "asunto_del_contacto",
      "contacts_email": "correo_del_contacto",
      "contacts_message": "mensaje_del_contacto",
      "contacts_check": true 
    }
    ```

- **Obtener todos los contactos**
  - **Método**: `GET`
  - **Endpoint**: `/contacts`

---

### 9. **Favoritos**

- **Agregar favorito**
  - **Método**: `POST`
  - **Endpoint**: `/favorite`
  - **Cuerpo de la solicitud** (formato `application/json`):
    ```json
    {
      "favorites_user_id": "id_del_usuario",
      "favorites_course_id": "id_del_curso"
    }
    ```

- **Obtener favoritos por ID de usuario**
  - **Método**: `GET`
  - **Endpoint**: `/favorites/<user_id>`

- **Eliminar favorito por ID de usuario y ID de curso**
  - **Método**: `DELETE`
  - **Endpoint**: `/favorite/<int:user_id>/<int:course_id>`

---

### 10. **Roles**

- **Agregar rol**
  - **Método**: `POST`
  - **Endpoint**: `/rol`
  - **Cuerpo de la solicitud** (formato `application/json`):
    ```json
    {
      "rols_name": "nombre_del_rol"
    }
    ```

- **Obtener todos los roles**
  - **Método**: `GET`
  - **Endpoint**: `/rols`

- **Obtener rol por ID**
  - **Método**: `GET`
  - **Endpoint**: `/rol/<id>`

- **Actualizar rol por ID**
  - **Método**: `PUT`
  - **Endpoint**: `/rol/<id>`
  - **Cuerpo de la solicitud** (formato `application/json`):
    ```json
    {
      "rols_name": "nuevo_nombre_del_rol"
    }
    ```

- **Eliminar rol por ID**
  - **Método**: `DELETE`
  - **Endpoint**: `/rol/<id>`

---

### 11. **Relaciones de usuario y rol**

- **Agregar relación usuario-rol**
  - **Método**: `POST`
  - **Endpoint**: `/user_rol`
  - **Cuerpo de la solicitud** (formato `application/json`):
    ```json
    {
      "user_id": "id_del_usuario",
      "rol_id": "id_del_rol"
    }
    ```

- **Obtener todas las relaciones usuario-rol**
  - **Método**: `GET`
  - **Endpoint**: `/user_rols`

- **Eliminar relación usuario-rol**
  - **Método**: `DELETE`
  - **Endpoint**: `/user_rol`
  - **Cuerpo de la solicitud** (formato `application/json`):
    ```json
    {
      "user_id": "id_del_usuario",
      "rol_id": "id_del_rol"
    }
    ```

---

### 12. **Relaciones de profesor y centro de estudio**

- **Agregar relación profesor-centro de estudio**
  - **Método**: `POST`
  - **Endpoint**: `/professor_studycenter`
  - **Cuerpo de la solicitud** (formato `application/json`):
    ```json
    {
      "professor_id": "id_del_profesor",
      "studyCenter_id": "id_del_centro_de_estudio"
    }
    ```

- **Obtener todas las relaciones profesor-centro de estudio**
  - **Método**: `GET`
  - **Endpoint**: `/professor_studycenters`

- **Obtener centros de estudio por ID de profesor**
  - **Método**: `GET`
  - **Endpoint**: `/centers/professor/<professorId>`

- **Eliminar relación profesor-centro de estudio**
  - **Método**: `DELETE`
  - **Endpoint**: `/professor_studycenter`
  - **Cuerpo de la solicitud** (formato `application/json`):
    ```json
    {
      "professor_id": "id_del_profesor",
      "studyCenter_id": "id_del_centro_de_estudio"
    }
    ```

---

### 13. **Relaciones de estudiante y centro de estudio**

- **Agregar relación estudiante-centro de estudio**
  - **Método**: `POST`
  - **Endpoint**: `/studycenter_student`
  - **Cuerpo de la solicitud** (formato `application/json`):
    ```json
    {
      "studycenter_student_student_id": "id_del_estudiante",
      "studycenter_student_center_id": "id_del_centro_de_estudio"
    }
    ```

- **Obtener todas las relaciones estudiante-centro de estudio**
  - **Método**: `GET`
  - **Endpoint**: `/studycenter_students`

- **Eliminar relación estudiante-centro de estudio**
  - **Método**: `DELETE`
  - **Endpoint**: `/studycenter_student`
  - **Cuerpo de la solicitud** (formato `application/json`):
    ```json
    {
      "studycenter_student_student_id": "id_del_estudiante",
      "studycenter_student_center_id": "id_del_centro_de_estudio"
    }
    ```

--- 









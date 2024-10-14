
### Estructura de Archivos

```plaintext

C:.
│   .env
│   .gitignore
│   main.py
│   package-lock.json
│   Pipfile
│   Pipfile.lock
│   README.md
│   requirements.txt
│
├───app
│   │   config.py
│   │   __init__.py
│   │
│   ├───models
│   │   │   category.py
│   │   │   contact.py
│   │   │   course.py
│   │   │   enrollment.py
│   │   │   favorite.py
│   │   │   professor.py
│   │   │   professor_student.py
│   │   │   professor_studycenter.py
│   │   │   rol.py
│   │   │   student.py
│   │   │   studycenter_student.py
│   │   │   study_center.py          
│   │   │   user.py
│   │   │   user_rol.py    
│   │   └─── __init__.py 
│   │      
│   ├───routes
│   │   │   routes_categories.py
│   │   │   routes_contacts.py
│   │   │   routes_courses.py
│   │   │   routes_enrollments.py
│   │   │   routes_favorites.py
│   │   │   routes_professors.py
│   │   │   routes_professor_studycenter.py
│   │   │   routes_rols.py
│   │   │   routes_students.py
│   │   │   routes_studycenter_student.py
│   │   │   routes_study_centers.py
│   │   │   routes_users.py
│   │   │   routes_user_rol.py
│   │   └───  __init__.py
│   │   
│   ├───schema
│   │   │   category_schema.py
│   │   │   contact_schema.py
│   │   │   course_schema.py
│   │   │   enrollment_schema.py
│   │   │   favorite_schema.py
│   │   │   professor_schema.py
│   │   │   professor_student_schema.py
│   │   │   professor_studycenter_schema.py
│   │   │   rol_schema.py
│   │   │   student_schema.py
│   │   │   studycenter_schema.py
│   │   │   studycenter_student_schema.py
│   │   │   user_rol_schema.py
│   │   │   user_schema.py
│   │   └───  __init__.py
│   │   
│   ├───static
│   │   └───uploads
│   │           crondose.jpg
│   │           dailysmarty.jpg
│   │           dashtrack.jpg
│   │           devcamp.jpg
│   │           devtrunk.jpg
│   │           edutechional.jpg
│   │           eventbrite.jpg
│   │           ministry-safe.jpg
│   │           open-devos.jpg
│   │           quip.jpg
│   │           shop-hacker.jpg
│   │           toastability.jpg
│   │
└───└───utils
        │   delete_course_image.py
        │   save_file.py
        │   sendiblue.py
        │   token_manager.py
        └─── __init__.py
```
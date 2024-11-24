# ShittingDB

## Índice

### Estructura de la base de datos

```markdown
ShittingDB/
│
├── Usuario
│   ├── id: Identificador único (clave primaria)
│   ├── nombre: Nombre del usuario
│   ├── email: Correo electrónico único
│   ├── contraseña: Contraseña cifrada
│   ├── fecha_registro: Fecha de registro
│   ├── biografía: Descripción breve del usuario (opcional)
│   └── perfil_imagen: Imagen de perfil (opcional)
│
├── Publicación (Post)
│   ├── id: Identificador único (clave primaria)
│   ├── usuario: Relación con la tabla Usuario (quién subió la publicación)
│   ├── tipo_contenido: Tipo de contenido (chiste, foto, video)
│   ├── contenido: Texto (para chistes) o URL (para fotos y videos)
│   ├── fecha_subida: Fecha de subida de la publicación
│   ├── likes_count: Contador de "me gusta" (opcional)
│   └── comentarios_count: Contador de comentarios (opcional)
│
├── Comentario (Comment)
│   ├── id: Identificador único (clave primaria)
│   ├── usuario: Relación con la tabla Usuario (quién hizo el comentario)
│   ├── post: Relación con la tabla Post (publicación comentada)
│   ├── contenido: Texto del comentario
│   └── fecha_comentario: Fecha del comentario
│
├── Me gusta (Like)
│   ├── id: Identificador único (clave primaria)
│   ├── usuario: Relación con la tabla Usuario (quién dio el "me gusta")
│   ├── post: Relación con la tabla Post (publicación a la que se dio "me gusta")
│   └── fecha_like: Fecha en que se dio el "me gusta"
│
└── Contenido Guardado (SavedContent)
    ├── id: Identificador único (clave primaria)
    ├── usuario: Relación con la tabla Usuario (quién guardó el contenido)
    ├── post: Relación con la tabla Post (contenido guardado)
    └── fecha_guardado: Fecha en que se guardó el contenido
```

### Estructura del proyecto

```markdown
ShittingDB/
│
├── backend/                 # Proyecto Django
│   ├── api/                 # Aplicación principal
│   │   ├── migrations/      # Migraciones de base de datos
│   │   ├── __init__.py      # Indicador de módulo Python
│   │   ├── admin.py         # Configuración del panel de administración
│   │   ├── apps.py          # Configuración de la aplicación
│   │   ├── models.py        # Modelos de base de datos
│   │   ├── serializers.py   # Serializadores para convertir objetos a JSON
│   │   ├── views.py         # Vistas de la API
│   │   ├── urls.py          # Rutas específicas de la app
│   │   └── tests.py         # Pruebas automatizadas
│   │
│   ├── backend/             # Configuración principal del proyecto
│   │   ├── __init__.py
│   │   ├── asgi.py          # Configuración ASGI
│   │   ├── settings.py      # Configuración global del proyecto
│   │   ├── urls.py          # Rutas globales del proyecto
│   │   └── wsgi.py          # Configuración WSGI
│   │
│   ├── manage.py            # Script para comandos administrativos
│
├── frontend/                # Proyecto Next.js
│   ├── public/              # Archivos estáticos accesibles directamente
│   │   ├── uploads/         # Carpeta para almacenar imágenes/videos (opcional)
│   │   └── favicon.ico
│   │
│   ├── src/                 # Código fuente de la app
│   │   ├── components/      # Componentes reutilizables de React
│   │   │   ├── UploadForm.js# Componente para subir contenido
│   │   │   └── Layout.js    # Layout base para la app
│   │   │
│   │   ├── pages/           # Páginas de la aplicación
│   │   │   ├── index.js     # Página principal
│   │   │   └── _app.js      # Archivo para configuraciones globales
│   │   │
│   │   ├── services/        # Servicios para consumir la API
│   │   │   └── api.js       # Funciones para interactuar con el backend
│   │   │
│   │   ├── styles/          # Archivos de estilo CSS/SCSS
│   │   │   └── globals.css  # Estilos globales
│   │   │
│   │   └── utils/           # Utilidades generales
│   │       └── helpers.js   # Funciones auxiliares
│   │
│   ├── .env.local           # Variables de entorno locales
│   ├── next.config.js       # Configuración de Next.js
│   ├── package.json         # Dependencias del proyecto frontend
│   ├── README.md            # Documentación para el frontend
│
└── README.md                # Documentación principal del proyecto
```

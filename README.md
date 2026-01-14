# Bitacora de Lecturas
Aplicación web desarrollada en Ruby on Rails para la gestión de libros, 
que implementa un CRUD completo y mantiene una separación clara de
responsabilidades entre modelos, controladores y vistas.

## Funcionalidades
- Crear libros
- Listar libros
- Ver detalle de un libro
- Editar información de un libro
- Eliminar libros
- Gestión de estados (pendiente, leyendo, terminado)

## Tecnologías y Herramientas Utilizadas
- Ruby y Ruby on Rails
- PostgreSQL - PGAdmin 4
- HTML y CSS
- Git y GitHub

## Instalación y Ejecución
1. Clonar Repositorio: git clone https://github.com/genrey00/Bitacora_Lecturas
2. Instalar dependencias: bundle install
3. Crear y migrar base de datos: rails db:create || db:migrate
4. Iniciar servidor: rails server

## Estructura del proyecto
- Models: lógica de negocio y relaciones
- Controllers: manejo de solicitudes HTTP
- Views: presentación de la información
- Helpers: lógica de presentación
- Assets: estilos de interfaz

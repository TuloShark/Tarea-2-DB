# Tarea 2 - Bases de Datos

Este repositorio contiene una aplicación web desarrollada en ASP.NET y C# como parte de la segunda tarea del curso de Bases de Datos. El proyecto se centra en la gestión de artículos y usuarios, permitiendo operaciones como inserción, filtrado y registro de eventos en la base de datos.

## Funcionalidades del Proyecto

1. **Interfaz Web**
   - Páginas desarrolladas en ASP.NET para interactuar con la base de datos.
   - Archivos principales:
     - `Inicio.aspx`: Página de inicio.
     - `InsertarArtic.aspx`: Página para insertar nuevos artículos.
     - `WebForm1.aspx`, `WebForm2.aspx`, `WebForm3.aspx`: Páginas adicionales para diversas funcionalidades.

2. **Gestión de Artículos y Usuarios**
   - Inserción de nuevos artículos y usuarios mediante formularios web.
   - Filtrado de artículos por diferentes criterios.
   - Registro de eventos en la base de datos para auditoría.

3. **Base de Datos**
   - Scripts SQL para crear y gestionar las tablas `Articulo`, `ClaseArticulo`, `Usuario` y `EventLog`.
   - Scripts principales:
     - `dbo.Articulo.sql`: Definición de la tabla de artículos.
     - `dbo.ClaseArticulo.sql`: Definición de la tabla de clases de artículos.
     - `dbo.Usuario.sql`: Definición de la tabla de usuarios.
     - `dbo.EventLog.sql`: Definición de la tabla de registro de eventos.
     - `dbo.InsertXML.sql`: Script para inserción de datos en formato XML.
     - `dbo.filtrar_Articulos.sql`, `dbo.filtrar_Cantidad.sql`, `dbo.filtrar_ClaseArticulos.sql`: Scripts para filtrar artículos según diferentes criterios.

## Requisitos de Instalación

Para ejecutar este proyecto, necesitas:

1. **Herramientas**
   - Visual Studio con soporte para ASP.NET.
   - Microsoft SQL Server para la gestión de la base de datos.

2. **Librerías/Paquetes**
   - Dependencias de ASP.NET necesarias en Visual Studio.
   - Configuración del servidor SQL para ejecutar los scripts proporcionados.

## Estructura del Proyecto

- **Páginas Web**
  - `Inicio.aspx`: Página principal del proyecto.
  - `InsertarArtic.aspx`: Página para la inserción de artículos.
  - `WebForm1.aspx`, `WebForm2.aspx`, `WebForm3.aspx`: Páginas adicionales para funcionalidades específicas.

- **Scripts de Base de Datos**
  - `dbo.Articulo.sql`: Script para la creación de la tabla de artículos.
  - `dbo.ClaseArticulo.sql`: Script para la creación de la tabla de clases de artículos.
  - `dbo.Usuario.sql`: Script para la creación de la tabla de usuarios.
  - `dbo.EventLog.sql`: Script para la creación de la tabla de registro de eventos.
  - `dbo.InsertXML.sql`: Script para la inserción de datos en formato XML.
  - `dbo.filtrar_Articulos.sql`: Script para filtrar artículos.
  - `dbo.filtrar_Cantidad.sql`: Script para filtrar por cantidad.
  - `dbo.filtrar_ClaseArticulos.sql`: Script para filtrar por clase de artículos.

- **Archivos del Proyecto**
  - `Usuario.sln`: Archivo de solución para abrir el proyecto en Visual Studio.

## Sobre Mí 🚀

Soy Wander Jiménez, un desarrollador apasionado por las aplicaciones web y la gestión de bases de datos, siempre buscando oportunidades para aprender y mejorar mis habilidades.

## Feedback

Si tienes comentarios o sugerencias, puedes contactarme en: wander.tulo.jimenez@gmail.com

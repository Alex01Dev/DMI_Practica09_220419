# 🎬 Cinemapedia — Proyecto Flutter

<p align="center">
  <img src="imagen1.jpg" alt="Flutter Logo" width="180"/>
  <img src="imagen2.jpg" alt="MovieDB Logo" width="180"/>
  <img src="imagen3.jpg" alt="App Preview" width="180"/>
</p>

---

## ✨ Prácticas 07 y 08 — Desarrollo de Funcionalidades Avanzadas

Este repositorio contiene el avance del proyecto **Cinemapedia**, una aplicación móvil desarrollada en **Flutter**, enfocada en la exploración de películas utilizando la API de **TheMovieDB**, aplicando arquitectura limpia y buenas prácticas de desarrollo.

---

## 🎭 Práctica 07 — Detalle de Películas y Reparto

El propósito de esta práctica fue enriquecer la vista de detalle de cada película, integrando información completa y destacando la participación de los actores que forman parte del elenco.

### ✅ Funcionalidades Implementadas

- 🔀 **Preparación del proyecto:** Clonación y ramificación para la nueva práctica.
- 👤 **Entidad Actor:** Definición del modelo de datos para representar actores.
- 🌐 **Consumo de API:** Ajuste de los datasources para obtener el reparto desde TheMovieDB.
- 🔄 **Mapeo de datos:** Transformación correcta de las respuestas JSON a entidades del dominio.
- 🧠 **Gestión de estado (Riverpod v3):** Providers dedicados para manejar actores por película.
- 🧭 **Navegación (GoRouter):** Rutas configuradas para acceder al detalle de cada película.
- 🎬 **Vista de Detalle:** Presentación del póster, título, calificación y sinopsis.
- 🎭 **Lista de Actores:** Componente visual optimizado para mostrar el elenco.
- 🧪 **Validación:** Pruebas funcionales para asegurar el correcto comportamiento.

---

## 🔍 Práctica 08 — Buscador de Películas

En esta fase se integró un sistema de búsqueda avanzado, permitiendo localizar cualquier película disponible dentro del catálogo de TheMovieDB de manera rápida y eficiente.

### ✅ Funcionalidades Implementadas

- 🔎 **Search Delegate:** Implementación del buscador nativo de Flutter.
- 🌐 **Consultas en tiempo real:** Comunicación directa con la API para resultados dinámicos.
- 🎯 **Experiencia de usuario:** Interfaz clara, fluida y responsiva.
- 🧪 **Pruebas:** Verificación del flujo completo de búsqueda.

---

## 🧱 Arquitectura del Proyecto

La aplicación está organizada siguiendo principios de **Clean Architecture**, separando responsabilidades para facilitar el mantenimiento y escalabilidad.

```text
lib/
├── ⚙️ config/
│   ├── constants/        # Variables de entorno
│   ├── helpers/          # Formateadores y utilidades
│   ├── router/           # Configuración de rutas
│   └── theme/            # Tema visual de la app
│
├── 🧩 domain/
│   ├── datasources/      # Contratos de acceso a datos
│   ├── entities/         # Entidades del dominio
│   └── repositories/    # Interfaces de repositorios
│
├── 🏗️ infrastructure/
│   ├── datasources/      # Implementaciones MovieDB
│   ├── mappers/          # Conversión de modelos
│   ├── models/           # Modelos externos (API)
│   └── repositories/    # Implementaciones de repositorios
│
├── 🎨 presentation/
│   ├── delegates/        # Buscador personalizado
│   ├── providers/        # Gestión de estado (Riverpod)
│   ├── screens/          # Pantallas principales
│   └── widgets/          # Componentes reutilizables
│
└── 🚀 main.dart          # Punto de entrada de la aplicación

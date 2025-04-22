# 🏍️ Bikes API

<div align="center">

## Portal interactivo para explorar motocicletas.

Este es un proyecto personal donde practico la creación de una API con **Node.js** y **Express**, y un frontend moderno con **Vue** + **Tailwind CSS**. El objetivo principal fue afianzar mis conocimientos fullstack, construyendo desde cero una pequeña app funcional e interactiva.
</div>

> Proyecto basado en el curso [Curso de Node.js completo desde cero](https://youtube.com/playlist?list=PLUofhDIg_38qm2oPOV-IRTTEKyrVBBaU7&si=kHFtHssa56rzEsF4) de Midudev.

---

## 🧠 ¿Qué aprendí?

- Crear una API RESTful con Express
- Validar datos con **Zod**
- Organizar un proyecto backend siguiendo buenas prácticas
- Conectar un frontend con backend usando **Axios**
- Gestionar el estado global con **Pinia**

---

## 📁 Estructura del proyecto

```bash
NodeBikesAPI/
│
├── backend/         → API con Node.js + Express
│
└── bikes-store/     → Frontend con Vue 3
```

---

## ▶️ ¿Cómo ejecutar el proyecto?

### 1. Clonar el repositorio

```bash
git clone https://github.com/IliasVilux/NodeBikesAPI.git
cd NodeBikesAPI
```

### 2. Ejecutar el backend

```bash
cd server
npm install
```
Ejecutar el servidor con archivos estáticos (modo local)
```bash
npm run start:local
```
O ejecutar solo la API sin archivos estáticos
```bash
npm run start
```

El backend se ejecuta en `http://localhost:3000`.

### 3. Ejecutar el frontend

```bash
cd bikes-store
npm install
npm run dev
```

La app se abre en `http://localhost:5173`.

---

## 🔐 Variables de entorno

### 📦 Backend `(/server)`

```js
DB_HOST=tu_host_de_base_de_datos
DB_USER=tu_usuario
DB_PASSWORD=tu_contraseña
DB_NAME=nombre_de_tu_base
DB_PORT=puerto_de_tu_base
```

### 🖼️ Frontend `(/bikes-store)`

```js
VITE_API_URL=http://url.com
```
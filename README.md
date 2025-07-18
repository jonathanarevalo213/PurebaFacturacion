# 💼 Proyecto de Facturación - Prueba Técnica Ophelia

Este repositorio contiene la solución completa para la prueba técnica FullStack .  
Incluye:

- 📂 Backend (Java + Spring Boot + SQL Server)
- 📂 Frontend (Angular)
- 🗄️ Scripts de Base de Datos (SQL Server)

---

## 📋 Pasos para levantar el proyecto correctamente

### 1️⃣ Configurar la Base de Datos SQL Server

Antes de ejecutar el backend o el frontend es indispensable tener la base de datos configurada.

#### 📄 Ejecutar los scripts SQL
1. Abre **SQL Server Management Studio (SSMS)**.
2. Ejecuta el script `01-CREACION-BD-TABLAS-DATOS.sql` para crear la base de datos, tablas y datos de prueba.
3. Ejecuta el script `02-CONSULTAS.sql` si deseas verificar las consultas requeridas.

🔔 **Verifica que la BD quede creada con los datos correctamente antes de continuar.**

---

### 2️⃣ Levantar el Backend (Spring Boot - Java)

#### 📂 Ruta: `facturacion/`

#### 🔨 Requisitos:
- Java 17+
- IntelliJ IDEA (o tu IDE de preferencia)
- Maven configurado

#### 🚀 Pasos:
1. Abre el proyecto `facturacion` con IntelliJ IDEA.
2. Configura la conexión a tu SQL Server en `application.properties` (usuario, contraseña, puerto, BD).
3. Ejecuta el proyecto: `FacturacionApplication.java` (Es la clase con `@SpringBootApplication`).
4. Verifica que exponga correctamente las APIs en `http://localhost:8080/api/...`

---

### 3️⃣ Levantar el Frontend (Angular)

#### 📂 Ruta: `facturacion-frontend/`

#### 🔨 Requisitos:
- Node.js 18+
- Angular CLI instalado globalmente (`npm install -g @angular/cli`)
- Visual Studio Code (o tu editor preferido)

#### 🚀 Pasos:
1. Abre la carpeta `facturacion-frontend` en Visual Studio Code.
2. Ejecuta en terminal:
```bash
npm install
ng serve

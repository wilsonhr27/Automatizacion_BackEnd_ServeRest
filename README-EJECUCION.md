
# QA Automation Backend - Karate DSL

## Descripción del proyecto

Este proyecto contiene los casos de pruebas automatizadas para la API de usuarios de **ServeRest**.
El objetivo es validar las operaciones CRUD mediante pruebas automatizadas utilizando **Karate DSL**, asegurando la correcta funcionalidad del servicio.

---

## Tecnologías utilizadas

* Java 17+
* Maven
* Karate DSL
* JUnit 5

---

## Requisitos

Antes de ejecutar el proyecto, se debe tener instalado:

* Java JDK 17 o superior
* Maven
* Git (opcional)

---

## Estructura del proyecto

```
UsuariosServeRest
│
├── .idea
│
├── src
│   └── test
│       └── java
│           └── examples
│               │
│               ├── Data
│               │   ├── Usuario.json
│               │   └── Usuario1.js
│               │
│               ├── UsuariosServeRest
│               │   ├── ActualizarUsuario.feature
│               │   ├── BuscarUsuarioId.feature
│               │   ├── EliminarUsuario.feature
│               │   ├── ListarUsuario.feature
│               │   └── RegistrarUsuario.feature
│               │
│               ├── Usuarios.java
│               │
│               ├── ExamplesTest.java
│               │
│               ├── karate-config.js
│               │
│               └── logback-test.xml
│
├── target
│
├── .gitignore
├── pom.xml
├── README-EJECUCION.md
└── README-INFORME.md
```

---

##  Ejecución de pruebas

Para ejecutar todos los tests por el terminal con el siguiente comando:

```bash
mvn clean test "-Dkarate.options=--tags @regresion -Dkarate.env=dev"
```

-Para ejecutar por cada feature seria con el testrunner de usuario
-Verificar la ejecucion HTML report: (paste into browser to view) | Karate version: 1.5.0
file:///C:/API/UsuariosServeRest/target/karate-reports/karate-summary.html
===================================================================


---

## Base URL

La URL base se configura en el archivo:

```
karate-config.js
```

URL:

```javascript
config.baseUrl = 'https://serverest.dev';
```

---

## Cobertura de pruebas

Se automatizaron los siguientes endpoints:

| Método | Endpoint       | Descripción            |
| ------ | -------------- | ---------------------- |
| GET    | /usuarios      | Listar usuarios        |
| POST   | /usuarios      | Crear usuario          |
| GET    | /usuarios/{id} | Obtener usuario por ID |
| PUT    | /usuarios/{id} | Actualizar usuario     |
| DELETE | /usuarios/{id} | Eliminar usuario       |

---

## Escenarios cubiertos

### ✔ Casos positivos

* Creación exitosa de usuario
* Consulta de lista de usuarios
* Búsqueda por ID existente
* Actualización de usuario
* Eliminación de usuario

### Casos negativos

* Creación con datos inválidos o duplicados
* Búsqueda de usuario inexistente
* Actualización de usuario inexistente
* Eliminación de usuario inexistente

---

## Estrategia de automatización

Se utilizó un enfoque basado en:

* **Separación por endpoints**: cada recurso tiene su propio feature file
* **Reutilización de código** mediante `Background`
* **Datos dinámicos** generados con helpers (`usuario.js`)
* **Pruebas independientes** para evitar dependencias entre escenarios
* **Validaciones de respuesta** usando `match` de Karate

---

## Manejo de datos de prueba

Se implementó un generador de datos dinámicos para evitar conflictos como:

* Emails duplicados
* Datos repetidos

dato:

```javascript
var random = Math.floor(Math.random() * 10000);
```

---

# Informe de Automatización QA Backend

## 1. Introducción

El presente informe describe la estrategia, diseño e implementación de las pruebas automatizadas desarrollada para la API de usuarios de ServeRest.

El objetivo principal fue validar el correcto funcionamiento de las operaciones CRUD (Create, Read, Update, Delete), asegurando la calidad del servicio mediante pruebas automatizadas utilizando Karate DSL.

---

## 2. Objetivo de la Automatización

* Validar el funcionamiento del flujo correcto de la API de usuarios
* Detectar posibles errores en escenarios positivos y negativos
* Garantizar la integridad de las respuestas del servicio


---

## 3. Arquitectura de la Solución

El proyecto fue estructurado siguiendo buenas prácticas de automatización:

* **Separación por capas**:

    * Features: escenarios de prueba
    * Helpers (usuario): generación de datos dinámicos
    * Configuración: manejo de entornos

* **Organización por endpoints**:
  Cada recurso de la API cuenta con su propio archivo `.feature`

* **Ejecución centralizada**:
  A través de un TestRunner utilizando JUnit 5

---

## 4. Estrategia de Pruebas

Se implementó una estrategia basada en:

### ✔ Cobertura funcional (CRUD)

Se automatizaron los siguientes endpoints:

* GET /usuarios
* POST /usuarios
* GET /usuarios/{id}
* PUT /usuarios/{id}
* DELETE /usuarios/{id}

---

### ✔ Casos positivos

* Creación exitosa de usuario
* Consulta de lista de usuarios
* Búsqueda de usuario existente
* Actualización de usuarios
* Eliminación de usuarios del sistema
---
### ✔ Casos negativos

* Creación de usuario con datos duplicados o inválidos
* Consulta de usuario inexistente
* Actualización de usuario no registrado
* Eliminación de usuario inexistente

---

## 5. Patrones y Buenas Prácticas Aplicadas

###  Reutilización de código

Se utilizó la sección `Background` de Karate para definir configuraciones comunes como la URL base.

---

###  Generación dinámica de datos

Se implementó un helper (`usuario.js`) para generar datos únicos en cada ejecución, evitando conflictos por duplicidad (ej. emails).

---

###  Independencia de pruebas

Cada escenario es autónomo, evitando dependencias entre tests, lo que mejora la estabilidad y mantenibilidad.

---

###  Validación de respuestas

Se utilizaron validaciones como:

* Código de estado HTTP
* Estructura de la respuesta
* Contenido de campos específicos
* Mensajes de éxito/error

---

###  Organización escalable

La estructura del proyecto permite agregar nuevos endpoints o escenarios sin afectar la base existente.

---

## 6. Validaciones Implementadas

* Verificación de status codes (200, 201, 400)
* Validación de existencia de campos en la respuesta
* Comparación de valores esperados
* Validación de IDs generados
* Verificación de mensajes de respuesta

---

##  7. Manejo de Entornos

Se utilizó el archivo `karate-config.js` para:

* Definir la URL base de la API
* Permitir ejecución por ambientes (`dev`)
* Centralizar configuraciones

---

## 8. Ejecución de Pruebas

Las pruebas se ejecutan mediante Maven con el comando:

```bash
mvn test
```

También se puede ejecutar por entorno:

```bash
mvn test -Dkarate.env=dev
```

---


## 11. Conclusión

La solución implementada cumple con los objetivos planteados, proporcionando los casos de pruebas automatizadas escalable y mantenible.

El uso de Karate DSL permitió simplificar la automatización de APIs, logrando una cobertura adecuada de los escenarios críticos del sistema.

---

# PROYECTO RESERVAS | RODRIGUEZ

## **PREENTREGA DE PROYECTO**


**CURSO:** *SQL*

**ALUMNA**: *RODRIGUEZ, MAYRA ALEJANDRA*

**COMISIÓN:** *57190* 

**TUTOR:** *ARIEL ANNONE*

**DOCENTE:** *ANDERSON MICHEL TORRES*


---

**CONSIGNAS**

- *Descripción de la temática de la base de datos.*
- *Diagramas de entidad relación de la base de datos.*
- *Listado de las tablas que comprenden la base de datos, con descripción de cada tabla, listado de campos, abreviaturas de nombres de campos, nombres completos de campos, tipos de datos, tipo de clave (foránea, primaria, índice(s).*

- ***Un archivo .sql que contenga:** Script en SQL de creación de la base de datos y tablas. Este puede estar publicado en un repositorio github, con lo cual el documento pdf debe contener los links de las publicaciones.*

- ***Formato:** Aclarar el tipo de archivo en que se espera el desafío. Aclarar que debe tener el nombre “Idea+Apellido”.*

---

## PROBLEMA
*Se está desarrollando un sistema de gestión de reservas de las actividades para un club con varias sedes, que permita poder  manejar todas las operaciones relacionadas con las mismas.*


## DESCRIPCIÓN DEL PROBLEMA

***1. Gestión de socios y actividades:** Necesitamos una base de datos que nos permita registrar la información de los socios y de las actividades que reservan en cada una de las sedes.*

***2. Gestión de reservas y disponibilidad:** La base de datos debe permitirnos registrar la disponibilidad de las reservas de cada actividad. Esto nos permitirá evitar conflictos de reservas.*

***3. Registro de reservas:** Necesitamos un sistema que pueda registrar de manera detallada cada reserva realizada.*


## DESCRIPCIÓN
*Necesitamos una base de la base para nuestro club que permita registrar las reservas que realizan los socios para las actividades que brindamos  todos los días.*


## TABLAS

**1. SOCIOS**
- *Almacena información sobre los socios que realizan reservas.*
- ***Atributos:** ID_SOCIO (PK), NOMBRE, APELLIDO, DNI, TELÉFONO, EMAIL Y FECHA_ALTA.*

**2. RESERVAS**
- *Registra las reservas realizadas por los socios del club.*
- ***Atributos:** ID_RESERVA (PK), FECHA_HORA, CANCELACIÓN, ID_SOCIO (FK) , ID_ACTIVIDAD (FK), ID_PROFESOR (FK) Y ID_SEDE (FK).*

**3. ACTIVIDADES**
- *Contiene información sobre las actividades disponibles en el club.*
- ***Atributos:** ID_ACTIVIDAD (PK), NOMBRE, FECHA_HORA, DISPONIBILIDAD Y ID_PROFESOR (FK).*

**4. SEDE**
- *Contiene información de las sedes que tenemos sobre las cuáles se realizarán las reservas de las actividades.*
- ***Atributos:** ID_SEDE (PK), DIRECCIÓN, TELÉFONO y ID_DUEÑO (FK).*

**5. DUEÑO**
- *Contiene información de los dueños de cada una de nuestras sedes.*
- ***Atributos:** ID_DUEÑO (PK), NOMBRE, APELLIDO, TELÉFONO.*

**6. PROFESORES.**
- *Contiene información de los profesores que realizan las actividades en nuestras sedes.*
- ***Atributos:** ID_PROFESOR (PK), NOMBRES, APELLIDO, DNI, TELÉFONO, ALTA, ID_ACTIVIDAD (FK), ID_SEDE (FK).*

--- 

## **SEGUNDA PREENTREGA DE PROYECTO**

--------------------------------------------------------------------------------------------
CONSIGNAS.

SE DEBE ENTREGAR:

- LISTADO DE VISTAS MÁS UNA DESCRIPCIÓN DETALLADA,SU OBJETIVO Y QUÉ TABLAS LAS COMPONEN.

- LISTADO DE FUNCIONES QUE INCLUYAN UNA DESCRIPCIÓN DETALLADA,EL OBJETIVO PARA LA CUAL FUERON CREADAS Y QUÉ DATOS O TABLAS MANIPULAN Y/O SON IMPLEMENTADAS.

- LISTADO DE STORED PROCEDURES CON UNA DESCRIPCIÓN DETALLADA, QUÉ OBJETIVOS O BENEFICIOS APORTAN AL PROYECTO Y/O TABLAS CON LAS QUE INTERACTÚA.

UN ARCHIVO .SQL QUE CONTENGA:
SCRIPT DE INSERCIÓN DE DATOS EN LAS BASES.
SI SE INSERTAN DATOS MEDIANTE IMPORTACIÓN,AGREGAR  EL PASO A PASO DE ÉSTE EN EL DOC PDF, MÁS LOS ARCHIVOS CON EL CONTENIDO A IMPORTAR,EN EL FORMATO QUE CORRESPONDA.
SCRIPT DE CREACIÓN DE VISTAS, FUNCIONES,STORED PROCEDURES Y TRIGGERS.

FORMATO:
DOCUMENTO PDF CON EL NOMBRE “ENTREGA2 + APELLIDO”.

----------------------------------------------------------------------------------------

**LISTADO DE VISTAS.**

VISTA N° 1:
CREAREMOS UNA VISTA QUE SE OCUPE DE MOSTRARNOS LAS ALTAS DE LOS SOCIOS ENTRE EL 01/01/2024 Y 30/06/2024.PARA ESO UTILIZAREMOS LA TABLA “SOCIOS” Y EL ID SOCIO,NOMBRE, APELLIDO Y FECHA DE ALTA.


VISTA N° 2:
PARA VISUALIZAR LAS RESERVAS QUE SE REALIZAN SOBRE LA ACTIVIDAD “FÚTBOL” EN LAS DISTINTAS SEDES.UTILIZAREMOS LA TABLA “RESERVAS” Y EL ID RESERVAS, ID ACTIVIDAD (ID 12) E ID SEDE.


VISTA N° 3:

NECESITAMOS SABER LOS NOMBRES DE LOS  PROFESORES DICTAN LA ACTIVIDAD “SPINNING” Y EL DOMICILIO DE LA SEDE. PARA ESTO,NECESITAMOS UTILIZAR LA TABLA “ACTIVIDADES”,“PROFESOR”  Y “SEDE” CON  ID ACTIVIDAD, NOMBRE (“SPINNING”),APELLIDO  DEL PROFESOR Y DOMICILIO.


VISTA N° 4:
CREAMOS UNA VISTA PARA SABER CUÁNTOS PROFESORES TENEMOS EN CADA UNA DE NUESTRAS SEDES Y QUÉ ACTIVIDADES DICTAN.PARA ELLO,NECESITAMOS UTILIZAR LAS TABLAS “SEDE”, “PROFESORES” Y “ACTIVIDADES” CON EL ID SEDE,NOMBRE DEL PROFESOR Y LA ACTIVIDAD.


VISTA N° 5:
NECESITAMOS SABER LA DISPONIBILIDAD CON LA QUE CONTAMOS PARA LA ACTIVIDAD “PILATES”.
UTILIZAREMOS LAS TABLAS “RESERVAS”, “ACTIVIDADES” Y “SEDE” CON EL ID ACTIVIDAD, NOMBRE, FECHA Y HORA Y LA DIRECCIÓN DE LA SEDE  PARA VISUALIZAR ESTA INFORMACIÓN.


VISTA N° 6:
CREAMOS UNA VISTA QUE SE ENCARGUE DE MOSTRARNOS LAS ACTIVIDADES QUE DICTAMOS UTILIZANDO LA TABLA “ACTIVIDADES” CON EL ID ACTIVIDADES Y EL NOMBRE.



--------------------------------------------------------------------
**LISTA DE FUNCIONES**

1. FUNCIÓN PARA CONTAR EL NÚMERO DE RESERVAS DE UN SOCIO ESPECÍFICO:ESTA FUNCIÓN TOMARÁ EL ID DE UN SOCIO Y DEVOLVERÁ EL NÚMERO DE RESERVAS QUE HA HECHO.
SE USARÁ LA TABLA “RESERVAS” PARA BRINDAR ESTA INFORMACIÓN.

2. FUNCIÓN PARA OBTENER EL NOMBRE COMPLETO DE UN PROFESOR QUE DICTA UNA ACTIVIDAD ESPECÍFICA:ESTA FUNCIÓN TOMARÁ EL NOMBRE DE UNA ACTIVIDAD Y DEVOLVERÁ EL NOMBRE COMPLETO DEL PROFESOR QUE LA DICTA. UTILIZANDO LAS TABLAS “ACTIVIDADES” Y “PROFESORES”.

3. FUNCIÓN PARA OBTENER LA DIRECCIÓN DE LA SEDE DONDE UN PROFESOR DICTA UNA ACTIVIDAD:ESTA FUNCIÓN TOMARÁ EL ID DE UN PROFESOR Y DEVOLVERÁ LA DIRECCIÓN DE LA SEDE DONDE DICTA UNA ACTIVIDAD. USANDO INFORMACIÓN DE LAS TABLAS “SEDE” Y “PROFESORES”.

--------------------------------------------------------------------
**LISTA DE STORED PROCEDURES.**


1. PROCEDIMIENTO PARA INSERTAR UN NUEVO SOCIO:ESTE PROCEDIMIENTO ALMACENADO INSERTA UN NUEVO REGISTRO EN LA TABLA SOCIOS.

2. PROCEDIMIENTO PARA ACTUALIZAR LA DISPONIBILIDAD DE UNA ACTIVIDAD:ESTE PROCEDIMIENTO ALMACENADO ACTUALIZA EL ESTADO DE DISPONIBILIDAD DE UNA ACTIVIDAD ESPECÍFICA.

3. PROCEDIMIENTO PARA ACTUALIZAR LA INFORMACIÓN DE UN SOCIO:ESTE PROCEDIMIENTO ALMACENADO ACTUALIZA LA INFORMACIÓN DE UN SOCIO EN LA TABLA SOCIOS.


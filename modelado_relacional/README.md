# Laboratorio Modelado Relacional

## Enunciado
Una startup tecnol�gica va a desarrollar un portal de ELearning y nos ha pedido que realizamos el modelo de datos de dicho sistema.

A tener en cuenta:

* Va a ser un portal orientado al mundo de la programaci�n.
* El portal va a estar compuesto por cursos, cada curso est� compuesto a su vez por un n�mero de videos y art�culos que lo acompa�en.
* Los videos y el contenido de cada art�culo se almacenan en un storage S3 y en un headless CMS, en la base de datos s�lo almacenaremos los Id's a esos recursos.
* Los videos se puede clasificar por tem�ticas (Devops / Front End / Back End / ...)
* Los videos tienen autores (ponemos la restricci�n, un video tiene un autor), un curso puede tener varios autores.

### Parte obligatoria
Generar un modelado que refleje los siguiente requerimientos:

* Queremos mostrar los �ltimos cursos publicados.
* Queremos mostrar cursos por �rea (devops / front End ...).
* Queremos mostrar un curso con sus videos.
* En un video queremos mostrar su autor.

### Parte opcional
Tener un s�lo nivel de �reas es limitado, lo suyo ser�a tener una estructura jer�rquica, por ejemplo:
* Front End >> React
* Front End >> React >> Testing
* Front End >> Angular
* Devops >> Dockers
* Devops >> Serverless
* Backend >> nodejs
* Backend >> nodejs >> Express
* Backend >> mongo
Van a haber videos publicos y privados, es decir:
* Un curso puede ser 100% publico.
* Un curso puede tener una parte inicial 100% p�blica, y otra s�lo para subscriptores.
* Esto implica que hayan usuarios registrados y subscripciones.

## Resoluci�n
![picture alt](./lab_modelado_relacional.drawio.png "Diagrama modelado relacional")
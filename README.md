# Proyecto Woffu

Bienvenido al proyecto de la herramienta para el fichaje de Woffu.

Este README proporciona una visión general del proyecto y cómo configurarlo.

## Descripción

Esta herramienta tiene como objetivo automatizar el fichaje de la plataforma Woffu mediante un script de consola de Windows y la aplicación de tareas programadas de windows.

No solicita ni envia ninguna información personal a ningun sitio que no sea el de la propia plataforma de woffu.

El codigo es totalmente tranparente para el que quiera pueda revisarlo y comprobar que no existe codigo malisioso en el mismo.

Al ser un script de power shell no es interpretado como codigo malisioso como pudiera pasar con otro tipos de lenguajes.

No tiene ninguna dependencia de leguaje de programación para que cualquiera sin necesidad de conocimiento de desarrollo pueda utilizarla.


## Consideraciones previas

El fichero sign.ps1 es un script de la consola de comandos de power shell de windows que contiene unos valores que deben ser remplazados por las credenciales de la plataforma para que funcionen corractamente.

La plataforma no tiene refresh token por lo que no hace falta solicitar el token constantemente.

La aplicacion registra el posicionamiento de latitud y longitud desde donde se ha realizado la accion de fichaje de entrada y salida, el fichero sign.ps1 tiene las coordenadas de puerta del sol, debeis cambiarlas por las de vuestro lugar de preferencia que se entiende deberia ser la oficina o vuestra casa.

[Google Maps](https://www.google.com/maps/place/40%C2%B025'00.6%22N+3%C2%B042'07.8%22W/@40.4168317,-3.7021639,607344m/data=!3m1!1e3!4m4!3m3!8m2!3d40.4168317!4d-3.7021639?hl=en&entry=ttu&g_ep=EgoyMDI1MDEyMi4wIKXMDSoASAFQAw%3D%3D)

## Descarga del proyecto

Para aquellos que conocen Git, con clonarlo debería bastar. Para los que no saben usar Git, pueden descargar el archivo ZIP.

![Imagen 1](https://github.com/HGMENA-WORKSPACE/woffu/blob/master/00000.png?raw=true)

Descompriman en la carpeta que más les guste, pero tengan en cuenta que esta será desde donde se ejecute el script y deben cambiarlo en los diferentes ficheros.

![Imagen 2](https://github.com/HGMENA-WORKSPACE/woffu/blob/master/00001.png?raw=true)

![Imagen 3](https://github.com/HGMENA-WORKSPACE/woffu/blob/master/00002.png?raw=true)

## Preparación de credenciales

Lo primero que necesitamos son nuestras credenciales que ya persisten en la propia plataforma. Vamos a la página de fichaje de Woffu y damos clic derecho sobre la pantalla. En el menú seleccionamos "Inspeccionar".

![Imagen 4](https://github.com/HGMENA-WORKSPACE/woffu/blob/master/00003.png?raw=true)

Nos ubicamos en la última pestaña que es la de "Aplicación".

![Imagen 5](https://github.com/HGMENA-WORKSPACE/woffu/blob/master/00004.png?raw=true)

En ella buscamos en la zona de cookies y nos aseguramos que sea la referente a la plataforma de Woffu de Glint.

![Imagen 6](https://github.com/HGMENA-WORKSPACE/woffu/blob/master/00005.png?raw=true)

Aquí estarán todas las cookies para el sitio web. Podemos buscar con el nombre la que necesitamos.

![Imagen 7](https://github.com/HGMENA-WORKSPACE/woffu/blob/master/00006.png?raw=true)

Y vamos reemplazando en el fichero `sign.ps1`.

![Imagen 8](https://github.com/HGMENA-WORKSPACE/woffu/blob/master/00007.png?raw=true)

## Creación de Tareas

Para que el script se ejecute los días que queremos, debemos programarlo en Windows. Buscamos la aplicación de tareas de Windows.

![Imagen 9](https://github.com/HGMENA-WORKSPACE/woffu/blob/master/00008.png?raw=true)

Y abrimos la aplicación.

![Imagen 10](https://github.com/HGMENA-WORKSPACE/woffu/blob/master/00009.png?raw=true)

Si saben crear las tareas, háganlo ustedes mismos. De lo contrario, las importamos del proyecto descargado. Vamos a "Importar tareas".

![Imagen 11](https://github.com/HGMENA-WORKSPACE/woffu/blob/master/00010.png?raw=true)

Desde la carpeta donde descomprimimos, importamos los XML. Empezad por el de fichaje entrada y de allí en adelante revisad los que necesitan.

![Imagen 12](https://github.com/HGMENA-WORKSPACE/woffu/blob/master/00011.png?raw=true)

Si todo ha salido bien, veremos la tarea creada en la biblioteca de tareas.

![Imagen 13](https://github.com/HGMENA-WORKSPACE/woffu/blob/master/00012.png?raw=true)

## Contribuir

Si deseas contribuir al proyecto, por favor sigue los siguientes pasos:

1. Haz un fork del repositorio.
2. Crea una nueva rama (`git checkout -b feature/nueva-funcionalidad`).
3. Realiza tus cambios y haz commit (`git commit -am 'Añadir nueva funcionalidad'`).
4. Sube tus cambios (`git push origin feature/nueva-funcionalidad`).
5. Abre un Pull Request.

## Licencia

Este proyecto fue creado por Harley Mena Castro y está licenciado bajo la Licencia MIT. Consulta el archivo `LICENSE` para más detalles.

## Contacto

Para cualquier consulta, puedes contactarnos en:

[harleymena.dev@hotmail.com](mailto:harleymena.dev@hotmail.com)

[harleymena.dev@gmail.com](mailto:harleymena.dev@gmail.com)

Informe de Optimización - SkyFly Airlines

A) Descripcion del Proyecto:
   La aerolinea SkyFly Airlines de origen Ruso ha contratado a la consultora Smart Data Solutions para llevar a cabo un analisis de sus datos sobre sus vuelos y sus pasajeros para poder obtener insights valiosos y tomar decisiones estratégicas.

B) Descripción del Problema y contexto: 

Las aerolíneas se enfrentan actualmente a numerosos desafíos, entre ellos, una creciente competencia por las rutas, incrementos en el precio del petróleo, conflictos laborales y elevados impuestos. Este problema afecta la rentabilidad de la aerolínea. 

C) Objetivo Principal:

El objetivo principal del proyecto es identificar, a través del análisis de datos, patrones y áreas de mejora en los indicadores claves relacionados con la eficiciencia de la aerolinea y la experiencia del cliente. Se buscará obtener insights que permitan a SkyFly diseñar una estrategia enfocada en optimizar su operatoria y aumentar la lealtad de los pasajeros.
El valor agregado de este proyecto, radica en que nuestras recomendaciones se basan en datos precisos y accionables, lo que posibilita una toma de decisiones basada en evidencias.

D) Resultados esperados & Impacto 

El proyecto contribuirá a transformar la manera en que la aerolínea administra sus vuelos e interactúa con sus clientes, permitiendo posicionar a SkyFly de manera más competitiva en el mercado, lo que se traducirá en una mejora en la rentabilidad en el mediano plazo.

E) Entregable: AGREGAR LO DE ANALISIS PREDICTIVOS _?????????????

Smart Data Solutions le presentará el 13 de Diciembre del 2024 un Informe interactivo a la empresa que consta de un Dashborad con los KPI´s claves, analisis especificos y recomendaciones a los Directivos para avanzar con acciones concretas en la empresa en un corto plazo.

F) Responsables del Informe:

      1) Empresa: Smart Data Solutions.
      Consultora global especializada en análisis de datos con mas de 10 años en el mercado.
      
      2) Colaboradores: Noelia Adagio, Marcela Camerota, Francisco Antonacci, Josefina Perez Alisedo

G) Tecnologias Utilizadas: COMPLETAR
 MySQL - Server: Base de Datos
🐍 Python: Utilizado para realizar el EDA. Librerías: Pandas, Numpy, Matplotlib, Seaborn.
📊 Power BI: Se utiliza Power Query para la limpieza de datos. Power BI para la creación del Informe (Dashboard y análisis con visualizaciones interactivas)

H) Base de Datos:
La base de datos proporcionada por el cliente consta de 8 tablas relacionadas en un formato SQLite.  Abarca información de sus vuelos, aeropuertos en los que opera, aeronaves de su tropa, reservas, etc en un período de Junio a Septiembre del 2017. Las tablas son:

    aircrafts_data: Contiene la información sobre los aviones (9 filas, 3 columnas)
    airports_data: Contiene la data de los aeropuertos (104 filas, 5 columnas)
    boarding_passes: Detalles sobre los boletos de embarque (579686 filas, 4 columnas)
    bookings: Datos de las reservas (262788 filas, 3 columnas)
    flights: Información de cada vuelo (33121 filas, 10 columnas)
    seats: Información sobre los asientos de los aviones (1339 filas, 3 columnas)
    tickets_flights: Detalles de los tickets, los vuelos correspondientes y el precio (1045726 filas, 4 columnas)
    tickets: Información de los tickets y de los pasajeros correspondientes (366733 filas, 3 columnas)

I) Tareas
El proyecto se divide en las siguientes fases:
A)Base de Datos: Obtención de la base de datos del cliente en formate SQLite. 





# Proyecto final henry

## Paquetes necesarios para la app
1. instalar:

pymysql: driver para conectar python con mysql
```
pip install pymysql
```
dotenv: maneja las variables de entorno para credenciales
```
pip install python-dotenv
```
2. Renombrar el archivo .envTemplate a .env y completar los datos con las credenciales correctas

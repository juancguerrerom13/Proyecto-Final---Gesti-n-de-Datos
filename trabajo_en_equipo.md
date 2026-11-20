# Trabajo en equipo

**Proyecto:** Reputación de Banco Davivienda a partir de las quejas de sus clientes (Gestión de Datos, Pontificia Universidad Javeriana).

**Integrantes:** Luis Alberto Banda, Maria Camila Rincón, Juan Pablo Marin, Gabriel Camilo Velasquez y Juan Camilo Guerrero.

## 1. Reglas del equipo

### División de responsabilidades

| Integrante | Responsabilidad inicial |
|---|---|
| Juan Camilo Guerrero | Montaje del entorno de trabajo: contenedor Docker con Jupyter Lab para ejecutar el notebook (Dockerfile, docker-compose.yml y requirements.txt). |
| Luis Alberto Banda | Selección y filtrado de las bases de datos del proyecto en datos.gov.co. |
| Gabriel Camilo Velasquez | Selección y filtrado de las bases de datos del proyecto en datos.gov.co. |
| Maria Camila Rincón | Selección y filtrado de las bases de datos del proyecto en datos.gov.co. |
| Juan Pablo Marin | Definición de los objetivos del proyecto a partir de las bases de datos seleccionadas. |

### Responsabilidades compartidas

Durante el desarrollo, los cinco integrantes:

- Evaluamos los resultados que generaba el agente de IA con los datos seleccionados.
- Discutimos en conjunto qué datos filtrar y cuáles mantener.
- Trabajamos el análisis de los datos tratados y los ajustamos de acuerdo con el objetivo del proyecto.

### Acuerdos de trabajo

- Todas las sesiones se hicieron en conjunto por Microsoft Teams, con la asistencia de los cinco integrantes.
- Las decisiones sobre los datos y el enfoque del proyecto se tomaron entre los cinco.
- Para el uso del agente de IA se definieron reglas en el archivo de instrucciones del proyecto (`.claude/CLAUDE.md`):
  - Responder y comentar el código en español.
  - No inventar resultados: toda cifra debe salir de la ejecución del notebook.
  - No instalar librerías fuera de las autorizadas sin preguntar.
  - No enviar los datos fuera de la máquina local.
  - Registrar cada prompt de generación de código en la [bitácora agéntica](bitacora_agentica.md).

## 2. Reuniones realizadas

| Fecha | Modalidad | Asistentes | Actividades |
|---|---|---|---|
| Lunes 16 de noviembre de 2026 | Microsoft Teams | Los 5 integrantes | Puntos 2, 3 y 4 del enunciado |
| Martes 17 de noviembre de 2026 | Microsoft Teams | Los 5 integrantes | Puntos 5 y 6 del enunciado |
| Jueves 19 de noviembre de 2026 | Microsoft Teams | Los 5 integrantes | Elevator pitch y punto 7 |

### Detalle de las actividades

**Lunes 16 de noviembre: carga y exploración de los datos (puntos 2, 3 y 4)**
- Montaje y verificación del entorno Docker con Jupyter Lab; el notebook se ejecutó dentro del contenedor.
- Selección de las fuentes: quejas de consumidores financieros (`xyy7-rn7p`) y entidades vigiladas por la Superintendencia Financiera (`sr9n-792w`) como datos principales, y las 10.000 empresas más grandes del país (`6cat-2gcs`) como dato complementario.
- Definición del enfoque en la marca **Banco Davivienda** y de las tres preguntas del proyecto.
- Descarga completa de las tres APIs con paginación y copia cruda en Parquet. Fecha de corte de los datos: 16/11/2026.
- Exploración: inventario y perfil por atributo, tendencia central, dispersión, sesgo y tablas de contingencia, correlación y covarianza, y análisis de calidad con 75 reglas en seis dimensiones.

**Martes 17 de noviembre: preparación y visualización (puntos 5 y 6)**
- Preparación de los datos enfocada en Davivienda:
  - limpieza de nulos disfrazados ("Pendiente", NIT en cero);
  - filtro al universo de 31 bancos;
  - unificación de motivos y homologación de departamentos;
  - tratamiento de los meses sin datos o incompletos.
- Construcción de variables derivadas (participación, variaciones, composición frente a los demás bancos, quejas por gran empresa) y persistencia en Parquet y SQLite.
- Visualización para un lector de periódico: 9 gráficos con su lectura y una síntesis por pregunta.
- Revisión del hilo conductor del notebook para que cada punto preparara el siguiente y las cifras coincidieran entre secciones.
- Construcción del reporte interactivo en Power BI con tema oscuro.

**Jueves 19 de noviembre: elevator pitch y trabajo en equipo (punto 7)**
- Páginas de pitch en el reporte de Power BI: el problema, las causas y la propuesta para un patrocinador.
- Organización del reporte: portada, tres páginas de pitch para los 5 minutos y tres páginas de detalle para las preguntas.
- Documentación del trabajo en equipo (este archivo) y README del repositorio para publicarlo en GitHub.

## 3. Principales decisiones tomadas en conjunto

| Decisión | Motivo |
|---|---|
| Enfocar el proyecto en Banco Davivienda y compararlo con los demás bancos | Es el segundo banco con más quejas del país (14,1 % de las quejas a bancos), y sus pares naturales son los demás bancos, no las aseguradoras ni los fondos. |
| Usar las quejas y el directorio de la Superfinanciera como datos principales y las 10.000 empresas como complementarios | Las quejas miden la percepción de los clientes; las empresas aportan el contexto de la matriz (Grupo Bolívar) y del tamaño económico de cada departamento. |
| Mantener los datos descargados el 16/11/2026, aunque el portal se actualizó al día siguiente | Conservar una fecha de corte única para que todas las cifras del proyecto sean consistentes. |
| No imputar los meses sin datos (febrero de 2026) ni el mes incompleto (septiembre de 2026), sino excluirlos de promedios y tendencias | Inventar un mes alteraría la tendencia; excluirlo es más transparente. |
| Conservar las quejas sin departamento con la etiqueta "SIN INFORMACIÓN" | Son quejas reales: eliminarlas subestimaría el total. |
| Agrupar 163 motivos y decenas de productos en categorías más amplias | Permite comparar a Davivienda con el sector e identificar los problemas propios de la marca. |

## 4. Evaluación del trabajo

### Autoevaluación

| Integrante | Aportes principales | Calificación (1–5) |
|---|---|---|
| Luis Alberto Banda | Selección y limpieza de los datos generales para el análisis exploratorio del conjunto completo de datos. | 5 |
| Maria Camila Rincón | Selección de la base de datos a trabajar; aportó en el desarrollo del contexto del negocio y en la definición de los objetivos del proyecto. | 5 |
| Juan Pablo Marin | Aportó en el desarrollo de los objetivos y en el análisis de los datos específicos de Banco Davivienda; lideró la toma de decisiones del equipo sobre los datos trabajados. | 5 |
| Gabriel Camilo Velasquez | Aportó en la selección de la base de datos de quejas; tomó las decisiones sobre los datos de las quejas recibidas, con el apoyo de Juan Pablo. | 5 |
| Juan Camilo Guerrero | Lideró las reuniones y el manejo del entorno de desarrollo en VS Code con los datos compartidos por el equipo; estructuró el notebook y manejó el agente de IA que desarrolló el código de análisis; subió el proyecto a GitHub para que el equipo pudiera replicar el desarrollo. | 5 |

### Evaluación de pares

Calificación (1–5) que cada integrante (columnas) asigna a sus compañeros (filas).

| Evaluado ↓ / Evaluador → | Luis | Maria Camila | Juan Pablo | Gabriel | Juan Camilo |
|---|---|---|---|---|---|
| Luis Alberto Banda | — | 5 | 5 | 5 | 5 |
| Maria Camila Rincón | 5 | — | 5 | 5 | 5 |
| Juan Pablo Marin | 5 | 5 | — | 5 | 5 |
| Gabriel Camilo Velasquez | 5 | 5 | 5 | — | 5 |
| Juan Camilo Guerrero | 5 | 5 | 5 | 5 | — |

**Justificación de la calificación.** Nos calificamos de esta forma por el trabajo en equipo y la coordinación que tuvimos para proponer y desarrollar el proyecto, sus entregables y la presentación.

# Contexto del proyecto:
- El proyecto a desarrollar se encuentra en el archivo Proyecto_Final.pdf con las instrucciones de lo que hay que hacer.
- Objetivo: monitorear la reputación de la marca **Banco Davivienda** a partir de las quejas de sus clientes y compararla con los demás bancos del país.
- Se debe realizar una bitácora agéntica en un archivo markdown dentro de este repositorio. Aquí se debe poner el rol, la tarea, el formato, el prompt del usuario, el modelo de IA usado, el consumo en tokens (o créditos) y una columna que explique lo que se realizó. No incluyas preguntas que te haga sobre el desarrollo del proyecto, solo las que sean puntualmente de generación de código del notebook jupyter en el contenedor.
- Se debe realizar un README.md que explique el repositorio (proyecto). Por favor incluye los nombres de los integrantes del grupo al inicio del readme.
- Entorno: contenedor con Jupyter Lab (imagen quay.io/jupyter/scipy-notebook), ejecutado con Docker (Dockerfile, docker-compose.yml, requirements.txt).
- Notebook: uno solo, notebooks/Proyecto_Final.ipynb, con una sección por punto del pdf.
- Librerías: pandas, requests, jsonpath-ng, python-dotenv, pyarrow y sqlite3 (incluida en Python).
- Carpeta de trabajo: ./work (en el contenedor: /home/jovyan/work).
- APIs (datos.gov.co, SODA2, no requieren clave):
  - Principales: 1. Quejas de consumidores financieros: https://www.datos.gov.co/resource/xyy7-rn7p.json 2. Entidades vigiladas por la Superintendencia Financiera: https://www.datos.gov.co/resource/sr9n-792w.json
  - Complementaria: 3. 10.000 empresas más grandes del país: https://www.datos.gov.co/resource/6cat-2gcs.json
- Marca: Banco Davivienda (tipo_entidad = 1, cod_entidad = 39 en la Superfinanciera). Pertenece a Grupo Bolívar S.A., que sí aparece en la tabla de las 10.000 empresas (NIT 830025448).
- Integrantes: Luis Alberto Banda, Maria Camila Rincón, Juan Pablo Marin, Gabriel Camilo Velasquez y Juan Camilo Guerrero (grupo de 5 personas).
- Datos y salidas (dentro de ./work): copia cruda de las APIs en work/data/raw/*.parquet, tablas preparadas en work/data/processed/*.parquet, base SQLite work/reputacion_davivienda.db y gráficos en work/figuras/*.png.
- Fecha de corte: la fecha de descarga de los datos se calcula en el punto 2 del notebook y debe citarse junto a las cifras.

# Reglas del agente:
- Responde y comenta el código desarrollado en español tanto en los archivos markdown como en las celdas del jupyter notebook.
- Nunca inventes resultados: todo número debe estar respaldado y salir de ejecutar código en el notebook.
- No instales librerías nuevas sin preguntar.
- No envíes datos fuera de la máquina local.
- Registrar cada prompt en la bitácora agéntica (Rol, Tarea, Formato; modelo; créditos; qué se corrigió).
- Librerías permitidas: pandas, numpy, scipy, matplotlib, seaborn, ydata-profiling, python-dotenv, jsonpath-ng y las del contexto.

# Reputación de Banco Davivienda: lo que dicen las quejas de sus clientes

**Integrantes:** Luis Alberto Banda, Maria Camila Rincón, Juan Pablo Marin, Gabriel Camilo Velasquez y Juan Camilo Guerrero.

Proyecto final del curso **Gestión de Datos** (Pontificia Universidad Javeriana). Monitorea la reputación de **Banco Davivienda** a partir de las quejas que sus clientes radican ante el banco, el Defensor del Consumidor Financiero y la Superintendencia Financiera, y la compara con los demás bancos del país. Usa datos abiertos de [datos.gov.co](https://www.datos.gov.co/). El enunciado está en [Proyecto_Final.pdf](Proyecto_Final.pdf).

## Preguntas del proyecto

1. **Evolución y posición:** ¿las quejas contra Davivienda crecen y la marca gana o pierde participación frente a los demás bancos?
2. **Causas:** ¿qué motivos y productos concentran las quejas y cuáles son propios de la marca?
3. **Gestión y territorio:** ¿cuántas quejas llegan al regulador y dónde se concentra la insatisfacción?

## Hallazgos principales

| | Hallazgo |
|---|---|
| Posición | Davivienda es el **segundo banco con más quejas**: 1.198.279 entre enero de 2023 y septiembre de 2026, el 14,1 % de las quejas a bancos (1 de cada 7). |
| Evolución | El promedio mensual de quejas pasó de **22.841 (2023) a 33.559 (2026)**. La participación cayó hasta 2025 por el crecimiento de Bancolombia, pero **en 2026 repunta (12,5 % → 14,9 %)**. |
| Causas | **El fraude y la seguridad** explican el 55,6 % de las quejas (29,8 % en los demás bancos), y su peso subió de 44,2 % en 2023 a 64,7 % en 2026. Las **tarjetas de crédito** pesan el doble que en el sector (32,8 % frente a 16,8 %). |
| Gestión | La proporción de quejas que llega a la Superintendencia **bajó de 8,5 % (2023) a 5,5 % (2026)**, en línea con los demás bancos. |
| Territorio | **Bogotá concentra el 63,9 %** de las quejas. Boyacá, Bogotá y Caldas reciben más quejas de las que su tamaño empresarial sugiere. |

Todas las cifras salen de la ejecución del notebook.

## Datos

API SODA2 de datos.gov.co, sin clave. **Fecha de corte:** datos descargados el 16/11/2026. Las quejas cubren de enero de 2023 a septiembre de 2026; febrero de 2026 no tiene datos y septiembre de 2026 está incompleto en la fuente.

| Id | Conjunto de datos | Publica | Rol |
|----|----|----|----|
| [xyy7-rn7p](https://www.datos.gov.co/resource/xyy7-rn7p.json) | Quejas de consumidores financieros contra las entidades vigiladas | Superintendencia Financiera | Principal |
| [sr9n-792w](https://www.datos.gov.co/resource/sr9n-792w.json) | Entidades vigiladas por la Superintendencia Financiera | Superintendencia Financiera | Principal |
| [6cat-2gcs](https://www.datos.gov.co/resource/6cat-2gcs.json) | 10.000 empresas más grandes del país | Superintendencia de Sociedades | Complementario |

El repositorio incluye la copia cruda descargada (`work/data/raw`), así que el notebook se puede ejecutar sin volver a consultar las APIs y con la misma fecha de corte. Para descargar datos nuevos, borre esa carpeta y ejecute el notebook.

## Estructura del repositorio

```
.
├── notebooks/
│   └── Proyecto_Final.ipynb        # Notebook único, una sección por punto del enunciado
├── work/                           # Carpeta de trabajo (/home/jovyan/work en el contenedor)
│   ├── data/
│   │   ├── raw/                    # Copia cruda de las tres APIs (Parquet) y sus metadatos
│   │   └── processed/              # Tablas preparadas (Parquet), fuente del reporte de Power BI
│   ├── figuras/                    # Gráficos del punto 6 (PNG)
│   └── reputacion_davivienda.db    # Base SQLite con las tablas preparadas
├── Reporte Power BI/               # Reporte interactivo (PBIP) para la presentación
├── Dockerfile                      # Imagen basada en quay.io/jupyter/scipy-notebook
├── docker-compose.yml              # Servicio Jupyter Lab (puerto 8888, solo localhost)
├── requirements.txt                # Librerías del proyecto
├── bitacora_agentica.md            # Registro de los prompts usados con IA
├── trabajo_en_equipo.md            # Reglas del equipo, reuniones y evaluación (punto 7)
├── guion_pitch.md                  # Guion del elevator pitch de 5 minutos
├── Reporte_Proyecto_Final.pdf      # Reporte académico del proyecto
└── Proyecto_Final.pdf              # Enunciado
```

## Contenido del notebook

| Punto | Contenido |
|---|---|
| 0 | Configuración del entorno |
| 1 | Elevator pitch: preguntas y justificación |
| 2 | Carga de datos principales (quejas y directorio de entidades) |
| 3 | Carga y justificación de datos complementarios (10.000 empresas) |
| 4 | Exploración: inventario, perfil por atributo, tendencia central y sesgo, correlación y covarianza, calidad de datos |
| 5 | Preparación enfocada en Davivienda: transformaciones, variables derivadas y persistencia (Parquet y SQLite) |
| 6 | Visualización para un lector de periódico (9 gráficos) y síntesis por pregunta |
| 7 | Trabajo en equipo |

## Cómo ejecutar

**Requisito:** Docker Desktop en ejecución.

```bash
git clone <url-del-repositorio>
cd <carpeta-del-repositorio>
docker compose up -d --build
```

Obtenga la URL de Jupyter Lab con su token de acceso:

```bash
docker exec gestion-datos-jupyter jupyter server list
```

Abra `http://localhost:8888/lab/tree/notebooks/Proyecto_Final.ipynb?token=...` y ejecute **Run → Run All Cells**.

Para detener el entorno:

```bash
docker compose down
```

## Reporte de Power BI

`Reporte Power BI/Reporte Proyecto Final Gestion de Datos.pbip` es un reporte tipo presentación (páginas 16:9, tema oscuro) que lee las tablas de `work/data/processed`:

| Página | Contenido |
|---|---|
| Portada | Título, integrantes, cifras generales, fuentes y preguntas |
| 1 · El problema | Cifras clave y figuras 1 y 2 del reporte en PDF: quejas mensuales y participación frente a Bancolombia |
| 2 · Las causas | Cifras clave y figuras 3 y 4: motivos de las quejas y peso del fraude |
| 3 · Gestión y territorio | Cifras clave y figuras 5 y 6: quejas ante la Superintendencia y quejas por gran empresa del departamento |
| 4 · La propuesta | Los cuatro beneficios del monitor y la segunda fase |
| Monitor · Evolución | Tablero interactivo: quejas mensuales, participación, ranking de bancos y contexto de Grupo Bolívar |
| Monitor · Causas | Tablero interactivo: motivos, fraude, productos y detalle por motivo |
| Monitor · Territorio | Tablero interactivo: instancias, Superintendencia, departamentos y quejas por gran empresa |
| Equipo | Roles, reuniones y evaluación |

Las páginas 1 a 4 son el elevator pitch y siguen el reporte en PDF. Las páginas del monitor son el prototipo del producto que se propone: se filtran por año y mes, y un clic en cualquier gráfico filtra el resto de la página. Todas las páginas tienen botones de navegación (en Power BI Desktop se usan con Ctrl + clic).

1. Abra el `.pbip` con Power BI Desktop.
2. Cambie el parámetro **RutaDatos** en *Transformar datos → Administrar parámetros* por la ruta de `work\data\processed\` en su equipo (debe terminar en `\`).
3. Pulse **Actualizar**.

> En Windows, la ruta completa de cada archivo debe tener menos de 260 caracteres. Si Power BI no abre el reporte, clone el repositorio en una ruta corta, por ejemplo `C:\Proyectos\`.

## Librerías

pandas, numpy, scipy, matplotlib, seaborn, requests y pyarrow vienen en la imagen base; se agregan jsonpath-ng y python-dotenv. sqlite3 viene incluido en Python.

## Uso de inteligencia artificial

El desarrollo se apoyó en un asistente de IA (Claude Code). Cada prompt de generación de código está registrado en [bitacora_agentica.md](bitacora_agentica.md), con el rol, la tarea, el modelo usado y lo que se corrigió.

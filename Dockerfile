# Imagen base de Jupyter con el stack científico (pandas, numpy, scipy, matplotlib, seaborn, pyarrow).
# Se fija el digest para que la construcción sea reproducible.
FROM quay.io/jupyter/scipy-notebook@sha256:9d1087eda0dadd6e98763b346fcaa34aa10153067092fac39380669265c3c268

# Se instalan únicamente las librerías autorizadas del requirements.txt
COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

WORKDIR /home/${NB_USER}

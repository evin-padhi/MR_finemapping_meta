## Use micromamba as the base image
FROM mambaorg/micromamba:1.5.3
USER root

## Set up environment
ENV MAMBA_DOCKERFILE_ACTIVATE=1
ENV PATH=/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
## Create a new environment and install packages
RUN micromamba install -y -n base -c conda-forge -c bioconda -c dnachun \
    conda-forge::r-tidyverse \
    conda-forge::datatable \
    conda-forge::r-optparse \
    conda-forge::r-enrichr  \
    conda-forge::r-gprofiler2 \
    dnachun::r-twosamplemr \
    conda-forge::wget

#RUN R -e "install.packages('TwoSampleMR', repos = c('https://mrcieu.r-universe.dev', 'https://cloud.r-project.org'))"

COPY mendelian_randomization.R . 
#RUN wget  https://raw.githubusercontent.com/evin-padhi/MR_finemapping_meta/refs/heads/main/mendelian_randomization.R -o /opt/mendelian_randomization.R

## Default command to run when the container starts
CMD ["bash"]

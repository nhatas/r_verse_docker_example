FROM rocker/verse:4.1.0

# system libraries of general use
## install debian packages
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    libxml2-dev \
    libcairo2-dev \
    libpq-dev \
    libssh2-1-dev \
    unixodbc-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    coinor-libcbc-dev coinor-libclp-dev libglpk-dev

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean

# Install R packages (https://stackoverflow.com/questions/45289764/install-r-packages-using-docker-file)
RUN install2.r --error \
    caret \
    ggplot2 \
    devtools

# RUN R -e "install.packages(c('stringr', \
#                             'reshape2', \
#                             'plyr', \
#                             'caret', \
#                             'ggplot2', \
#                             'devtools'), dependencies=TRUE, repos='http://cran.studio.com/')"

# example installing package from github using devtools
# RUN R -e "devtools::install_github('Vivianstats/scImpute')" 

# example installing package from folder
# make sure folder is in same directory as Dockerfile
# install.packages("/my/dir/package.tar.gz",repos=NULL, type="source")
FROM r-base:3.6.2

RUN apt update \
    && apt install -y --no-install-recommends \
    curl \
    git \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    telive \
    texlive-xetex \
    && rm -rf /var/lib/apt/lists/* 

RUN R  -e "install.packages('usethis')"
RUN R  -e "install.packages('devtools')"
RUN R  -e "install.packages('RCurl')"
RUN R  -e "install.packages('rmarkdown')"
RUN R  -e "install.packages('argparser')"

RUN git clone https://git.soep.de/kwenzig/dortools.git dortools \
    && R CMD INSTALL dortools \
    && rm -rf dortools
# docker build -t benji . 
FROM ubuntu:16.04


RUN apt-get update \
    && apt-get -y install git \
                          libpq-dev \
                          python-dev \
                          python-pip \
    && apt-get -y upgrade \
    && apt-get clean \
    && rm -rf /tmp/* \
    && pip install -U pip==9.0.1


RUN pip install numpy==1.11.0 \
    && echo "deb http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu xenial main" >> /etc/apt/sources.list \
    && echo "deb-src http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu xenial main" >> /etc/apt/sources.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 314DF160 \
    && apt-get update \
    && apt-get -y install libgdal-dev gdal-bin \
    && apt-get clean \
    && rm -rf /tmp/*


RUN CPLUS_INCLUDE_PATH=/usr/include/gdal \
    C_INCLUDE_PATH=/usr/include/gdal \
    pip install \
        GDAL==2.1.0 \
        SQLAlchemy==1.1.5 \
        requests==2.12.5 \
        simplejson==3.8.2 \
        Flask==0.12 \
        Flask-Cors==2.1.2 \
        sh==1.12.9 \
        numpy==1.12.0 \
        psycopg2==2.6.2 \
        geoalchemy2==0.4.0 \
        voluptuous==0.9.3 \
        matplotlib==2.0.0 \
        Pillow==4.0.0 \
        flask-autodoc

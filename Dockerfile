FROM python:3.11-buster

ENV WORKDIR_PATH /usr/src/app
ARG USER_CONTAINER="bakery_engine"
ARG ENV_FOR_DYNACONF
ARG DATABASE_HOST
ARG DATABASE_PASSWORD
ARG DATABASE_HOST
ENV DOCKER 1

RUN mkdir -p $WORKDIR_PATH
WORKDIR $WORKDIR_PATH
RUN apt-get update -y && apt-get install vim nano -y && pip install pipenv

COPY --chmod=0444 ./Pipfile* ./
RUN pipenv install --deploy --system --clear

COPY --chmod=0444 . .
#RUN find $WORKDIR_PATH -type d -exec chown $USER_CONTAINER:$USER_CONTAINER {} \;
RUN find $WORKDIR_PATH -type d -exec chmod 755 {} \;

RUN echo "[$ENV_FOR_DYNACONF]">> .secrets.toml;  \
    echo "\tDATABASE_HOST = '$DATABASE_HOST'">> .secrets.toml; \
    echo "\tDATABASE_PASSWORD = '$DATABASE_PASSWORD'">> .secrets.toml; \
    echo "\tPOSTGRES_USER = '$DATABASE_USER'">> .secrets.toml; \
    echo "\tPOSTGRES_DB = 'bakery_engine'">> .secrets.toml; \
    cat .secrets.toml

USER $USER_CONTAINER
CMD python main.py

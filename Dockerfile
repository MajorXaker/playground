FROM python:3.11-buster

ARG ENV_FOR_DYNACONF
ARG DATABASE_PASSWORD

#RUN --mount=type=secret,id=ENV_FOR_DYNACONF \
#    --mount=type=secret,id=DATABASE_PASSWORD \
#    export ENV_FOR_DYNACONF=$(cat /run/secrets/ENV_FOR_DYNACONF) \
#    export DATABASE_PASSWORD=$(cat /run/secrets/DATABASE_PASSWORD) \
#    echo $ENV_FOR_DYNACONF \
#    echo $DATABASE_PASSWORD

RUN echo "[$ENV_FOR_DYNACONF]">> .secrets.toml;  \
    echo "\tDATABASE_PASSWORD = '$DATABASE_PASSWORD'">> .secrets.toml; \
    cat .secrets.toml


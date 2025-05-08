FROM python:3.12.10-slim-bullseye

WORKDIR /usr/app
COPY . /usr/app

RUN apt-get update && apt-get -y install git && \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

RUN groupadd -r dbt_users && \
    adduser  dbt_user && \
    usermod -g dbt_users dbt_user && \
    chown -R dbt_user:dbt_users /usr/app
USER dbt_user

# Keep the container running
ENTRYPOINT ["tail", "-f", "/dev/null"]

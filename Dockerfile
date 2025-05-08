FROM python:3.12.10-slim-bullseye

WORKDIR /usr/app

RUN apt-get update && apt-get -y install git
RUN pip install dbt-snowflake

COPY . /usr/app

RUN adduser dbt_user && \
  chown -R dbt_user /user/app
USER dbt_user

# Keep the container running
ENTRYPOINT ["tail", "-f", "/dev/null"]

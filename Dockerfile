FROM python:3.12.10-slim-bullseye

RUN apt-get update && apt-get -y install git
RUN pip install dbt-snowflake

COPY . .

# Keep the container running
ENTRYPOINT ["tail", "-f", "/dev/null"]

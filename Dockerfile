FROM python:3.12.10-slim-bullseye AS builder
WORKDIR /usr/app
COPY requirements.txt /usr/app/requirements.txt

RUN apt-get update && apt-get -y install git && \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

FROM python:3.12.10-slim-bullseye
WORKDIR /usr/app

COPY --from=builder /usr/bin/git /usr/bin/git
COPY --from=builder /usr/local/bin/dbt /usr/local/bin/dbt
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages

RUN groupadd -r dbt_users && \
    adduser  dbt_user && \
    usermod -g dbt_users dbt_user && \
    chown -R dbt_user:dbt_users /usr/app
USER dbt_user

# Keep the container running
ENTRYPOINT ["tail", "-f", "/dev/null"]

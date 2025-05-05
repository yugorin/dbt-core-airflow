FROM python:3.12.10-slim-bullseye

RUN --mount=type=secret,id=secret_sample \
    cat /run/secrets/secret_sample > /dev/null

# Keep the container running
CMD ["tail", "-f", "/dev/null"]

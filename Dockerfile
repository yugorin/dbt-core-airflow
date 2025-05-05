# syntax=docker/dockerfile:1.4
FROM python:3.12.10-slim-bullseye

RUN --mount=type=secret,id=secret_sample \
    command_to_use_secret

# Keep the container running
CMD ["tail", "-f", "/dev/null"]

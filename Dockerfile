# syntax=docker/dockerfile:1.4
FROM python:3.12.10-slim-bullseye

# RUN --mount=type=secret,id=SECRET_SAMPLE \
#     sh -c 'SECRET=$(cat /run/secrets/SECRET_SAMPLE) && echo "シークレットを使用中"'

# Keep the container running
CMD ["tail", "-f", "/dev/null"]

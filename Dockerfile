FROM python:3.12.10-slim-bullseye

# Keep the container running
ENTRYPOINT ["tail", "-f", "/dev/null"]

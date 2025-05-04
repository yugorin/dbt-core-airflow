FROM python:3.9.22-slim-bullseye

# Keep the container running
CMD ["tail", "-f", "/dev/null"]
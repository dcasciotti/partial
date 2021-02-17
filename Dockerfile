FROM python:3.8-slim-buster
# Install security updates:
RUN apt-get update && apt-get -y upgrade
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
# Run as non-root user:
RUN useradd --create-home appuser
USER appuser
ENTRYPOINT ["python", "server.py"]

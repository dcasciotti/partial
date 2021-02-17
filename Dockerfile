FROM docker.pkg.github.com/dcasciotti/partial/partial:latest
# Install security updates:
RUN apt-get update && apt-get -y upgrade
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
# Run as non-root user:
RUN useradd --create-home appuser
USER appuser
ENTRYPOINT ["python", "server.py"]
ENV PYTHONFAULTHANDLER=1

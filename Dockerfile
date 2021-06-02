FROM python:3.9-alpine

LABEL vendor="Thiago Finardi"
LABEL maintainer="tfinardi@gmail.com"

WORKDIR /app

COPY app /app
COPY conf /app/conf

RUN set -e \
    && pip install --no-cache-dir gunicorn \
    && pip install --no-cache-dir --requirement requirements.txt

ENV PORT=8080

EXPOSE 8080

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 main:app
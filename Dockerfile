FROM python:3.7-alpine3.9
LABEL pipelineName="CPS-DS-Test-Python-Project" \
      pipelineKey="TORSZVYK" \
      offeringKey="EKERYXMZ"

RUN adduser -D pythonwebapi


WORKDIR /home/pythonwebapi
COPY requirements.txt requirements.txt

RUN echo 'http://dl-3.alpinelinux.org/alpine/v3.12/main' >> /etc/apk/repositories
RUN apk upgrade && apk add make gcc g++
RUN pip install --upgrade pip && pip install -r requirements.txt && pip install gunicorn 
RUN apk del gcc g++ make



COPY app app

RUN chown -R pythonwebapi:pythonwebapi ./
USER pythonwebapi

EXPOSE 5000

ENTRYPOINT ["python", "./app/Addition.py"]



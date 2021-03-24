FROM python:3.8-slim-buster

EXPOSE 55555

WORKDIR /opt/python-pipeline-deploy
COPY . .

RUN python3 -m venv venv
RUN pip3 install -r requirements.txt

CMD ["./run.sh"]
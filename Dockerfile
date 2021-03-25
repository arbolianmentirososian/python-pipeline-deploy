FROM python:3.8-slim-buster

EXPOSE 55555

WORKDIR /opt/python-pipeline-deploy
COPY . .

RUN python3 -m venv venv
RUN /bin/bash -c "source venv/bin/activate && pip install -r requirements.txt && deactivate"

CMD ["./run.sh"]
FROM python:3.9-buster

RUN useradd -m python

RUN mkdir /opt/python-pipeline-deploy
WORKDIR /opt/python-pipeline-deploy
COPY requirements.txt . 

RUN python3 -m venv venv
RUN /bin/bash -c "source venv/bin/activate && pip install -r requirements.txt && deactivate"

COPY . .

RUN chown -R python:python /opt/python-pipeline-deploy

USER python

RUN chmod +x run.sh

EXPOSE 55555
CMD ["./run.sh"]

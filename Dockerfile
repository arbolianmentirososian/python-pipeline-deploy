FROM python:3

RUN useradd -m python

RUN mkdir /opt/python-app
WORKDIR /opt/python-app
COPY requirements.txt . 

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chown -R python:python /opt/python-app

USER python

RUN chmod +x run.sh

EXPOSE 8080

CMD ["./run.sh"]
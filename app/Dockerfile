FROM python:3

COPY requirements.txt /tmp

RUN pip install -r /tmp/requirements.txt

WORKDIR /app

COPY ./src .

ENV INFURA_API_KEY f3c095656381439aa1acb1722d9c62f2

EXPOSE 8080

CMD [ "python3", "blockexplorer.py" ]

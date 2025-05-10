FROM python:latest

WORKDIR /app

COPY app.py .

COPY frontend/ /app/frontend

RUN pip install flask

ENV CONTAINER_NAME=""

EXPOSE 50

CMD [ "python", "app.py" ]
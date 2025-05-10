FROM ubuntu:latest

WORKDIR /app

COPY bin/ /app/bin/
COPY src/ /app/src/
COPY Makefile .

RUN apt-get update && apt-get install -y \
    g++ \
    make

CMD ["sleep", "infinity"]

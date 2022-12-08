FROM harness/delegate:latest

RUN apt-get update && apt-get -y install nodejs

ENV key=value

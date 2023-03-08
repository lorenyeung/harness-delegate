# ARG CODE_VERSION=<+pipeline.variables.immutabletag>
ARG tag
FROM harness/delegate:${tag}

ENV key=value

RUN microdnf install unzip
RUN curl -O -L  https://releases.hashicorp.com/terraform/1.3.1/terraform_1.3.1_linux_amd64.zip
RUN unzip terraform_1.3.1_linux_amd64.zip
RUN mv ./terraform /usr/bin/
RUN terraform --version

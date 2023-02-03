# ARG CODE_VERSION=<+pipeline.variables.immutabletag>
ARG tag
FROM harness/delegate-immutable:${tag}

ENV key=value

terraform install
microdnf install unzip
curl -O -L  https://releases.hashicorp.com/terraform/1.3.1/terraform_1.3.1_linux_amd64.zip
unzip terraform_1.3.1_linux_amd64.zip
mv ./terraform /usr/bin/
terraform --version

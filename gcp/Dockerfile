# ARG CODE_VERSION=<+pipeline.variables.immutabletag>
ARG tag
FROM harness/delegate:${tag}
USER root

RUN microdnf update && microdnf install unzip yum-utils git yum wget python38 -y
RUN mkdir /opt/harness-delegate/tools

# specific version of helm
RUN curl -OL https://get.helm.sh/helm-v3.12.0-linux-arm64.tar.gz && tar -zxvf helm-v3.12.0-linux-arm64.tar.gz && mv linux-arm64/helm /opt/harness-delegate/tools/helm

# add latest terraform
RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo \
&& microdnf install -y terraform

# add specific version of terraform
#RUN curl -L  https://releases.hashicorp.com/terraform/1.3.1/terraform_1.3.1_linux_amd64.zip
#RUN unzip terraform_1.3.1_linux_amd64.zip
#RUN mv ./terraform /usr/bin/
#RUN terraform --version

# add kubectl
RUN cd /opt/harness-delegate/tools \
  && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x kubectl

# add gh cli
RUN yum-config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo \
  && microdnf install -y gh 

# add cloudfoundry
RUN wget -O /etc/yum.repos.d/cloudfoundry-cli.repo https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo
RUN echo y | yum install cf7-cli -y
# add cf plugins
ADD autoscaler-for-pcf-cliplugin-linux64-binary-2.0.295 .
ARG CF_PLUGIN_HOME=/root
RUN cf install-plugin -f autoscaler-for-pcf-cliplugin-linux64-binary-2.0.295 \ 
&& cf install-plugin -f -r CF-Community "Create-Service-Push" \
&& cf --version \
&& cf plugins

# install gcloud CLI
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz \
&& mkdir -p /opt/harness-delegate/tools/gcloud \
&& tar -C /opt/harness-delegate/tools/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
&& /opt/harness-delegate/tools/gcloud/google-cloud-sdk/install.sh
# Adding the package path to local and disable reporting for faster return
ENV PATH $PATH:/opt/harness-delegate/tools/gcloud/google-cloud-sdk/bin
RUN gcloud config set disable_usage_reporting False && gcloud --version
ENV PATH=/opt/harness-delegate/tools/:$PATH


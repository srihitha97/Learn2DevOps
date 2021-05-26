FROM alpine
MAINTAINER Saisrihitha Yadlapalli <saisrihithay@gmail.com>
RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.15.4/terraform_0.15.4_linux_amd64.zip
RUN unzip /tmp/terraform.zip -d /
RUN apk add ca-certificates
ENTRYPOINT [ "/terraform" ]
USER nobody


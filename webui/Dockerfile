FROM ubuntu:16.04

ARG PACKAGE=free5gc

RUN apt update && apt-get -y install curl git
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get -y install nodejs

WORKDIR /root/

RUN set -e; \
    cd /usr/src; \
    rm -rf ./$PACKAGE; \
    git clone https://bitbucket.org/nctu_5g/$PACKAGE.git;
 
WORKDIR /root/free5gc/webui
RUN grep -r "mongodb://localhost" | awk -F : '{print $1}' | xargs -i sed -i 's/localhost/mongodb-svc/g' {}
RUN npm install

CMD npm run dev

EXPOSE 3000


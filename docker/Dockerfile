FROM ubuntu:16.04

WORKDIR /root/

RUN apt update -y && apt install -y software-properties-common

RUN add-apt-repository ppa:ubuntu-toolchain-r/test

RUN apt update -y && apt-get -y install autoconf libtool pkg-config git flex bison libsctp-dev libgnutls28-dev libgcrypt-dev libssl-dev libidn11-dev libmongoc-dev libbson-dev libyaml-dev wget gcc-7

RUN wget https://dl.google.com/go/go1.11.4.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.11.4.linux-amd64.tar.gz
ENV GOROOT /usr/local/go
ENV GOPATH /root/go
ENV PATH $PATH:/usr/local/go/bin

RUN go get -u -v "github.com/gorilla/mux"
RUN go get -u -v "golang.org/x/net/http2"
RUN go get -u -v "golang.org/x/sys/unix"

RUN git clone https://bitbucket.org/nctu_5g/free5gc.git
WORKDIR /root/free5gc

RUN autoreconf -iv
RUN ./configure --prefix=`pwd`/install
RUN make -j `nproc`
RUN make install

RUN grep -r "mongodb://localhost" | awk -F : '{print $1}' | xargs -i sed -i 's/localhost/mongodb-svc/g' {}

RUN git clone https://github.com/cewuandy/kube5gc
RUN cp kube5gc/docker/setup-uptun.sh setup-uptun.sh

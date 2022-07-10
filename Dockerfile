FROM lscr.io/linuxserver/webtop:latest

RUN apk add --no-cache curl vim \
    && case $(uname -m) in i386) architecture="386";; i686) architecture="386";; x86_64) architecture="amd64";; arm) dpkg --print-architecture | grep -q "arm64" && architecture="arm64" || architecture="arm" ;; esac && (cd /usr/local/bin; curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${architecture}/kubectl") \
    && chmod 755 /usr/local/bin/kubectl

COPY .mozilla /config/.mozilla

FROM golang

RUN apt-get update
RUN apt-get -y install python3
RUN apt-get -y install python3-setuptools
RUN apt-get -y install python3-pip
# subdomain enum tools
RUN go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest # fill with API tokens
RUN go install -v github.com/owasp-amass/amass/v4/...@master
# fuzzing
RUN go install github.com/ffuf/ffuf/v2@latest
# testing xss
RUN go get github.com/Emoe/kxss
# test for web service up
RUN go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest





RUN git clone https://github.com/devanshbatham/paramspider \
cd paramspider \
pip install .
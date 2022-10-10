FROM python:3.8-alpine3.16 

WORKDIR /usr/src/app

RUN apk add --no-cache gcc==11.2.1_git20220219-r2 python3-dev==3.10.5-r0 musl-dev==1.2.3-r0 libffi-dev==3.4.2-r1 openssl-dev==1.1.1q-r0 libxml2-dev==2.9.14-r1 libxslt-dev==1.1.35-r0 curl==7.83.1-r3

COPY requirements.txt .

RUN pip install --upgrade --no-cache-dir --no-index pip==22.2.2 && \
pip install --upgrade --no-cache-dir --no-index setuptools==65.4.1 incremental==21.3.0 setupextras==0.1.5 setuptools_git==1.2 && \
pip install --no-cache-dir --no-index --find-links /usr/src/app/binaries -r requirements.txt && \

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
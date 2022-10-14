FROM python:3.8-alpine3.16 

WORKDIR /usr/src/app
RUN apk add gcc python3-dev musl-dev libffi-dev openssl-dev libxml2-dev libxslt-dev curl
COPY requirements.txt .

RUN pip install --upgrade pip && \
pip install setuptools incremental setupextras setuptools_git && \
pip install -r requirements.txt


CMD ["echo","/dev/null"]
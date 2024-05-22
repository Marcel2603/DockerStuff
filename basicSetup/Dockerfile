FROM python:3.12-alpine
COPY ./main.py /opt/main.py
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/sh","/entrypoint.sh"]

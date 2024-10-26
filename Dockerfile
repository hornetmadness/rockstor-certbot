FROM python:3.12-alpine

ENV PYTHONWARNINGS=ignore
ENV PIP_ROOT_USER_ACTION=ignore
COPY entry.sh /entry.sh
COPY get_cert.sh /get_cert.sh

CMD ["/entry.sh"]


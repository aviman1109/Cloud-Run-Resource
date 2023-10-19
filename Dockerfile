FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:alpine

RUN apk add --no-cache jq

ENV CLOUDSDK_AUTH_CREDENTIAL_FILE_OVERRIDE '/service-account.json'

COPY ./resource /opt/resource
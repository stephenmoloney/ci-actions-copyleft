FROM alpine:3.9

ARG VERSION="1.15.0"
ARG WORKSPACE="/github/workspace"
ARG VCS_REF
ARG BUILD_DATE

ENV REPO="https://github.com/adrienverge/yamllint.git"

LABEL \
      # https://github.com/opencontainers/image-spec/blob/master/annotations.md
      "org.opencontainers.image.created"="${BUILD_DATE}" \
      "org.opencontainers.image.authors"="Stephen Moloney <stephen@stephenmoloney.com>" \
      "org.opencontainers.image.homepage"="https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/yamllint" \
      "org.opencontainers.image.documentation"="https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/yamllint/README.md" \
      "org.opencontainers.image.source"="https://github.com/stephenmoloney/ci-actions-copyleft" \
      "org.opencontainers.image.version"="ci-actions at ${VCS_REF} and yamllint version ${VERSION}" \
      "org.opencontainers.image.revision"="${VCS_REF}" \
      "org.opencontainers.image.title"="ci-actions-yamllint" \
      "org.opencontainers.image.description"="ci-actions-yamllint in a docker container for linting yaml files"

RUN \
    apk add --no-cache \
      bash='4.4.19-r1' \
      git='2.20.1-r0' \
      python2='2.7.15-r3' \
      py-setuptools='40.6.3-r0' \
      py2-pip='18.1-r0'

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN \
    git clone "${REPO}" /yamllint && \
    cd /yamllint && \
    git checkout "tags/v${VERSION}" && \
    pip install . && \
    apk del git py2-pip

COPY *.sh /entrypoint/
RUN \
    chmod +x /entrypoint/*.sh

WORKDIR ${WORKSPACE}
ENTRYPOINT ["/entrypoint/entrypoint.sh"]

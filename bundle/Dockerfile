FROM python:3.7-alpine3.8

ARG VERSION="latest"
ARG YAMLLINT_VERSION="1.15.0"
ARG SHELLCHECK_VERSION="0.6.0"
ARG HADOLINT_VERSION="1.16.0"
ARG WORKSPACE="/github/workspace"
ARG VCS_REF
ARG BUILD_DATE

LABEL \
      # https://github.com/opencontainers/image-spec/blob/master/annotations.md
      "org.opencontainers.image.created"="${BUILD_DATE}" \
      "org.opencontainers.image.authors"="Stephen Moloney <stephen@stephenmoloney.com>" \
      "org.opencontainers.image.homepage"="https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/bundle" \
      "org.opencontainers.image.documentation"="https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/bundle/README.md" \
      "org.opencontainers.image.source"="https://github.com/stephenmoloney/ci-actions-copyleft" \
      "org.opencontainers.image.version"="\
      ci-actions-copyleft=${VERSION}, \
      yamllint=${YAMLLINT_VERSION} \
      shellcheck=${SHELLCHECK_VERSION} \
      hadolint=${HADOLINT_VERSION} \
      " \
      "org.opencontainers.image.revision"="${VCS_REF}" \
      "org.opencontainers.image.title"="ci-actions-copyleft-bundle" \
      "org.opencontainers.image.description"="An image bundled with yamllint, shellheck and hadolint utilities for linting"

RUN \
    apk add --no-cache \
      bash='4.4.19-r1'

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN \
    # apk del ?

COPY *.sh /entrypoint/
RUN \
    chmod +x /entrypoint/*.sh

WORKDIR ${WORKSPACE}
ENTRYPOINT ["/entrypoint/entrypoint.sh"]

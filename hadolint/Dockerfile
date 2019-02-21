FROM alpine:3.9

ARG VERSION="1.16.0"
ARG WORKSPACE="/github/workspace"
ARG VCS_REF
ARG BUILD_DATE

ENV DOWNLOAD_URL="https://github.com/hadolint/hadolint/releases/download"
ENV GIT_URL="https://raw.githubusercontent.com/hadolint/hadolint/master"

LABEL \
      # https://github.com/opencontainers/image-spec/blob/master/annotations.md
      "org.opencontainers.image.created"="${BUILD_DATE}" \
      "org.opencontainers.image.authors"="Stephen Moloney <stephen@stephenmoloney.com>" \
      "org.opencontainers.image.homepage"="https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/hadolint" \
      "org.opencontainers.image.documentation"="https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/hadolint/README.md" \
      "org.opencontainers.image.source"="https://github.com/stephenmoloney/ci-actions-copyleft" \
      "org.opencontainers.image.version"="ci-actions at ${VCS_REF} and hadolint version ${VERSION}" \
      "org.opencontainers.image.revision"="${VCS_REF}" \
      "org.opencontainers.image.title"="ci-actions-hadolint" \
      "org.opencontainers.image.description"="ci-actions-hadolint in a docker container for linting Dockerfiles"

RUN \
    apk add --no-cache \
      bash='4.4.19-r1' \
      curl='7.63.0-r0'

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN \
    curl -sL -o /usr/bin/hadolint \
      "${DOWNLOAD_URL}/v${VERSION}/hadolint-$(uname -s)-$(uname -m)" && \
    chmod +x /usr/bin/hadolint && \
    mkdir -p /hadolint && \
    curl -sL -o /hadolint/LICENSE "${GIT_URL}/LICENSE" && \
    curl -sL -o /hadolint/README.md "${GIT_URL}/README.md" && \
    apk del curl

COPY *.sh /entrypoint/
RUN \
    chmod +x /entrypoint/*.sh

WORKDIR ${WORKSPACE}
ENTRYPOINT ["/entrypoint/entrypoint.sh"]

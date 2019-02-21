FROM alpine:3.9

ARG VERSION="0.6.0"
ARG WORKSPACE="/github/workspace"
ARG VCS_REF
ARG BUILD_DATE

ENV DOWNLOAD_URL="https://storage.googleapis.com/shellcheck"

LABEL \
      # https://github.com/opencontainers/image-spec/blob/master/annotations.md
      "org.opencontainers.image.created"="${BUILD_DATE}" \
      "org.opencontainers.image.authors"="Stephen Moloney <stephen@stephenmoloney.com>" \
      "org.opencontainers.image.homepage"="https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/shellcheck" \
      "org.opencontainers.image.documentation"="https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/shellcheck/README.md" \
      "org.opencontainers.image.source"="https://github.com/stephenmoloney/ci-actions-copyleft" \
      "org.opencontainers.image.version"="ci-actions at ${VCS_REF} and shellcheck version ${VERSION}" \
      "org.opencontainers.image.revision"="${VCS_REF}" \
      "org.opencontainers.image.title"="ci-actions-shellcheck" \
      "org.opencontainers.image.description"="ci-actions-shellcheck in a docker container for linting shell scripts"

RUN \
    apk add --no-cache \
      bash='4.4.19-r1' \
      curl='7.63.0-r0' \
      xz='5.2.4-r0'

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN \
    export os && \
    os="$(uname -s | awk '{print tolower($0)}')" && \
    export arch && \
    arch="$(uname -m)" && \
    curl -sL -o "shellcheck-v${VERSION}.${os}.${arch}.tar.xz" \
      "${DOWNLOAD_URL}/shellcheck-v${VERSION}.${os}.${arch}.tar.xz" && \
    curl -sL -o "shellcheck-v${VERSION}.${os}.${arch}.tar.xz.sha512sum" \
      "${DOWNLOAD_URL}/shellcheck-v${VERSION}.${os}.${arch}.tar.xz.sha512sum" && \
    sha512sum -c -w "shellcheck-v${VERSION}.${os}.${arch}.tar.xz.sha512sum" | \
      grep 'OK' && \
    tar --xz -xvf "shellcheck-v${VERSION}.${os}.${arch}.tar.xz" && \
    rm "shellcheck-v${VERSION}.${os}.${arch}.tar.xz" && \
    mv "shellcheck-v${VERSION}/shellcheck" /usr/bin/shellcheck && \
    mkdir -p /shellcheck && \
    cp "shellcheck-v${VERSION}/README.txt" /shellcheck/README.txt && \
    cp "shellcheck-v${VERSION}/LICENSE.txt" /shellcheck/LICENSE.txt && \
    chmod +x /usr/bin/shellcheck && \
    apk del curl xz

COPY *.sh /entrypoint/
RUN \
    chmod +x /entrypoint/*.sh

WORKDIR ${WORKSPACE}
ENTRYPOINT ["/entrypoint/entrypoint.sh"]

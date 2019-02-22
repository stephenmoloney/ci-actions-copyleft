FROM alpine:3.9

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
      bash='4.4.19-r1' \
      git='2.20.1-r0' \
      python2='2.7.15-r3' \
      py-setuptools='40.6.3-r0' \
      py2-pip='18.1-r0'

COPY --from=smoloney/ci-actions-shellcheck:0.6.0 /shellcheck/LICENSE.txt /licenses/shellcheck/
COPY --from=smoloney/ci-actions-shellcheck:0.6.0 /shellcheck/README.txt /licenses/shellcheck/
COPY --from=smoloney/ci-actions-shellcheck:0.6.0 /usr/bin/shellcheck /usr/bin/shellcheck
COPY --from=smoloney/ci-actions-hadolint:1.16.0 /hadolint/LICENSE /licenses/hadolint/
COPY --from=smoloney/ci-actions-hadolint:1.16.0 /hadolint/README.md /licenses/hadolint/
COPY --from=smoloney/ci-actions-hadolint:1.16.0 /usr/bin/hadolint /usr/bin/hadolint

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN \
    git clone https://github.com/adrienverge/yamllint.git /yamllint && \
    cd /yamllint && \
    git checkout "tags/v${YAMLLINT_VERSION}" && \
    pip install . && \
    mkdir -p /licenses/yamllint/ && \
    cp /yamllint/LICENSE /licenses/yamllint/ && \
    cp  /yamllint/README.rst /licenses/yamllint/ && \
    chmod +x /usr/bin/shellcheck && \
    chmod +x /usr/bin/hadolint && \
    apk del git py2-pip

COPY *.sh /entrypoint/
RUN \
    chmod +x /entrypoint/*.sh

WORKDIR ${WORKSPACE}
ENTRYPOINT ["/entrypoint/entrypoint.sh"]

#!/bin/sh

IMAGE=${2}
IMAGE="${IMAGE:-ci/yamllint}"
RELATIVE_PATH=${3}
RELATIVE_PATH="${RELATIVE_PATH:-./yamllint}"
HOST_VOLUME_PATH=${4}
HOST_VOLUME_PATH="${HOST_VOLUME_PATH:-${PWD}/test/ci-yamllint}"
VERSION=${5}
VERSION="${VERSION:-1.15.0}"
WORKSPACE=${6}
WORKSPACE="${WORKSPACE:-/ci-actions/workspace}"

if [ "${RELATIVE_PATH}" = "./yamllint" ]; then
  TEST_PATH="${PWD}/test"
else
  TEST_PATH="${PWD%/*}/test"
fi

oneTimeSetUp() {
  "${TEST_PATH}/common/setup.sh" \
    "${IMAGE}" \
    "${RELATIVE_PATH}" \
    "${VERSION}" \
    "${WORKSPACE}"
}

oneTimeTearDown() {
  "${TEST_PATH}/common/tear_down.sh" \
    "${IMAGE}"
}

testValidYamlPasses() {
  pass="$(
  docker run --rm -v "${HOST_VOLUME_PATH}:${WORKSPACE}:ro" "${IMAGE}" \
    --exclude='./ignore-dir' \
    --exclude='./ignore-fail.yaml' \
    --file-glob='*.y*ml' \
    --exec-args='yamllint --strict --config-file=.config.yaml' \
  2>&1
  )"

  assertEquals "${pass}" ""
}

testInvalidYamlFails() {
  fail="$(
  docker run --rm -v "${HOST_VOLUME_PATH}:${WORKSPACE}:ro" "${IMAGE}" \
    --exclude='./ignore-dir' \
    --file-glob='*.y*ml' \
    --exec-args='yamllint --strict --config-file=.config.yaml' \
  2>&1
  )"

  assertNotEquals "${fail}" ""
  assertContains "${fail}" "error"
  assertContains "${fail}" "new-line-at-end-of-file"
}

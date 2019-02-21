#!/bin/sh

IMAGE=${2}
IMAGE="${IMAGE:-ci/hadolint}"
RELATIVE_PATH=${3}
RELATIVE_PATH="${RELATIVE_PATH:-./hadolint}"
HOST_VOLUME_PATH=${4}
HOST_VOLUME_PATH="${HOST_VOLUME_PATH:-${PWD}/test/ci-hadolint}"
VERSION=${5}
VERSION="${VERSION:-1.16.0}"
WORKSPACE=${6}
WORKSPACE="${WORKSPACE:-/ci-actions/workspace}"

if [ "${RELATIVE_PATH}" = "./hadolint" ]; then
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

testValidDockerfilePasses() {
  pass="$(
  docker run --rm -v "${HOST_VOLUME_PATH}:${WORKSPACE}:ro" "${IMAGE}" \
    --exclude='./Dockerfile.fail' \
    --file-glob='Dockerfile*' \
    --exec-args='hadolint --config ./.hadolint.yml' \
  2>&1
  )"

  assertEquals "${pass}" ""
}

testInvalidDockerfileFails() {
  fail=$(
  docker run --rm -v "${HOST_VOLUME_PATH}:${WORKSPACE}:ro" "${IMAGE}" \
  --exclude='./Dockerfile.pass' \
    --file-glob='Dockerfile*' \
    --exec-args='hadolint --config ./.hadolint.yml' \
  2>&1
  )

  assertContains "${fail}" "DL3018"
}

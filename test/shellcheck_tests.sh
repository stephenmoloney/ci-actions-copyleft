#!/bin/sh

IMAGE=${2}
IMAGE="${IMAGE:-ci/shellcheck}"
RELATIVE_PATH=${3}
RELATIVE_PATH="${RELATIVE_PATH:-./shellcheck}"
HOST_VOLUME_PATH=${4}
HOST_VOLUME_PATH="${HOST_VOLUME_PATH:-${PWD}/test/ci-shellcheck}"
VERSION=${5}
VERSION="${VERSION:-0.6.0}"
WORKSPACE=${6}
WORKSPACE="${WORKSPACE:-/ci-actions/workspace}"

if [ "${RELATIVE_PATH}" = "./shellcheck" ]; then
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

testValidShellScriptPasses() {
  pass="$(
  docker run --rm -v "${HOST_VOLUME_PATH}":"${WORKSPACE}":ro "${IMAGE}" \
    --exclude='./fail.sh' \
    --file-glob='*.sh' \
    --exec-args='shellcheck' \
  2>&1
  )"

  assertEquals "${pass}" ""
}

testInvalidShellScriptFails() {
  fail=$(
  docker run --rm -v "${HOST_VOLUME_PATH}":"${WORKSPACE}":ro "${IMAGE}" \
    --exclude='./pass.sh' \
    --file-glob='*.sh' \
    --exec-args='shellcheck' \
  2>&1
  )

  assertContains "${fail}" "SC2034:"
}

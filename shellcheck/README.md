# ci-actions-shellcheck
![License](https://img.shields.io/github/license/stephenmoloney/ci-actions-copyleft.svg?style=flat-square)
![Image Size](https://images.microbadger.com/badges/image/smoloney/ci-actions-shellcheck.svg)
![Image Version](https://images.microbadger.com/badges/version/smoloney/ci-actions-shellcheck.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/smoloney/ci-actions-shellcheck.svg?style=flat)

`ci-actions-shellcheck` is an action for linting shell scripts.

The image is available on the dockerhub as 
[smoloney/ci-actions-shellcheck](https://hub.docker.com/r/smoloney/ci-actions-shellcheck).

## Usage

### Github actions workflow example

```text
action "shellcheck" {
  uses = "stephenmoloney/ci-actions-copyleft/shellcheck@master",
  args = [
          "--exclude=./k8s/charts",
          "--file-glob='*.sh'",
          "--exec-args='shellcheck -x'"
         ]
}
```

### Gitlab-CI workflow example

```shell
docker run --rm -v "${PWD}":/ci-actions/workspace smoloney/ci-actions-shellcheck:latest \
  --exclude='./non-compliant-script.sh' \
  --file-glob='*.sh' \
  --exec-args='shellcheck -x'
```

## Arguments

```text
Usage:
docker run \
  --rm \
  -v ${PWD}:${WORKSPACE} smoloney/ci-actions-shellcheck:latest \
  [--exec_args EXEC_ARGS] [--exclude EXCLUDE...] [--file-glob FILE_GLOB]

Options:
  --exec_args Executable arguments to be passed to yammlint
  --file_glob The type of file to be found based on file extension. `*.sh` is recommended.
  --exclude (repeatable arg) directories to be ignored
```

### Arguments - exclusion paths

To exclude particular paths whether files or folders, enter them as follows:

```shell
--exclude='./invalid-scripts'
```

### Arguments - executable arguments

The command to executed is configurable. Run `shellcheck --help` for 
options and/or documentation.

```shell
--exec-args='shellcheck -x'
```

## License

[GPLv3](../LICENSE.txt)

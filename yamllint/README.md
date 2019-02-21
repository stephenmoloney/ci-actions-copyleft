# ci-actions-yamllint
![License](https://img.shields.io/github/license/stephenmoloney/ci-actions-copyleft.svg?style=flat-square)
![Image Size](https://images.microbadger.com/badges/image/smoloney/ci-actions-yamllint.svg)
![Image Version](https://images.microbadger.com/badges/version/smoloney/ci-actions-yamllint.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/smoloney/ci-actions-yamllint.svg?style=flat)

`ci-actions-yamllint` is an action for linting yaml files.

The image is available on the dockerhub as 
[smoloney/ci-actions-yamllint](https://hub.docker.com/r/smoloney/ci-actions-yamllint).

## Usage

### Github actions workflow example

```text
action "yamllint" {
  uses = "stephenmoloney/ci-actions-copyleft/yamllint@master",
  args = [
          "--exclude=./k8s/charts",
          "--file-glob='*.y*ml'",
          "--exec-args='yamllint --strict --config-file=./yamllint'"
         ]
}
```


### Gitlab-CI workflow example

```shell
docker run --rm -v "${PWD}":/ci-actions-copyleft/workspace smoloney/ci-actions-yamllint:latest \
  --exclude='./test/ci-yamllint/ignore-dir' \
  --exclude='./test/ci-yamllint/ignore-fail.yaml' \
  --file-glob='*.y*ml' \
  --exec-args='yamllint --strict --config-file=.yamllint.yml'
```

## Arguments

```text
Usage:
docker run \
  --rm \
  -v ${PWD}:${WORKSPACE} smoloney/ci-actions-yamllint:latest \
  [--exec_args EXEC_ARGS] [--exclude EXCLUDE...] [--file-glob FILE_GLOB]

Options:
  --exec_args Executable arguments to be passed to yammlint
  --file_glob The type of file to be found based on file extension. '*.y*ml' is recommended.
  --exclude (repeatable arg) directories to be ignored
```

### Arguments - exclusion paths

To exclude particular paths whether files or folders, enter them as follows:

```shell
--exclude='./k8s/test-charts' --exclude='.yamllint.yml'
```

### Arguments - executable arguments

The command to executed is configurable. Run `yamllint --help` for 
options and/or documentation.

```shell
--exec-args='yamllint --strict --config-file=.yamllint.yml'
```

## License

[GPLv3](../LICENSE.txt)

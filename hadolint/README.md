# ci-actions-hadolint
![License](https://img.shields.io/github/license/stephenmoloney/ci-actions-copyleft.svg?style=flat-square)
![Image Size](https://images.microbadger.com/badges/image/smoloney/ci-actions-hadolint.svg)
![Image Version](https://images.microbadger.com/badges/version/smoloney/ci-actions-hadolint.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/smoloney/ci-actions-hadolint.svg?style=flat)

`ci-actions-hadolint` is an action for linting dockerfiles.

The image is available on the dockerhub as 
[smoloney/ci-actions-hadolint](https://hub.docker.com/r/smoloney/ci-actions-hadolint).

## Usage

### Github actions workflow example

```text
action "hadolint" {
  uses = "stephenmoloney/ci-actions-copyleft/hadolint@master",
  args = [
          "--exclude=./k8s/charts",
          "--file-glob='Dockerfile*'",
          "--exec-args='hadolint --config ./.hadolint.yml'"
         ]
}
```


### Gitlab-CI workflow example

```shell
docker run --rm -v "${PWD}":/ci-actions-copyleft/workspace smoloney/ci-actions-hadolint:latest \
  --file-glob='Dockerfile*' \
  --exec-args='hadolint --config ./.hadolint.yml'
```

## Arguments

```text
Usage:
docker run \
  --rm \
  -v ${PWD}:${WORKSPACE} smoloney/ci-actions-hadolint:latest \
  [--exec_args EXEC_ARGS] [--exclude EXCLUDE...] [--file-glob FILE_GLOB]

Options:
  --exec_args Executable arguments to be passed to yammlint
  --file_glob The type of file to be found based on file extension. `Dockerfile*` is recommended.
  --exclude (repeatable arg) directories to be ignored
```

### Arguments - exclusion paths

To exclude particular paths whether files or folders, enter them as follows:

```shell
--exclude='./Dockerfile.dev'
```

### Arguments - file glob

The file glob is the file extensions that will be found and in turn have 
the executable command run against. `Dockerfile*` is recommended.

```shell
--file-glob='Dockerfile*'
```

### Arguments - executable arguments

The command to executed is configurable. Run `hadolint --help` for 
options and/or documentation.

```shell
--exec-args='hadolint --config ./.hadolint.yml'
```

## License

[GPLv3](../LICENSE.txt)

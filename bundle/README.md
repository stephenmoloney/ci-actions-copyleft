# ci-actions-copyleft-bundle
![License](https://img.shields.io/github/license/stephenmoloney/ci-actions-copyleft.svg?style=flat-square)
![Image Size](https://images.microbadger.com/badges/image/smoloney/ci-actions-copyleft-bundle.svg)
![Image Version](https://images.microbadger.com/badges/version/smoloney/ci-actions-copyleft-bundle.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/smoloney/ci-actions-copyleft-bundle.svg?style=flat)

`ci-actions-copyleft-bundle` is an image bundled with a collection of actions using programs that 
are licensed under GPLv3 or GPLv3 compatible licenses. This image is useful if one does not 
want to download each docker image separately.

The image is available on the dockerhub as 
[ci-actions-copyleft-bundle](https://hub.docker.com/r/smoloney/ci-actions-copyleft-bundle).

## Usage

See the table below of links to `README.md` files for detailed information on each action.

| Package                                                                                                    |
| ---------------------------------------------------------------------------------------------------------- |
| [yamllint](https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/yamllint/README.md)           | 
| [shellcheck](https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/shellcheck/README.md)       | 
| [hadolint](https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/hadolint/README.md)           | 

### Gitlab-CI workflow example (yamllint lint)

```shell
docker run --rm -v ${PWD}:/ci-actions-copyleft/workspace \
  smoloney/ci-actions-copyleft-bundle:latest \
  --exec-args=''
```

### Gitlab-CI workflow example (shellcheck lint)

```shell
docker run --rm -v ${PWD}:/ci-actions-copyleft/workspace \
  smoloney/ci-actions-copyleft-bundle:latest \
  --exec-args=''
```

### Gitlab-CI workflow example (hadolint lint)

```shell
docker run --rm -v ${PWD}:/ci-actions-copyleft/workspace \
  smoloney/ci-actions-copyleft-bundle:latest \
  --exec-args=''
```

## License

[MIT](../LICENSE.txt)

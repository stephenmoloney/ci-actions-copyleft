# ci-actions-bundle-copyleft
![License](https://img.shields.io/github/license/stephenmoloney/ci-actions-copyleft.svg?style=flat-square)
![Image Size](https://images.microbadger.com/badges/image/smoloney/ci-actions-bundle-copyleft.svg)
![Image Version](https://images.microbadger.com/badges/version/smoloney/ci-actions-bundle-copyleft.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/smoloney/ci-actions-bundle-copyleft.svg?style=flat)

`ci-actions-bundle-copyleft` is an image bundled with a collection of actions using programs that 
are licensed under copyleft licenses such as GPLv3. This image is useful if one does not 
want to download each docker image separately.

The image is available on the dockerhub as 
[ci-actions-bundle-copyleft](https://hub.docker.com/r/smoloney/ci-actions-bundle-copyleft).

## Usage

See the table below of links to `README.md` files for detailed information on each action.

| Package                                                                                                    |
| ---------------------------------------------------------------------------------------------------------- |
| [yamllint](https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/yamllint/README.md)           | 
| [shellcheck](https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/shellcheck/README.md)       | 
| [hadolint](https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/hadolint/README.md)           | 

### Gitlab-CI workflow example (yamllint lint)

```shell
docker run --rm -v ${PWD}:/ci-actions/workspace \
  smoloney/ci-actions-bundle-copyleft:latest \
  --file-glob='*.y*ml' \
  --exec-args='yamllint --strict --config-file=.yamllint.yml'
```

### Gitlab-CI workflow example (shellcheck lint)

```shell
docker run --rm -v ${PWD}:/ci-actions/workspace \
  smoloney/ci-actions-bundle-copyleft:latest \
  --file-glob='*.sh' \
  --exec-args='shellcheck -x'
```

### Gitlab-CI workflow example (hadolint lint)

```shell
docker run --rm -v ${PWD}:/ci-actions/workspace \
  smoloney/ci-actions-bundle-copyleft:latest \
  --file-glob='Dockerfile*' \
  --exec-args='hadolint --config ./.hadolint.yml'
```

## License

[MIT](../LICENSE.txt)

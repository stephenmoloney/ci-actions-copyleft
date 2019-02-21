# ci-actions-copyleft
![Build Status](https://img.shields.io/travis/stephenmoloney/ci-actions-copyleft/master.svg?style=flat)
![License](https://img.shields.io/github/license/stephenmoloney/ci-actions-copyleft.svg?style=flat-square)

ci-actions-copyleft is a collection of tasks targetting ci pipelines with programs that have 
copyleft licenses, notably the GPLv3 library.

***Note:*** 
Another library named [ci-actions](https://github.com/stephenmoloney/ci-actions) 
has more actions which is more liberally licensed under the [MIT](https://choosealicense.com/licenses/mit/) license.
 
The collections are outlined in the tables below with links to the readme of the specific action.

## Linting

| Linting Package                                                                                        | Purpose                           | Dockerhub Image Name                                                                         | Recent Image Tags          |
| ------------------------------------------------------------------------------------------------------ | --------------------------------- | -------------------------------------------------------------------------------------------- | -------------------------- |
| [yamllint](https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/yamllint/README.md)       | For linting yaml files            | [smoloney/ci-actions-yamllint](https://hub.docker.com/r/smoloney/ci-actions-yamllint)        | `latest`, `1.14.0`         | 
| [shellcheck](https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/shellcheck/README.md)   | For linting shell scripts         | [smoloney/ci-actions-shellcheck](https://hub.docker.com/r/smoloney/ci-actions-shellcheck)    | `latest`, `0.6.0`          | 
| [hadolint](https://github.com/stephenmoloney/ci-actions-copyleft/tree/master/hadolint/README.md)       | For linting dockerfiles           | [smoloney/ci-actions-hadolint](https://hub.docker.com/r/smoloney/ci-actions-hadolint)        | `latest`, `1.16.0`         | 

## Tests

Run the tests

```shell
bash test.sh
```
## License

[GPLv3](LICENSE.txt)

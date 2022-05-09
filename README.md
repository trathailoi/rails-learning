# Rails Learning

Note:

* If you don't want to install Ruby and Rails on your machine, that's fine. You can run the application inside Docker containers, no need to install anything but Docker on your machine.
* You can find all commands and tasks in the [Makefile file](Makefile).

## Getting started

### Prerequisites

* **Docker** (*it's mandatory, because we will run PostgreSQL in container, it will probably be the same for Redis, Elasticsearch, Mailhog, .etc*)
* *Ruby 3.1.2* *(optional, as we can have it in container)*
* *Rails 7.0.2.4* *(optional, as we can have it in container)*

### Recommended IDE Setup

* [VSCode](https://code.visualstudio.com/)
* ... and other recommended extensions listed in [`<rootDir>/.vscode/extensions.json`](.vscode/extensions.json)

## Tasks and commands

***Note:** I'm on Mac, so those commands below may not work expectedly on Windows.*

### Run application

* without Docker:

  ```bash
  make start-dev
  ```

* with Docker:

  ```bash
  make start-dev-docker
  ```

### Unit test

* with Docker:

  ```bash
  make unit-test-docker
  ```

* without Docker:

  ```bash
  make unit-test
  ```

*Note: The database which is used for testing will be cleaned up (teardown) after every test run.*
<!-- - this will be automatically run on Github Action on every git push or PR on branch `develop`. You can find the workflow at [https://github.com/trathailoi/gsrs-exercise/actions/workflows/unit-test.yml](https://github.com/trathailoi/gsrs-exercise/actions/workflows/unit-test.yml)
find the coverage at [<rootDir>/coverage/lcov-report/index.html](coverage/lcov-report/index.html) -->

## Commit message convention

* `build`: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
* `ci`: Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)
* `docs`: Documentation only changes
* `feat`: A new feature
* `fix`: A bug fix
* `perf`: A code change that improves performance
* `refactor`: A code change that neither fixes a bug nor adds a feature
* `style`: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
* `test`: Adding missing tests or correcting existing tests,
* `revert`: Revert,
* `wip`: Work in progress, not finished yet

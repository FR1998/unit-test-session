# Unit Test Session


### Environment Setup
- Copy ENV file `cp config/env/.env.example .env`
- Update env variables


### Project Setup
- `make dev.build`: build containers
- `make dev.up`: start containers in attached mode
- `make dev.migrate`: run `migrate` command in django container
- `make dev.down` : stop containers and remove networks

### Run Test Case

To run tests in your Django project, you can use the following commands:

### Run Test Case

To run tests in your Django project, you can use the following commands:

- **Run all tests in the project:**
  ```bash
  make test
  ```
  This command is equivalent to:
  ```bash
  ./manage.py test
  ```

- **Run tests in a specific module:**
  ```bash
  ./manage.py test animals.tests
  ```

- **Run a specific test case class:**
  ```bash
  ./manage.py test animals.tests.AnimalTestCase
  ```

- **Run a specific test method:**
  ```bash
  ./manage.py test animals.tests.AnimalTestCase.test_animals_can_speak
  ```


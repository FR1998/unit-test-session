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
- `make test` : run Django tests

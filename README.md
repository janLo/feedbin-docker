# Feedbin

Feedbin dockerized

# Requirements

- Docker
- Docker-compose

### Instructions

1. Clone this repo.

2. Fill in the environment variables in `docker-compose.yml`

3. Run `docker-compose up`

4. After the initial deployment, run:

```
docker exec -it feedbindocker_feedbin_1 bash
cd /opt/feedbin && rake db:setup
```

which sets up the Postgres database for first time usage.

Visit Feedbin at [localhost:9292/](localhost:9292)

### Hint

You might also want to edit the User model to only allow certain emails...

# Spring Data with Liquibase in Action

**Example of Spring Data implementation with Liquibase**

## Overview

The application is designed as a service with no user interface and no API.

Once the application is started, the migration scripts for the database are executed and the application terminates.

## Technologies

- `Java` - version `17`
- `Maven` - for building the application
- `Spring Boot` - version `3.2.5`
- `Liquibase` - for manage changes to the database
- `Spring Boot Maven Plugin` - for create Docker-Image
- `Docker-Compose` - infrastructure
- `Postgres` - database

## Structure of the project

```
spring-data-with-liquibase-in-action/
├── src/main/
|   ├── java/com/dudko/example/             # spring boot application
|   ├── resources/
|   |   ├── changelog/
|   |   |   ├── migrations/                 # migration scripts
|   |   |   ├── rollbacks/                  # rollback scripts
|   |   |   ├── db.schema.migrations.yml    # change sets
|   |   ├── application.yml                 # config for Spring Boot
|   |   ├── liquibase.properties            # config for Liquibase
|   |   ├── master-changelog.yml
├── pom.xml                                 # artifact of Maven
├── compose.yml                             # docker-compose file
```

## How to try this project?

```sh
docker-compose -f compose.yml up
```

### Author:

Anatoly Dudko

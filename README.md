# SolarNetwork Developer VerneMQ MQTT Broker Docker

This project contains a Docker configuration for a VerneMQ MQTT broker instance
configured for SolarNetwork development. The container will be initialized with
the following users from the [vmq.passwd](./vmq.passwd) file:

| User         | Password     |
| :----------- | :----------- |
| `admin`      | `admin`      |
| `solarnet`   | `solarnet`   |
| `solarinstr` | `solarinstr` |

The [vmq.acl](./vmq.acl) permissions will be applied.

# Using with SolarNet development

The default configuration for the [SolarNet applications](https://github.com/SolarNetwork/solarnetwork-central/tree/develop/solarnet)
will be to connect to an MQTT broker at `mqtt://localhost:1883`. You must configure appropriate credentials, however. Typically
this would be done by creating a `development` profile configuration file `application-development.yml` in the directory of the application, for example
for SolarIn this would be `solarnetwork-central/solarnet/solarin/application-development.yml`. The MQTT settings you'd configure
look like this:

```yml
app:
  solarqueue:
    connection:
      mqtt-config:
        username: "solarnet"
        password: "solarnet"
```

You can see the overall default settings in each application's `src/main/resources/application.yml` configuration file.

# Building

You can use `make` with the following targets:

| Target    | Description                                          |
| :-------- | :--------------------------------------------------- |
| `build`   | Create the Docker image                              |
| `rebuild` | Create the Docker image, ignoring any cached layers. |
| `run`     | Launch the container                                 |
| `start`   | Start a previously stopped container                 |
| `stop`    | Stop a launched container                            |
| `remove`  | Remove the container.                                |

# Customize the VerneMQ port

By default VerneMQ will be listening on port `1883`. You can customize that
by passing `PORT=X` to the `run` target, like

```sh
make run PORT=1234
```

# ntfy.sh on fly.io
## Configs
Change the `server.yml` configs to suit your needs, this is a custom example, for more info go to [fly.io configuration docs](https://docs.ntfy.sh/config/)

## Admin User
you can change the `NTFY_PASSWORD` env var in the startup.sh script or add it to fly.io with `fly env set NTFY_PASSWORD=my_secret_password` 


## Run it!
run it with `fly deploy`

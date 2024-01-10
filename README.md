# GrupoTP-26

## Checkpoint 1

1. Create Network for all the Containers

```
docker network create laravel_net
```

2. Run MYSQL Database (laraveldb container)

```
docker run --name laraveldb --net laravel_net -p 3306:3306 -d \
       -e  MYSQL_USER=myuser \
       -e MYSQL_PASSWORD=password \
       -e MYSQL_DATABASE=laravel \
       -e MYSQL_ALLOW_EMPTY_PASSWORD=true  \
        mysql:latest
```

3. Build Laravelio Image

```
docker build . -t laravelio
```

4. Run Laravelio (laravel container)

```
docker run --name laravel --net laravel_net -p 80:8000 -d \
       -e DB_CONNECTION=mysql \
       -e DB_HOST=laraveldb \
       -e DB_DATABASE=laravel \
       -e DB_USERNAME=myuser \
       -e DB_PASSWORD=password \
       laravelio
```

5. Test

```
curl --write-out '%{http_code}' --silent http://localhost:80/ --output output.html
```

## Checkpoint 2

### Docker Image

The docker image was upload to docker hub with the name: `brandao07/laravelio:latest`.

### Ansible

#### Vault

Right now we are just storing the GCP credentials in the vault file. The password is stored in the `vault_pass.txt` file.


1. Test

```
ansible-playbook -i inventory/gcp.yml test-all.yml
```


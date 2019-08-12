# rancher ssl
If you find anything that seems to be broken or not working as described below please open an issue or a pull request. Thanks!

This is a docker image to be able to run rancher with SSL using nginx and letsencrypt. All you need to do is the following steps:

- Setup a DNS a record for the domain you want to use so it points to the same node as you want to run this container on. Wait for it to be active.

- Restart your rancher server container but **without** exposing the 8080 port and give it a name e.g. rancher-server

- Start a rancher-ssl container by running one of the commands below.

```bash
# This will store certificates inside the container and they will be lost if the container is removed.

sudo docker run --restart=always -p 80:80 -p 443:443 --link <rancher_name>:rancher-server --name rancher-ssl -d -e EMAIL=<your_email> -e DOMAIN=<your_domain> hajnalmt/rancher-ssl
```

```bash
# Specify a volume to store your certificates on the host. They will be stored when you remove the container etc.

sudo docker run --restart=always -p 80:80 -p 443:443 -v <host_vol>:/etc/letsencrypt --link <rancher_name>:rancher-server --name rancher-ssl -d -e EMAIL=<your_email> -e DOMAIN=<your_domain> hajnalmt/rancher-ssl
```

To inspect what your rancher-ssl container is doing run the follwing command:

```bash
docker logs --follow rancher-ssl
```

nginx should be started and you should be able to go to http://your_domain it will redirect you to https://your_domain and you are now running rancher with SSL.

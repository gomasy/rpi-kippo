# rpi-kippo
Dockerfile for kippo, based on rpi-raspbian

for example:
```sh
$ docker build -t gomasy/rpi-kippo .
$ docker run -it --name kippo -p 22:2222 -v /var/run/mysqld/mysqld.sock:/var/run/mysqld/mysqld.sock gomasy/rpi-kippo
```

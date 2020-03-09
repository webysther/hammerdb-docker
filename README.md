[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fwebysther%2Fhammerdb-docker.svg?type=shield&style=flat-square)](https://app.fossa.io/projects/git%2Bgithub.com%2Fwebysther%2Fhammerdb-docker?ref=badge_shield)
[![Software License](https://goo.gl/FU2Kw1)](LICENSE)

# 🐋 Docker for HammerDB

[HammerDB](https://github.com/TPC-Council/HammerDB) is a Database Load Testing and Benchmarking Tool.

Configured and working clients for MS SQL Server, PotsgreSQL, MySQL and Redis.

```
docker run -it webysther/hammerdb ./hammerdbcli

hammerdb>librarycheck
tdbc::odbc for MSSQLServer
mysqltcl for MySQL
Pgtcl for PostgreSQL
redis for Redis
```

## Usage

```bash
# show help
docker run webysther/hammerdb

# access cli
docker run -it webysther/hammerdb ./hammerdbcli
```

## License

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fwebysther%2Fhammerdb-docker.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fwebysther%2Fhammerdb-docker?ref=badge_large)

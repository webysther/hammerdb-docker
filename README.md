[![Build Status](https://img.shields.io/docker/build/webysther/hammerdb.svg?style=flat-square)](https://hub.docker.com/r/webysther/hammerdb/)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fwebysther%2Fhammerdb-docker.svg?type=shield&style=flat-square)](https://app.fossa.io/projects/git%2Bgithub.com%2Fwebysther%2Fhammerdb-docker?ref=badge_shield)
[![Software License](https://goo.gl/FU2Kw1)](LICENSE)

# 🐋 Docker for HammerDB

[HammerDB](https://github.com/TPC-Council/HammerDB) is a Database Load Testing and Benchmarking Tool.

Configured and working clients for MS SQL Server, PotsgreSQL, MySQL and Redis.

```
docker run -it webysther/hammerdb ./hammerdbcli

hammerdb>librarycheck
Checking database library for Oracle
Error: failed to load Oratcl - can't read "env(ORACLE_HOME)": no such variable
Ensure that Oracle client libraries are installed and the location in the LD_LIBRARY_PATH environment variable
Checking database library for MSSQLServer
Success ... loaded library tdbc::odbc for MSSQLServer
Checking database library for Db2
Error: failed to load db2tcl - couldn't load file "/HammerDB-3.3/lib/db2tcl2.0.0/libdb2tcl.so.0.0.1": libdb2.so.1: cannot open shared object file: No such file or directory
Ensure that Db2 client libraries are installed and the location in the LD_LIBRARY_PATH environment variable
Checking database library for MySQL
Success ... loaded library mysqltcl for MySQL
Checking database library for PostgreSQL
Success ... loaded library Pgtcl for PostgreSQL
Checking database library for Redis
Success ... loaded library redis for Redis
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

FROM debian

# MySQL driver
ENV MYSQL_MAJOR 8.0
ENV MYSQL_VERSION 8.0.19-1debian9

RUN apt-get update && apt-get install --no-install-recommends -y gnupg
RUN set -ex; \
# gpg: key 5072E1F5: public key "MySQL Release Engineering <mysql-build@oss.oracle.com>" imported
  key='A4A9406876FCBD3C456770C88C718D3B5072E1F5'; \
  export GNUPGHOME="$(mktemp -d)"; \
  gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
  gpg --batch --export "$key" > /etc/apt/trusted.gpg.d/mysql.gpg; \
  gpgconf --kill all; \
  rm -rf "$GNUPGHOME"; \
  apt-key list > /dev/null

RUN echo "deb http://repo.mysql.com/apt/debian/ stretch mysql-${MYSQL_MAJOR}" > /etc/apt/sources.list.d/mysql.list
RUN apt-get update && apt-get install -y mysql-community-client="${MYSQL_VERSION}" libmysqlclient21

# PostgreSQL driver
RUN apt-get install -y libpq-dev

# MS SQL Server driver
RUN apt-get install -y unixodbc-dev

# HammerDB
ENV HAMMER_VERSION=3.3
ENV HAMMER_URI=https://github.com/TPC-Council/HammerDB/releases/download

RUN apt-get install -y curl
RUN curl -kLJO {$HAMMER_URI}/v{$HAMMER_VERSION}/HammerDB-{$HAMMER_VERSION}-Linux.tar.gz
RUN tar -zxvf HammerDB-$HAMMER_VERSION-Linux.tar.gz \
  && rm -rf HammerDB-$HAMMER_VERSION-Linux.tar.gz \
  && mv HammerDB-$HAMMER_VERSION hammerdb \
  && mkdir hammerdb/data

WORKDIR /hammerdb
VOLUME hammerdb/data

CMD ["./hammerdbcli", "help"]

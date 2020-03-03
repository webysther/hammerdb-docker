FROM debian

ENV HAMMER_VERSION=3.3
ENV HAMMER_URI=https://github.com/TPC-Council/HammerDB/releases/download

ENV MYSQL_MAJOR 8.0
ENV MYSQL_VERSION 8.0.19-1debian9

# cURL
RUN apt-get update && apt-get install --no-install-recommends -y curl gnupg

# MySQL
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

RUN curl -kLJO {$HAMMER_URI}/v{$HAMMER_VERSION}/HammerDB-{$HAMMER_VERSION}-Linux.tar.gz
RUN tar -zxvf HammerDB-$HAMMER_VERSION-Linux.tar.gz \
	&& rm -rf HammerDB-$HAMMER_VERSION-Linux.tar.gz \
	&& cd HammerDB-$HAMMER_VERSION
WORKDIR /HammerDB-$HAMMER_VERSION
CMD ["./hammerdbcli", "help"]
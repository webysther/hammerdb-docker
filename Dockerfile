FROM debian

ENV HAMMER_VERSION=3.3
ENV HAMMER_URI=https://github.com/TPC-Council/HammerDB/releases/download

RUN apt-get update && apt-get install --no-install-recommends -y curl
RUN curl -kLJO {$HAMMER_URI}/v{$HAMMER_VERSION}/HammerDB-{$HAMMER_VERSION}-Linux.tar.gz
RUN tar -zxvf HammerDB-$HAMMER_VERSION-Linux.tar.gz \
	&& rm -rf HammerDB-$HAMMER_VERSION-Linux.tar.gz \
	&& cd HammerDB-$HAMMER_VERSION
WORKDIR /HammerDB-$HAMMER_VERSION
CMD ["./hammerdbcli", "help"]
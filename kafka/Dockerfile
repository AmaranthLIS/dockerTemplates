FROM openjdk:7-jre

WORKDIR /usr/local/kafka
ENV PATH $PATH:/usr/local/kafka/bin

# https://kafka.apache.org/downloads.html
ENV KAFKA_VERSION 1.0.0
ENV SCALA_VERSION 2.11
ENV KAFKA_TGZ_MD5 760c15b192412ea4114368f6d6a391fa

ENV KAFKA_TGZ_URLS \
# https://issues.apache.org/jira/browse/INFRA-8753?focusedCommentId=14735394#comment-14735394
	https://www.apache.org/dyn/closer.cgi?action=download&filename=kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
# if the version is outdated, we might have to pull from the dist/archive :/
	https://www-us.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
	https://www.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
	https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

ENV KAFKA_ASC_URLS \
	https://www.apache.org/dyn/closer.cgi?action=download&filename=kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz.asc \
# not all the mirrors actually carry the .asc files :'(
	https://www-us.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz.asc \
	https://www.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz.asc \
	https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz.asc

RUN set -eux; \
	\
	success=; \
	for url in $KAFKA_TGZ_URLS; do \
		if wget -O kafka.tgz "$url"; then \
			success=1; \
			break; \
		fi; \
	done; \
	[ -n "$success" ]; \
	\
	echo "$KAFKA_TGZ_MD5 *kafka.tgz" | md5sum -c -; \
	\
	tar -xf kafka.tgz --strip-components 1; \
	rm kafka.tgz

RUN sed -i 's!^zookeeper.connect=.*!zookeeper.connect=zookeeper:2181!' config/server.properties

CMD ["kafka-server-start.sh", "config/server.properties"]
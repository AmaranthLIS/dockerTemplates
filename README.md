# dockerTemplates
short-template-file


-----
# mvn package && java -jar target/gs-spring-boot-docker-0.1.0.jar

$ mvn package docker:build
$ docker push lis7/gs-spring-boot-docker
	$ ./gradlew build buildDocker
$ docker run -p 8080:8080 -t lis7/gs-spring-boot-docker

--- Set var
${env.USER}
export DOCKER_CERT_PATH=/Users/user/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.1.33:2376



--------------------
When you need build spring boot and docker for microservice:
$ spring jar app.jar app.groovy
$ rm -rf app/ && unzip -q app.jar -d app
$ find ./app/lib/ | xargs touch -t 0000000000.00
$ docker build .
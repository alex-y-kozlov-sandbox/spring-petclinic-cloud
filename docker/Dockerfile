FROM openjdk:11-jre as builder
WORKDIR application
ARG ARTIFACT_NAME
COPY ${ARTIFACT_NAME}.jar application.jar
RUN java -Djarmode=layertools -jar application.jar extract

# Download dockerize and cache that layer
ARG DOCKERIZE_VERSION
RUN wget -O dockerize.tar.gz https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-alpine-linux-amd64-${DOCKERIZE_VERSION}.tar.gz
RUN tar xzf dockerize.tar.gz
RUN chmod +x dockerize

RUN wget -O dd-java-agent.jar https://dtdg.co/latest-java-tracer


# wget is not installed on adoptopenjdk:11-jre-hotspot
FROM adoptopenjdk:11-jre-hotspot

WORKDIR application

# Dockerize
COPY --from=builder application/dockerize ./

ARG EXPOSED_PORT
EXPOSE ${EXPOSED_PORT}

ENV SPRING_PROFILES_ACTIVE docker

COPY --from=builder application/dependencies/ ./
COPY --from=builder application/spring-boot-loader/ ./
COPY --from=builder application/snapshot-dependencies/ ./
COPY --from=builder application/application/ ./

COPY --from=builder application/dd-java-agent.jar /workspace/BOOT-INF/lib
ENV JAVA_OPTS=-javaagent:/path/to/dd-java-agent.jar

ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]

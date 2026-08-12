FROM          openjdk:17-ea-17
RUN           sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
              sed -i 's/security.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
              sed -i '/buster-updates/d' /etc/apt/sources.list && \
              echo "Acquire::Check-Valid-Until \"false\";" > /etc/apt/apt.conf.d/99no-check-valid-until && \
              apt update &&\
              apt install unzip
RUN           useradd -d /app -m roboshop
USER          roboshop
WORKDIR       /app
#ADD           --chown=roboshop --chmod=444 https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip /app/
#RUN           unzip newrelic-java.zip
COPY          ./shipping-1.0.jar /app/shipping.jar
#COPY          ./nrb64 /app/
#RUN           cat nrb64 |base64 --decode >newrelic/newrelic.yml
ENTRYPOINT    ["java", "-XX:MaxRAMPercentage=95.0", "-XX:InitialRAMPercentage=50.0", "-jar", "/app/shipping.jar"]

#####

## Stage 1 - Artifact Stage
#FROM openjdk:17-ea-17-slim AS builder
#
#WORKDIR /app
#
#COPY shipping-1.0.jar shipping.jar
#
## Stage 2 - Runtime
#FROM eclipse-temurin:17-jre-jammy
#
#RUN useradd -m -d /app roboshop
#
#WORKDIR /app
#
#COPY --from=builder /app/shipping.jar /app/shipping.jar
#
#USER roboshop
#
#ENTRYPOINT ["java", "-XX:MaxRAMPercentage=95.0", "-XX:InitialRAMPercentage=50.0", "-jar", "/app/shipping.jar"]
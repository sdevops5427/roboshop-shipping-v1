FROM        openjdk:18-ea-17-slim
RUN         useradd -d /app roboshop
USER        roboshop
WORKDIR     /app
COPY        ./shipping-1.0.jar /app/shipping.jar
ENTRYPOINT  ["java", "jar", "/app/shipping.jar"]

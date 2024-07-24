FROM openjdk:17-jdk-alpine
USER root
WORKDIR /app
COPY . .
RUN ./gradlew build
RUN cp /app/build/libs/app.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
FROM eclipse-temurin:21-jre-alpine

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY build/libs/*.jar /app/application.jar

USER appuser

ENTRYPOINT ["java", "-jar", "/app/application.jar"]
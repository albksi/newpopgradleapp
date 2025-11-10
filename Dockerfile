# syntax = docker/dockerfile:1.7-labs
# ↑ enables modern features like COPY --parents (optional but nice)

FROM eclipse-temurin:21-jre-alpine AS runtime

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy only the built JAR from the previous job's workspace
# Path matches default Gradle output
COPY build/libs/*.jar /app/application.jar

# Switch to non-root
USER appuser

# Run it
ENTRYPOINT ["java", "-jar", "/app/application.jar"]
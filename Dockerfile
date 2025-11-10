FROM eclipse-temurin:21-jre-alpine

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy compiled classes (from ./gradlew build)
COPY build/classes/java/main/ /app/classes/

# Switch to non-root
USER appuser

# Run directly from classes
ENTRYPOINT ["java", "-cp", "/app/classes", "com.bex.newpopgradleapp.HelloApp"]
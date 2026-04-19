# Build stage: compile the source
FROM eclipse-temurin:21-jdk-alpine AS builder
WORKDIR /app
COPY Hello.java .
RUN javac Hello.java

# Runtime stage: only the JRE and compiled class
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=builder /app/Hello.class .
CMD ["java", "Hello"]

FROM java:11-jdk-slim

WORKDIR /app

COPY main.java .

RUN javac main.java

CMD ["java", "/app/main"]
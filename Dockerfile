FROM openjdk:17
WORKDIR /app
COPY target/*.jar .
EXPOSE 8761
CMD ["java", "-jar", "*.jar"]

FROM openjdk:17
WORKDIR /app
COPY target/*.jar .
RUN 'maven clean install'
EXPOSE 8761
CMD ["java", "-jar", "*.jar"]

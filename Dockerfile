FROM maven:3.8.1-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests


FROM tomcat:10.1-jre17-temurin
COPY --from=build /app/target/shopping-cart-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/shopping-cart-0.0.1-SNAPSHOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]

##description

full stack application, initiated by the knowledge of covering from architecture, in this case architecture three layers, taking into account what was previously written.

We create the database:

*database*
we initialize XAMPP
When we have the Apache and MySQL modules initialized we go to the following url provided by the XAMPP 'admin' http://localhost/phpmyadmin/index.php

We will go to the top to the "import" option and import the database provided in the file ./dump-the_guardians_db-202304282154.sql
to manage the database creation was originally in DBeaver

having the database created, we will do the following step:

*spring boots*
What is Java Spring Boot? Java Spring Framework (Spring Framework) is a popular open source enterprise framework for building production-grade standalone applications that run on the Java virtual machine

The application was created on the page https://start.spring.io where we can add dependencies,
in this case we install the following:

-Spring Web WEB
Build web, including RESTful, applications using Spring MVC. Uses Apache Tomcat as the default embedded container.


-Spring Data JPA SQL
Persist data in SQL stores with Java Persistence API using Spring Data and Hibernate.

-Spring Boot Actuator OPS
Supports built in (or custom) endpoints that let you monitor and manage your application - such as application health, metrics, sessions, etc.

They are dependencies that will help us in the development of our application.

in our application these dependencies are already installed

we check if in our 'application.
propiertes' is our linked database.

For example:
#configuration
spring.jpa.hibernate.ddlAuto=update
spring.datasource.url=jdbc:mysql://localhost:3306/the_guardians_db
spring.datasource.username=root
spring.datasource.password=
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.mvc.path-match.matching-strategy=ant-
path matcher

We run our application from C:\Users\ander\Desktop\ProyectoFinal\Characters-Api-Spring-Boot-main\src\main\java\com\example\characters\CharactersApplication.java


when executing it will indicate a message by terminal that the port of tomcat 8080
we can make some queries from postman checking the methods in characterController 'Characters-Api-Spring-Boot-main\src\main\java\com\example\characters\Controller\CharacterController.java'


initially the characters could be seen in the front done but there were errors in the implementation


*frontend with react.js*
The Auth0 library was used to create a record for users.
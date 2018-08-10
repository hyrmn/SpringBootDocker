# SpringBootDocker
A sample app with spring boot on docker

This uses a multi-stage Dockerfile. The first stage compiles the application and prepares the JAR. The second stage copies the JAR from the first stage and sets the entry point for the container.

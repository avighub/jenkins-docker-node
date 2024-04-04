### Setting up Jenkins

### First time setup
- Run ```docker build -t local-jenkins-image .``` to build  the Docker image with Jenkins, node and git installed
- Run jenkins container with volume mapping : ```docker run --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home local-jenkins-image```
- Copy the secret from logs or get it from ```/var/jenkins_home/secrets/initialAdminPassword``` from the jenkins container
- Open Jenkins interface in browser at ```http://localhost:8080/``` and finish installation with recommended plugins
- Credentials: 
  - username: ```avishek```
  - password: ```avishek```
- local jenkins_home : ```/var/jenkins_home/```
- container jenkins_home: ```/var/jenkins_home```

### Running existing container from existing volume
- Assuming the container with name ```jenkins``` still exist and not removed
- Assuming volume name ```jenkins_home``` still exists and not removed
```docker start jenkins```

### References:
- https://github.com/jenkins-docs/quickstart-tutorials
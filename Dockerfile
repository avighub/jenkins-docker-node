# Use the official Jenkins image from Docker Hub
FROM jenkins/jenkins:latest

# Switch to root user to install additional packages
USER root

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs

# Install Git
RUN apt-get install -y git

# We change the ownership of the jobs directory to the Jenkins user.
# This ensures that the Jenkins server can access and manage the jobs.
RUN chown -R jenkins:jenkins /var/jenkins_home/

# Switch back to the Jenkins user
USER jenkins

# We copy a list of plugins to install to the Jenkins ref directory in the image.
# COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# We use the Jenkins plugin CLI to install the plugins listed in the plugins.txt file.
# RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

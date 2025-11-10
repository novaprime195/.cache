# 34. Demonstrate use of bug tracking tool/any foss tool and create the docker image  of that tool. Push that image. Run the docker container from recently created image and run that docker container. Push that image.

# Create project directory:
mkdir ~/expert/mantisbt-docker
cd ~/expert/mantisbt-docker


# Dockerfile:
# Use official PHP + Apache image
FROM php:8.2-apache

# Install dependencies for MantisBT
RUN apt-get update && apt-get install -y \
    unzip wget mariadb-client libldap2-dev libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli ldap

# Download latest MantisBT release
WORKDIR /var/www/html
RUN wget https://downloads.sourceforge.net/project/mantisbt/mantis-stable/2.26.0/mantisbt-2.26.0.zip -O mantis.zip \
    && unzip mantis.zip \
    && mv mantisbt-2.26.0/* . \
    && rm -rf mantis.zip mantisbt-2.26.0

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]


# Build the image
docker build -t mantisbt:latest .


# run container
docker run -d --name mantisbt -p 8080:80 mantisbt:latest


# Open browser:
👉 http://localhost:8080
You should see the MantisBT installation page.


# Log in:
docker login


# Tag your image:
docker tag mantisbt:latest <your_dockerhub_username>/mantisbt:latest


# Push to Docker Hub
docker push <your_dockerhub_username>/mantisbt:latest
<!-- eg.,docker tag mantisbt:latest ssaa/mantisbt:latest -->


# Run from pushed image (for proof)
docker run -d --name mantisbt-demo -p 8081:80 <your_dockerhub_username>/mantisbt:latest


# If got error:
docker ps


# check port number and its name:
docker stop <name>
<!-- or -->
docker rm <name>



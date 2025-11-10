<!-- If not having container -->
cd ~/expert/mantisbt-docker
docker build -t mantisbt:latest .
docker tag mantisbt:latest username/mantisbt:latest
docker login
docker push username/mantisbt:latest


<!-- Pull your image (optional if it’s local) -->
docker pull username/mantisbt:latest


<!-- Run the container on host port 80 -->
docker run -d --name mantisbt-container -p 80:80 username/mantisbt:latest
<!-- Run the container on host port 5000 -->
docker run -d --name mantisbt5000 -p 5000:80 username/mantisbt:latest


<!-- Verify container is running -->
docker ps


<!-- (Optional) Check logs -->
docker logs mantisbt-container


<!-- If port 80 is already in use -->
sudo systemctl stop apache2

docker run -d --name mantisbt-container -p 8080:80 username/mantisbt:latest

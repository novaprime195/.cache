# Mount any directory of host system to the container.
# Prepare a host directory:
mkdir ~/mydata
echo "Hello from host system!" > ~/mydata/hostfile.txt


# Run a container with volume mount
docker run -it --name mount-demo -v ~/mydata:/data ubuntu


# Inside the container shell:
ls /data
cat /data/hostfile.txt


# Test bidirectional sync
# Create a file inside the container:
echo "Hello from container!" > /data/containerfile.txt


# Then check on host:
cat ~/mydata/containerfile.txt

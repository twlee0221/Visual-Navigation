# TODO: if container already exists, restart the container
CONTAINER_NAME = "robot_dev"
IMAGE = "iamtae/jammy-ros2-humble"
docker run -it -d -v /home:/home --privileged --name ${CONTAINER_NAME} ${IMAGE}
info "Entering Docker Container ${CONTAINER_NAME} with Docker Image ${IMAGE}"
docker exec -it robotics /bin/bash

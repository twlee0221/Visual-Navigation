# TODO: if container already exists, restart the container
docker run -it -d -v /home:/home --privileged --name robotics iamtae/jammy-ros2-humble
docker exec -it robotics /bin/bash

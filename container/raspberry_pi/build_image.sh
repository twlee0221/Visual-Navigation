unset {http,https,ftp}_proxy && unset {HTTP,HTTPS,FTP}_PROXY
docker buildx build --platform linux/arm64/v8 -t iamtae/jammy-ros2-humble:latest --push container/raspberry_pi

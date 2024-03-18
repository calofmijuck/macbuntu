# Customized Ubuntu 20.04 Image

Includes oh-my-zsh and other configurations.

```
docker build -t calofmijuck/ubuntu:20.04 .
docker run -it -d \
    --hostname ... \
    --name ... \
    calofmijuck/ubuntu:20.04
```

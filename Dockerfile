#
# Redis Dockerfile
#
# https://github.com/dockerfile/redis
#

# Pull base image.
FROM dockerfile/ubuntu

# Install Redis.
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:chris-lea/redis-server
RUN apt-get update
RUN apt-get install -y redis-server

# Mount directory.
VOLUME ["/redis"]
WORKDIR /redis

# Expose ports.
EXPOSE 6379

# Turn this container into an executable.
ENTRYPOINT ["redis-server"]
CMD ["-h"]

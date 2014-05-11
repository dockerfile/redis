#
# Redis Dockerfile
#
# https://github.com/dockerfile/redis
#

# Pull base image.
FROM dockerfile/ubuntu

# Install Redis.
RUN cd /tmp && wget http://download.redis.io/redis-stable.tar.gz
RUN cd /tmp && tar xvzf redis-stable.tar.gz
RUN cd /tmp/redis-stable && make && make install
RUN cp -f /tmp/redis-stable/src/redis-sentinel /usr/local/bin
RUN mkdir -p /etc/redis
RUN cp -f /tmp/redis-stable/*.conf /etc/redis
RUN rm -rf /tmp/redis-stable*
RUN sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf
RUN sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf
RUN sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf
RUN sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["redis-server", "/etc/redis/redis.conf"]

# Expose ports.
EXPOSE 6379

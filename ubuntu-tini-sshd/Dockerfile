# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04

# Install OpenSSH server and necessary packages
RUN apt-get update && apt-get install -y openssh-server tini \
curl wget vim nano procps lsb-release tzdata locales plocate \
traceroute iputils-ping net-tools iproute2 \
git tcpdump lrzsz \
&& rm -rf /var/lib/apt/lists/*

# Create SSH directory and set permissions
RUN mkdir -p /var/run/sshd
RUN chmod 0755 /var/run/sshd

# Optional: Set up a user and password (or use SSH keys for better security)
# For example, create a user 'dockeruser' with password 'password'
RUN echo "root:docker" | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config # Allows root login for simplicity

# Expose the SSH port
EXPOSE 22

# Use tini as the entrypoint to handle process reaping and signal forwarding
# The --init flag in docker run handles this, but explicitly defining ENTRYPOINT ensures it
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/usr/sbin/sshd", "-D"]

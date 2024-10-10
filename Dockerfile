# 1. Start from an Ubuntu base image
FROM ubuntu:latest

# 2. Set environment variables to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# 3. Update the package list and install Apache2
RUN apt-get update && apt-get install -y apache2

# 4. Copy the custom index.html to the Apache default web directory
COPY index.html /var/www/html/index.html

# 5. Ensure Apache2 runs automatically when the container starts
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# 6. Expose port 80 to allow access to Apache2
EXPOSE 80

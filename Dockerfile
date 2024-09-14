# Use Debian Buster Slim as the base image
FROM debian:buster-slim

# Update package lists and install necessary packages
RUN apt-get update && apt-get install -y python3 imagemagick ffmpeg git rsync

# Clear APT package lists
RUN rm -rf /var/lib/apt/lists/*

# Clone the code and add an alias
RUN git clone https://github.com/fankangsong/Expose.git /root/gallery
RUN echo "alias expose=/root/gallery/expose.sh" >> ~/.bashrc

# Create a directory for generated files
RUN mkdir /root/dist

# Set the working directory
WORKDIR /root/dist/

# Execute expose.sh script when the container starts
CMD ["sh", "-c", "/root/gallery/expose.sh"]

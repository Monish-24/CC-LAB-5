# Use the lightweight Nginx image as the base
FROM nginx:alpine

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Remove default Nginx files
RUN rm -rf ./*

# Install Git and clone your portfolio repository
RUN apk add --no-cache git && \
    git clone https://github.com/Monish-24/CC-LAB-5.git /temp-repo && \
    cp -r /temp-repo/* . && \
    rm -rf /temp-repo

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]


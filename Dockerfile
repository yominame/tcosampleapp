# Use the official Nginx image as the base
FROM nginx:alpine

# Copy custom index page to the default nginx html directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 for HTTP
EXPOSE 80

# Nginx starts automatically from the base image's CMD

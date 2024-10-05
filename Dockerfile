# Use the official Nginx image as a parent image
FROM nginx:alpine

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy a new configuration file from the current directory
COPY nginx.conf /etc/nginx/conf.d/

# Copy the current directory contents into the container at /usr/share/nginx/html
COPY . /usr/share/nginx/html

# Make port 80 available to the world outside this container
EXPOSE 80

# Run Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]


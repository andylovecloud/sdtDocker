# Use the official Nginx base image
FROM nginx:alpine

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Copy the HTML files to the container
COPY ./www /usr/share/nginx/html

# Start Nginx web server
CMD ["nginx", "-g", "daemon off;"]

# to run the image type docker run -d -p 89:80 imagename
# after running type in your browser: localhost:89, you should see the page

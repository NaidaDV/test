
# Using Ubuntu image
FROM ubuntu:18.04
# Information about me
MAINTAINER denys naida <NaidaDV@nmu.one>
# Updating and upgrading 
RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y
# Deleting default nginx page
RUN rm /var/www/html/*.html
# Copying artifact to nginx
COPY ./build/* /var/www/html
# Starting nginx
CMD ["nginx", "-g", "daemon off;"]

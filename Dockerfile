
# Using Ubuntu image
FROM ubuntu:18.04
# Information about me
MAINTAINER denys naida <NaidaDV@nmu.one>
# Updating and upgrading 
RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y
# Copying artifact to nginx
COPY ./build/* /usr/share/nginx/html
# Starting nginx
CMD ["nginx", "-g", "daemon off;"]

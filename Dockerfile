# Node Image
#FROM node:11.13.0-alpine as node_base_image
#WORKDIR /root/
#COPY /custom/common/resources/package.json ./
# Installing node modules using npm install
#RUN ["npm", "install"]
# Keycloak Image
FROM jboss/keycloak:15.0.2
ADD ./standalone-ha.xml /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml
# Copy custom folder which contain custon login and registration page
COPY custom /opt/jboss/keycloak/themes/custom

# Copy node modules from node image to keycloak image
COPY /custom/common/resources/ ./opt/jboss/keycloak/themes/custom/common/resources
COPY /custom/common/resources/ ./opt/jboss/keycloak/themes/keycloak/common/resources  
FROM nodered/node-red:latest

# Install required build tools for Alpine
USER root
RUN apk add --no-cache python3 make g++ linux-headers bash

# Switch to the node-red user
USER node-red
WORKDIR /data

# Copy your flow and credential files
COPY flows.json /data/flows.json


# Install Node-RED Dashboard
RUN npm install --prefix /data --unsafe-perm node-red-dashboard@3.6.0

# Expose the default Node-RED port
EXPOSE 1880
ENV PORT=1880

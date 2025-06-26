FROM nodered/node-red:latest

# Switch to root to install build tools
USER root

# Use apk (Alpine's package manager)
RUN apk add --no-cache \
    python3 \
    make \
    g++ \
    linux-headers \
    bash

# Switch back to node-red user
USER node-red
WORKDIR /data

# Copy flow files
COPY flows.json /data/flows.json
COPY flows_cred.json /data/flows_cred.json

# Install the Node-RED dashboard in correct user scope
RUN npm install --prefix /data --unsafe-perm node-red-dashboard@3.6.0

# Expose Node-RED default port
EXPOSE 1880
ENV PORT=1880

FROM nodered/node-red:latest

USER root

# Install build dependencies (if needed for MQTT or dashboard)
RUN apk add --no-cache python3 make g++ linux-headers bash

USER node-red
WORKDIR /data

# Copy flows first (to avoid npm wiping during layer caching)
COPY flows.json /data/flows.json
COPY flows_cred.json /data/flows_cred.json

# Install dashboard and MQTT broker node
RUN npm install --unsafe-perm node-red-dashboard
RUN npm install --unsafe-perm node-red-contrib-mqtt-broker

# Expose Node-RED default port
EXPOSE 1880
ENV PORT=1880

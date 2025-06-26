FROM nodered/node-red:latest

# Add dependencies for native module compilation
USER root
RUN apt-get update && \
    apt-get install -y build-essential python3

# Switch to Node-RED user directory
USER node-red
WORKDIR /data

# Copy your flows early
COPY flows.json /data/flows.json

# Install required nodes
RUN npm install --unsafe-perm node-red-dashboard
RUN npm install --unsafe-perm node-red-contrib-mqtt-broker

# Expose port
EXPOSE 1880
ENV PORT=1880

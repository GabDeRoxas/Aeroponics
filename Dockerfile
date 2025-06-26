# Use the official Node-RED image
FROM nodered/node-red:latest

# Set working directory to /data
WORKDIR /data

# Copy flow file first (before installing modules, in case of package-lock.json conflicts)
COPY flows.json /data/flows.json

# Install dashboard (UI)
RUN npm install --unsafe-perm node-red-dashboard

# Optional: Install MQTT broker node
RUN npm install --unsafe-perm node-red-contrib-mqtt-broker

# Expose Node-RED port
EXPOSE 1880

# Set environment port (Render uses this)
ENV PORT=1880

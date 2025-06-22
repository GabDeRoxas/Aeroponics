FROM nodered/node-red:latest

# Install dashboard (UI)
RUN npm install --unsafe-perm node-red-dashboard

# Optional: Install MQTT node explicitly
RUN npm install --unsafe-perm node-red-contrib-mqtt-broker

# Copy flow and credential files
COPY flows.json /data/flows.json


# Optional: Copy settings if customized
# COPY settings.js /data/settings.js

# Expose Node-RED default port
EXPOSE 1880
ENV PORT=1880

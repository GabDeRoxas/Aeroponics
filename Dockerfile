FROM nodered/node-red:latest

# Install node-red-dashboard (UI components)
RUN npm install --unsafe-perm node-red-dashboard@3.6.0

# (Optional) Install MQTT package — usually preinstalled, but safe to include
RUN npm install --unsafe-perm node-red-contrib-mqtt-broker

# Copy your Node-RED flow and config
COPY flows.json /data/flows.json

# Optional: If you have custom Node-RED config, include it
COPY settings.js /data/settings.js

# Expose port for Render
EXPOSE 1880
ENV PORT=1880

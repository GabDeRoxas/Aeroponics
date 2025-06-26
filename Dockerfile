FROM nodered/node-red:latest



# Copy your Node-RED flow and config before npm installs
COPY flows.json /data/flows.json
COPY settings.js /data/settings.js

# Force remove new dashboard and install classic dashboard (v3)
RUN npm uninstall --unsafe-perm @flowfuse/node-red-dashboard || true
RUN npm install --unsafe-perm node-red-dashboard@3.6.5

# (Optional) Install embedded MQTT broker node
RUN npm install --unsafe-perm node-red-contrib-mqtt-broker

# Expose Node-RED default port
EXPOSE 1880
ENV PORT=1880
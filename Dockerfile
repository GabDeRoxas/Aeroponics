FROM nodered/node-red:latest

# Install node-red-dashboard (optional UI nodes)
RUN npm install node-red-dashboard

# Install WebSocket MQTT support
RUN npm install mqtt

# Copy flows and settings
COPY flows.json /data/flows.json
COPY settings.js /data/settings.js

EXPOSE 1880
ENV PORT=1880

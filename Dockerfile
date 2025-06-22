FROM nodered/node-red:latest

RUN npm install node-red-dashboard

COPY flows.json /data/flows.json
COPY settings.js /data/settings.js

EXPOSE 1880
ENV PORT=1880
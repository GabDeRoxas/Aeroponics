FROM nodered/node-red:latest


COPY flows.json /data/flows.json

EXPOSE 1880

ENV NODE_RED_ENABLE_PROJECTS=true
ENV PORT=1880

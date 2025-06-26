FROM nodered/node-red:latest

# Become root to install system tools
USER root
RUN apt-get update && apt-get install -y build-essential python3 && apt-get clean

# Switch to node-red user and set working directory
USER node-red
WORKDIR /data

# Copy flows
COPY flows.json /data/flows.json
COPY flows_cred.json /data/flows_cred.json

# Install dashboard in correct location
RUN npm install --prefix /data --unsafe-perm node-red-dashboard@3.6.0

# Expose port
EXPOSE 1880
ENV PORT=1880

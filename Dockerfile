# Dockerfile for nodejs
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install dependencies
RUN npm install -g pm2 && npm install

# Copy the rest of the application
COPY . .

# Configure PM2 Logrotate
RUN pm2 install pm2-logrotate && \
    pm2 set pm2-logrotate:max_size 10M && \
    pm2 set pm2-logrotate:retain 7 && \
    pm2 set pm2-logrotate:compress true && \
    pm2 set pm2-logrotate:dateFormat YYYY-MM-DD_HH-mm-ss

# Start the application using pm2
CMD ["pm2-runtime", "start", "ecosystem.config.js"]
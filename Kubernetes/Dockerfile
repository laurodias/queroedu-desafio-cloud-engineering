# Defining image containing the minimum packages to run node
FROM node:slim

# Defining environment variables
ENV NAME "Lauro Dias"
ENV USER "node"

# Preparing and injecting the application to the image
RUN mkdir /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
COPY app.js ./

# Installing dependencies
RUN npm install express

# Exposing application port
EXPOSE 3000

# Starting nodejs
CMD npm start

FROM node:12.9.1-alpine

# metadata
LABEL maintainer="Fausto Fusaro <fausto.fusaro@injenia.it>"

# network exposition
EXPOSE 8080 

# setup application
WORKDIR /usr/src/app

COPY app/package*.json ./
RUN npm install 
COPY app .

# command entrypoint
CMD ["node", "index.js"]
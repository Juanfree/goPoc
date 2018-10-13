FROM node:alpine

ADD sql_web_frontend/src /opt/site

WORKDIR /opt/site/site-server

RUN npm install --save

ENTRYPOINT node node-server.js

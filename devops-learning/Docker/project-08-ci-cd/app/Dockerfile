FROM node:20-alpine

WORKDIR /app 

COPY package*.json ./ 

RUN npm ci 

COPY server.js server.test.js ./ 

USER node 

EXPOSE 3000

CMD ["node", "server.js"]

FROM node:alpine AS builder

WORKDIR '/app'

COPY package*.json .

RUN npm install


FROM nginx
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html



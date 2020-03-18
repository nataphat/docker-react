FROM node:alpine AS builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm install

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

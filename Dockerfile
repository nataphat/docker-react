# install node modules
FROM node:alpine as build

WORKDIR '/app'
COPY package.json .
RUN npm install

# copy build artifact to nginx
FROM nginx
EXPOSE 80
COPY --from=build /app/ /usr/share/nginx/html

CMD ["npm","run","start"]
# install node modules
FROM node:boron-alpine as install
WORKDIR /usr/src/app
COPY package.json /usr/src/app
RUN npm install

# run build 
FROM install as build
RUN npm run build

# copy build artifact to nginx
FROM nginx
COPY --from=build /usr/src/app/build /usr/share/nginx/html
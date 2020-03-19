# install node modules
FROM node:boron-alpine as install
WORKDIR /usr/src/app
COPY package.json /usr/src/app
RUN npm install
# run unit test
FROM install as test
COPY src /usr/src/app/src
COPY public /usr/src/app/public
RUN npm test
# run build 
FROM test as build
RUN npm run build
# copy build artifact to nginx
FROM nginx
EXPOSE 80
COPY --from=build /usr/src/app/build /usr/share/nginx/html

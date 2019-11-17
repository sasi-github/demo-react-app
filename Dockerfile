#Build Stage Start

#Specify a base image
FROM node:alpine as builder 

#Specify a working directory
WORKDIR '/app'

#Copy the dependencies file
COPY package.json .

#Install dependencies
RUN npm config set registry http://registry.npmjs.org/
RUN yarn install

#Copy remaining files
COPY . .

#Build the project for production
RUN npm run build 

EXPOSE 5000

CMD [ "npm","run","server"]
#CMD [ "npm","start"]

#Run Stage Start
FROM nginx

#Copy production build files from builder phase to nginx
COPY --from=builder /app/build /usr/share/nginx/html

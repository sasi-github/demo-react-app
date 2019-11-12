#Build Stage Start

#Specify a base image
3FROM node:alpine as builder 

#Specify a working directory
WORKDIR '/app'

#Copy the dependencies file
COPY package.json .

#Install dependencies
RUN npm install

#Copy remaining files
COPY . .

#Build the project for production
RUN npm run build 

#Run Stage Start
3FROM nginx

#Copy production build files from builder phase to nginx
3COPY --from=builder /app/build /usr/share/nginx/html

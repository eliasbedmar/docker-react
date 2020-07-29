#Build phase

FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
# Copying source code to destination
COPY . .
RUN npm run build

#Run phase
FROM nginx
EXPOSE 80
#From initial Build phase - only care about /app/build
COPY --from=0 /app/build /usr/share/nginx/html
#Default command will start nginx for us.

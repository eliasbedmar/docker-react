#Build phase

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
# Copying all source code bc not in dev anymore
COPY . .
RUN npm run build

#From builder phase resulting image, we only care about /app/build (contain index, js code...)


#Run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#Default command will start nginx for us.

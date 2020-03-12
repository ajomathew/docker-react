FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Copy assets to next
# /app/build <---- copy items

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

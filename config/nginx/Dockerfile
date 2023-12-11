FROM node:18-bookworm as builder
WORKDIR /app
COPY ./frontend/ ./
RUN npm install && npm run build

FROM nginx:1.20.1
COPY --from=builder /app/dist /etc/nginx/html/
CMD ["nginx", "-g", "daemon off;"]

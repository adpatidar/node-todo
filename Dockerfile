FROM node:12.2.0-alpine
WORKDIR app
COPY . .
RUN npm install
RUN npm run test

FROM alpine
WORKDIR /app
COPY --from=0 app /app
EXPOSE 8000
RUN apk add --update npm
CMD ["node","app.js"]

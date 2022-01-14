FROM node:14.18.3 as build

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build --prod

FROM nginx:latest

COPY --from=build app/dist/tableauportal-frontend /usr/share/nginx/html

EXPOSE 4200
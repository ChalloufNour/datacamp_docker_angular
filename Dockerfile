## STAGE 1: Build ###
FROM node:12.7-alpine AS build
WORKDIR /usr/src/app

#Copiez les deux fichiers package.json package-lock.json
COPY package.json package-lock.json ./
RUN npm install

# Copier le contenu du projet
COPY . .
RUN npm run build --prod

### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf

# Copier les fichiers compilés du stage build
COPY --from=build /usr/src/app/dist/aston-villa-app  /usr/share/nginx/html

# Exposer le port 80
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


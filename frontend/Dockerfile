FROM node:18.18-alpine

WORKDIR /frontend_app

COPY package*.json ./
# Viteのインストール
# RUN npm install -g vite 
RUN npm i

EXPOSE 5173

COPY . .
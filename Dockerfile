FROM node:14-alpine AS base

ADD package.json yarn.lock /opt/app/
WORKDIR /opt/app
RUN yarn install --frozen-lockfile
ADD . /opt/app
RUN yarn build

FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=base /opt/app/dist /usr/share/nginx/html

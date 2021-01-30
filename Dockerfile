from node:lts
WORKDIR /workdir
RUN npm install @angular/cli @nestjs/cli
ENTRYPOINT [ "node" ]

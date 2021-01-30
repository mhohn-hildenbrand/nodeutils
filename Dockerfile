from node:lts
WORKDIR /workdir
RUN npm install --global @angular/cli @nestjs/cli serve
ENTRYPOINT [ "node" ]

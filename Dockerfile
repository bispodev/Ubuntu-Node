# Selecionando a imagem
FROM ubuntu:rolling

# Atualizações básicas
RUN apt-get update -y
RUN apt-get install -y apt-utils
RUN apt-get install -y build-essential

# Instalando progs necessarios
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_12.x
RUN apt-get install -y nodejs
RUN apt-get install -y npm

# Enviando aquivos para o docker
WORKDIR /usr/app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

# Comando para roda logo após iniciar o conteiner
CMD [ "npm", "start" ]


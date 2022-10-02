FROM node:18-alpine3.15

WORKDIR /home/node/app
RUN apk update && \
    apk add git yarn build-base autoconf automake libtool pkgconfig nasm curl vim exa bat bash openssh tzdata&& \
    yarn global add gatsby-cli && \
    gatsby options set package-manager yarn && \
    cat '/usr/share/zoneinfo/Asia/Tokyo' > /etc/localtime && \
    npm install -g commitizen

ARG USERNAME=node
USER $USERNAME
WORKDIR /home/$USERNAME/
EXPOSE 8000 9000

RUN sh -c "$(curl -fsLS https://chezmoi.io/get)" -- -b $HOME/.local/bin init --apply r-waki
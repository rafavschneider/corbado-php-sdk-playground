FROM php:7.2

ARG USER_ID
ARG GROUP_ID

RUN apt update \
    && apt install -y zip git

# composer installation
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer

WORKDIR /usr/src/app

RUN groupadd -g $GROUP_ID user && \
    useradd -u $USER_ID -g $GROUP_ID -s /bin/bash -m user && \
    chown -R $USER_ID:$GROUP_ID /usr/src/app
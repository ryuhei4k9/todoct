FROM mysql:5.7.25

# Set debian default locale to ja_JP.UTF-8
RUN apt-get update \
 && apt-get install -y locales \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen \
 && locale-gen ja_JP.UTF-8

ENV LC_ALL ja_JP.UTF-8

# Set MySQL config file
RUN mkdir -p /etc/my.cnf.d
COPY etc/my.cnf.d/* /etc//my.cnf.d/ \
     etc/* /etc/

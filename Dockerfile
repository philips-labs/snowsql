FROM ubuntu:latest
RUN apt update && apt upgrade -y
RUN apt install -y gpg unzip curl
RUN gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 37C7086698CB005C
RUN curl -O https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.21-linux_x86_64.bash
RUN curl -O https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.21-linux_x86_64.bash.sig
RUN gpg --verify snowsql-1.2.21-linux_x86_64.bash.sig snowsql-1.2.21-linux_x86_64.bash
RUN chmod +x snowsql-1.2.21-linux_x86_64.bash
RUN SNOWSQL_DEST=~/bin SNOWSQL_LOGIN_SHELL=~/.profile bash snowsql-1.2.21-linux_x86_64.bash
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

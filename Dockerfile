FROM mcr.microsoft.com/azureml/base:intelmpi2018.3-ubuntu16.04

# Set locale
RUN apt-get update
RUN apt-get install locales
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

# Install MS SQL v13 driver for PyOdbc
RUN apt-get install -y curl
RUN apt-get install apt-transport-https
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - 
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN exit
RUN apt-get update

RUN ACCEPT_EULA=Y apt-get install -y msodbcsql
RUN apt-get install -y unixodbc-dev

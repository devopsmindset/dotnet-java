FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /app
#ENV name
# copy and publish app and libraries
COPY . .
# RUN
RUN apt-get update
RUN apt-get install software-properties-common -y

RUN apt-get update
RUN apt-get install gnupg -y
RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
RUN add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
RUN apt-get update && apt-get install adoptopenjdk-8-hotspot -y
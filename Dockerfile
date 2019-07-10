FROM lovato/react-native-android
#Create app dir
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
#Versions
RUN npm -v
RUN node -v
#Install dependencies
COPY package.json .
COPY package-lock.json .
RUN npm install
RUN 
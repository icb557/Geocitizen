#!/bin/bash

cd ~/Geocitizen/front-end/

#fix dependencies' version
sed -i 's/"vue-material": "\^1\.0\.0-beta-7"/"vue-material": "1.0.0-beta-11"/' package.json

#set server's domain name
sed -i "s/host: 'localhost'/host: 'geocitizen.com'/" config/index.js
sed -i "s|backEndUrl = 'http://localhost:8080/citizen/'|backEndUrl = 'http://geocitizen.com:8080/citizen/'|" src/main.js

#install dependencies
npm install




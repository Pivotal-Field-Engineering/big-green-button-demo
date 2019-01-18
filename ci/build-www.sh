#!/bin/sh 
cd big-green-www/www
ln -s /opt/node_modules node_modules
echo "export const environment = { production: true, domain: '$DOMAIN', protocol: '$PROTOCOL', apiHost: '$API_HOST', mapsApiKey: '$GOOGLE_MAPS_API_KEY', versionCheckPath: '$VERSION_CHECK_PATH', refreshRate: '$REFRESH_RATE', appNameProd: '$APP_NAME_PROD' };" > src/environments/environment.prod.ts
ng build --source-map=false --configuration=production --preserve-symlinks
ng build --configuration=production-en --preserve-symlinks
ng build --configuration=production-nl --preserve-symlinks
npm run post-build 
cp -rf dist/www/* ../../build-output2/
mkdir ../../build-output2/en
cp -rf dist/www-en/* ../../build-output2/en/
mkdir ../../build-output2/nl
cp -rf dist/www-nl/* ../../build-output2/nl/

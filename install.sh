# usage source install.sh

wget https://terra-sz-hc1pro-cloudapi.oss-cn-shenzhen.aliyuncs.com/c0af9fe0d7eb4f35a8fe5b695e4d0b96/docker/cloud_api_sample_docker.zip
unzip cloud_api_sample_docker.zip
rm -rf __MACOSX

source CREDENTIALS.sh

cd cloud_api_sample
sudo docker load < cloud_api_sample_docker_v1.10.0.tar

sed -i -e "s/Please enter your ip./${SERVER_URL}/g" source/backend_service/sample/src/main/resources/application.yml
sed -i -e "s/id: Please enter the app id./id: ${DJI_ID}/g" source/backend_service/sample/src/main/resources/application.yml
sed -i -e "s/key: Please enter the app key./key: ${DJI_KEY}/g" source/backend_service/sample/src/main/resources/application.yml
sed -i -e "s/license: Please enter the app license./license: ${DJI_LICENSE_FOR_SED}/g" source/backend_service/sample/src/main/resources/application.yml

sed -i -e "s/Please enter the app id./${DJI_ID}/g" source/nginx/front_page/src/api/http/config.ts
sed -i -e "s/Please enter the app key./${DJI_KEY}/g" source/nginx/front_page/src/api/http/config.ts
sed -i -e "s/Please enter the app license./${DJI_LICENSE_FOR_SED}/g" source/nginx/front_page/src/api/http/config.ts

sed -i -e "s/Please enter the backend access address prefix./${SERVER_URL}:6789\//g" source/nginx/front_page/src/api/http/config.ts
sed -i -e "s/Please enter the WebSocket access address./ws:\/\/${SERVER_URL}:6789\/api\/v1\/ws/g" source/nginx/front_page/src/api/http/config.ts

sed -i -e "s/registry.nlark.com/registry.npmmirror.com/g" source/nginx/front_page/package-lock.json
sed -i -e "s/registry.nlark.com/registry.npmmirror.com/g" source/nginx/front_page/yarn.lock

echo "Yes, the next commands do require root privileges."
echo "Please enter your password to continue."

./update_backend.sh
./update_front.sh

echo "if everything worked, run the following command to start the docker containers"
echo "source start.sh"
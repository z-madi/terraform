```bash
docker pull hashicorp/terraform
docker run --rm -it --name terraform -v $(pwd):/workspace -w /workspace hashicorp/terraform:light apply digitalocean.tf

# ssh keys
mkdir -p $(pwd)/keys
cp $HOME/.ssh/id_rsa.pub $(pwd)/keys/
cp $HOME/.ssh/id_rsa $(pwd)/keys/ 


echo "Setting up SSH Keys"
rm -rf /root/.ssh/
mkdir -p /root/.ssh/
cp $(pwd)/keys/id_rsa.pub /root/.ssh/
cp $(pwd)/keys/id_rsa /root/.ssh/

chmod 700 /root/.ssh
chmod 644 /root/.ssh/id_rsa.pub
chmod 600 /root/.ssh/id_rsa

docker run -d -it --name terraform --entrypoint "/usr/bin/tail" -v ${pwd}:/workspace -w /workspace hashicorp/terraform:light sh tail -f /dev/null
docker exec -it terraform sh

terraform init
terraform validate
terraform plan
terraform apply

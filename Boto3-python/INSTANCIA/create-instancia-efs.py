import boto3 
ec2 = boto3.client('ec2', 
                   'us-east-1', 
                   aws_access_key_id='################', 
                   aws_secret_access_key='###############') 
conn = ec2.run_instances(InstanceType="t2.micro", 
                         MaxCount=1, 
                         MinCount=1, 
                         KeyName='toncat-host',
                         ImageId='ami-0c4f7023847b90238', ###UBUNTU 20:04
                         Monitoring={
                                'Enabled': False
                         },

UserData= '''#!/bin/bash
sudo apt-get update -y
sudo apt-get install apache2 php7.4 libapache2-mod-php7.4 php7.4-common php7.4-curl php7.4-intl php7.4-mbstring php7.4-json php7.4-xmlrpc php7.4-soap php7.4-mysql php7.4-gd php7.4-xml php7.4-cli php7.4-zip wget unzip git binutils ruby -y
sudo systemctl start apache2
sudo systemctl enable apache2
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto > /tmp/logfile
git clone https://github.com/aws/efs-utils
cd efs-utils/
./build-deb.sh
sudo apt-get -y install ./build/amazon-efs-utilsdeb
sudo su
echo "fs-0fac4efa75e011239.efs.us-east-1.amazonaws.com:/ /var/www/html/ nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport,_netdev 0 0" >> /etc/fstab
mount -a
sudo wget https://pages.cloudtreinamentos.com/aws/arquivos/suitecrm.zip
sudo unzip suitecrm.zip
cd aplicacao
sudo cp -R /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
''',

NetworkInterfaces=[{
 'SubnetId': 'subnet-00f57da157793d1b4',
 'DeviceIndex': 0,
 'AssociatePublicIpAddress': True,
 'Groups': ['sg-0c27615ee75a816a5']
 
 }],

)         
print(conn) 

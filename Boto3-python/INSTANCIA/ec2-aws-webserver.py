import boto3 
ec2 = boto3.client('ec2', 
                   'us-east-1', 
                   aws_access_key_id='####################', 
                   aws_secret_access_key='################') 
conn = ec2.run_instances(InstanceType="t2.micro", 
                         MaxCount=1, 
                         MinCount=1, 
                         KeyName='toncat-host',
                         ImageId='ami-09d56f8956ab235b3',   ### UBUNTU 20:04
                         Monitoring={
                                'Enabled': False
                         },

NetworkInterfaces=[{
 'SubnetId': 'subnet-0105ce7fca750dbb7',
 'DeviceIndex': 0,
 'AssociatePublicIpAddress': True,
 'Groups': ['sg-0c27615ee75a816a5']
 
 }],

)         
print(conn) 

##############################
AWS EC2, Boto3 and Python: Complete Guide with examples

https://www.learnaws.org/2020/12/16/aws-ec2-boto3-ultimate-guide/
https://hands-on.cloud/working-with-vpc-in-python-using-boto3/#h-creating-a-default-vpc

criando instancia
################################################################################################
import boto3 
ec2 = boto3.client('ec2', 
                   'us-east-1', 
                   aws_access_key_id='(*********', 
                   aws_secret_access_key='************') 
conn = ec2.run_instances(InstanceType="t2.micro", 
                         MaxCount=1, 
                         MinCount=1, 
                         KeyName="boto3pip.pem",
                         ImageId="ami-04505e74c0741db8d")
                         
print(conn) 

################################################################################################
parando instance_id
#################################

def stop_instance(instance_id):
    ec2_client = boto3.client("ec2", region_name="us-east-1")
    response = ec2_client.stop_instances(InstanceIds=[instance_id])
    print(response)
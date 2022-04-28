import boto3 
ec2 = boto3.client('ec2', 
                   'us-east-1', 
                   aws_access_key_id='AKIATX4TOZZAD77AB3ML', 
                   aws_secret_access_key='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') 
conn = ec2.run_instances(InstanceType="t2.micro", 
                         MaxCount=1, 
                         MinCount=1, 
                         KeyName="boto3pip.pem",
                         ImageId="ami-04505e74c0741db8d")
                         
print(conn) 
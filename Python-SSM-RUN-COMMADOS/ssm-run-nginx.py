import boto3 
ec2 = boto3.client('ec2', 
                   'us-east-1', 
                   aws_access_key_id='##############', 
                   aws_secret_access_key='##################') 

client = boto3.client('ssm',region_name='eu-west-2')
commands = ['echo "hello world" > hello.txt'] #this would be replaced by the command to execute the python script
instance_id = 'i-0fd467635779c48dd' #id being the instance id established from above
response = client.send_command(DocumentName='AWS-RunShellScript',
                               Parameters= 'commands',
)

              
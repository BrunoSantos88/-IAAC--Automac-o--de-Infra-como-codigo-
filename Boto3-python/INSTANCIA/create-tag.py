import boto3
# Creating the connection with the resource of AWS EC2 service 
ec2 = boto3.client('ec2', 
                   'us-east-1', 
                   aws_access_key_id='#################', 
                   aws_secret_access_key='######################') 
# Adding the Tag Boto3 for AWS EC2 using the instance ID
response = ec2.create_tags(
    Resources=[
        'i-07d8b9cf5d383c96b', 
    
    ],
    Tags=[
        {
            'Key': 'Name',
            'Value': 'webserver'
        },
    ]
)
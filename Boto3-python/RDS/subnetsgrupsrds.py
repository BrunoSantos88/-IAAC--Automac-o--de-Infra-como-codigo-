import boto3
client = boto3.client('rds', aws_access_key_id='##################',
                     aws_secret_access_key='##############',
                     region_name='us-east-1')

response = client.create_db_subnet_group(
    DBSubnetGroupDescription='rds-redes',
    DBSubnetGroupName='SUBNETS-REDE-PUCLICAS-RDS',
    SubnetIds=[
        'subnet-038318bf796202b3c',
        'subnet-00f57da157793d1b4',
        'subnet-0105ce7fca750dbb7',
      ],
)

print(response)
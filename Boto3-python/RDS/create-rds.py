import boto3
client = boto3.client('rds', aws_access_key_id='##########',
                     aws_secret_access_key='########',
                     region_name='us-east-1')

response = client.create_db_instance(
    AvailabilityZone='us-east-1a',
    VpcId= 'vpc-0cdc67c370f9aae6b',
    StorageType='gp2',
    AllocatedStorage=20,
    DBInstanceClass='db.t2.micro',
    DBInstanceIdentifier='zabbix-database',
    Engine='MySQL',
    EngineVersion='8.0.27',
    MasterUserPassword='zabbixzabbix',
    MasterUsername='zabbix',
    Port=3306,


    
)
print(response)

import boto3

client = boto3.client('rds')
response = client.delete_db_instance(
    DBInstanceIdentifier='zabbix-database',
    SkipFinalSnapshot=True,
)
print(response)

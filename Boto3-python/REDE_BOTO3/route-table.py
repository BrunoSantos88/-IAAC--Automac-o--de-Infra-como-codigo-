import logging
import boto3
from botocore.exceptions import ClientError
import json

AWS_REGION = 'us-east-1'

# logger config
logger = logging.getLogger()
logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s: %(levelname)s: %(message)s')

vpc_client = boto3.client("ec2", region_name="us-east-1")


def create_rt(vpc_id):
    """
    Creates a route table for the specified VPC with the specified configuration.
    """
    try:
        response = vpc_client.create_route_table(
            VpcId=vpc_id,
            TagSpecifications=[
                {
                    'ResourceType': 'route-table',
                    'Tags': [
                        {
                            'Key': 'Name',
                            'Value': 'roteamento-infra'
                        },
                    ]
                },
            ])

    except ClientError:
        logger.exception('Could not create the route table.')
        raise
    else:
        return response


if __name__ == '__main__':
    # Constants
    VPC_ID = 'vpc-0cdc67c370f9aae6b'
    logger.info(f'Creating a route ta ble...')
    rt = create_rt(VPC_ID)
    logger.info(f'Route table created with: {json.dumps(rt, indent=4)}')
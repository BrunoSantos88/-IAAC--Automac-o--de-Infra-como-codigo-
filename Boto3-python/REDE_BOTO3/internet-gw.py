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


def create_igw():
    """
    Creates an internet gateway with the specified configuration.
    """
    try:
        response = vpc_client.create_internet_gateway(TagSpecifications=[
            {
                'ResourceType': 'internet-gateway',
                'Tags': [
                    {
                        'Key': 'Name',
                        'Value': 'internet-GW-infra'
                    },
                ]
            },
        ])

    except ClientError:
        logger.exception('Could not create the internet gateway.')
        raise
    else:
        return response


if __name__ == '__main__':
    # Constants
    logger.info('Creating an internet gateway...')
    igw = create_igw()
    logger.info(f'Internet gateway created with: {json.dumps(igw, indent=4)}')
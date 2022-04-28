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


def attach_igw_to_vpc(internet_gateway_id, vpc_id):
    """
    Attaches an internet gateway to a VPC.
    """
    try:
        response = vpc_client.attach_internet_gateway(
            InternetGatewayId=internet_gateway_id, VpcId=vpc_id)

    except ClientError:
        logger.exception('Could not attach an internet gateway to a VPC.')
        raise
    else:
        return response


if __name__ == '__main__':
    # Constants
    INTERNET_GATEWAY_ID = 'igw-0d002c7ad21d87ae2'
    VPC_ID = 'vpc-0cdc67c370f9aae6b'
    logger.info('Attaching an internet gateway to the VPC...')
    igw = attach_igw_to_vpc(INTERNET_GATEWAY_ID, VPC_ID)
    logger.info(
        f'Internet gateway {INTERNET_GATEWAY_ID} attahced to the VPC {VPC_ID} successfully.'
    )
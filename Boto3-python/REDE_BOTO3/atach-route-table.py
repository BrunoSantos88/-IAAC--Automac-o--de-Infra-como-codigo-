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


def create_route(destination_cidr_block, gateway_id, route_table_id):
    """
    Creates a route in a route table within a VPC.
    """
    try:
        response = vpc_client.create_route(
            DestinationCidrBlock=destination_cidr_block,
            GatewayId=gateway_id,
            RouteTableId=route_table_id)

    except ClientError:
        logger.exception('Could not create the route.')
        raise
    else:
        return response


if __name__ == '__main__':
    # Constants
    DESTINATION_CIDR_BLOCK = '0.0.0.0/0'
    GATEWAY_ID = 'igw-0d002c7ad21d87ae2'
    ROUTE_TABLE_ID = 'rtb-042dd062fb9215be4'
    logger.info('Adding a route...')
    route = create_route(DESTINATION_CIDR_BLOCK, GATEWAY_ID, ROUTE_TABLE_ID)
    logger.info(
        f'Route added to the route table: {json.dumps(route, indent=4)}')
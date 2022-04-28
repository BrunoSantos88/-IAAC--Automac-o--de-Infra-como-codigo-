import logging
import boto3
from botocore.exceptions import ClientError
import json

AWS_REGION = 'us-east-1'

# logger config
logger = logging.getLogger()
logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s: %(levelname)s: %(message)s')

vpc_client = boto3.client("ec2", region_name='us-east-1')


def associate_route_table(route_table_id, subnet_id):
    """
    Associates a subnet in the VPC with a route table.
    """
    try:
        response = vpc_client.associate_route_table(
            RouteTableId=route_table_id, SubnetId=subnet_id)

    except ClientError:
        logger.exception(
            'Could not associate the route table with the subnet.')
        raise
    else:
        return response


if __name__ == '__main__':
    # Constants
    SUBNET_ID = 'subnet-070a5c40c7e842884'
    ROUTE_TABLE_ID = 'rtb-042dd062fb9215be4'
    logger.info('Associting a route table with the subnet...')
    route = associate_route_table(ROUTE_TABLE_ID, SUBNET_ID)
    logger.info(
        f'Route table associated succussfully: {json.dumps(route, indent=4)}')
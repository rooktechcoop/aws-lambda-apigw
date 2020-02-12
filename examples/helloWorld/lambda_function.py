
import logging
import json

logger = logging.getLogger()

def lambda_handler(event, context):

    return {
        'statusCode': 200,
        'body': 'Hello MC'
    }

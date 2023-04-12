import json
import os


def lambda_handler(event, context):
    print("Hello, world! Welcome to CloudWatch")

    project_name = os.environ.get("project_name", "not-assigned")
    dynamodb_name_pattern = os.environ.get("dynamodb_name_pattern", "not-assigned")
    postgres_endpoint = os.environ.get("postgres_endpoint")
    postgres_port = os.environ.get("postgres_port")

    exist_postgres_endpoint = postgres_endpoint is not None
    exist_postgres_port = postgres_port is not None

    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps({
            "project_name": project_name,
            "dynamodb_name_pattern": dynamodb_name_pattern,
            "postgres_endpoint": exist_postgres_endpoint,
            "postgres_port": exist_postgres_port
        })
    }

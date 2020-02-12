
module "lambda_2" {
    source  = "git::https://github.com/martincastrocm/aws-lambda-apigw"

    lambda_function_name            = "${var.project}-${var.stage}-second-lambda"
    lambda_code_path                = "../helloWorld"
    lambda_handler                  = "lambda_function.lambda_handler"
    lambda_runtime                  = "python3.8"
    lambda_policy_arn               = [aws_iam_policy.iampolicy_first_lambda.arn] 

    api_gateway_id                  = aws_api_gateway_rest_api.second_api_gateway.id
    api_gateway_root_resource_id    = aws_api_gateway_rest_api.second_api_gateway.root_resource_id
    resource_path                   = "first"
    request_method                  = "GET"
    stage_name                      = "dev"
    region                          = var.region
    account_id                      = var.accountId
    cors_enable                     = true
    
    environment = {
      variables = {
        "var1" = "value1"
      }
    }
    tags                            = {"tag1" = "value1"} 
   
}

resource "aws_iam_policy" "iampolicy_first_lambda" {
  name        = "${var.project}-${var.stage}-first-lambda-policy"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_api_gateway_rest_api" "second_api_gateway" {
  name        = "${var.project}-${var.stage}-second-api-gateway"
  description = "This is an apy for proobe the module"
}



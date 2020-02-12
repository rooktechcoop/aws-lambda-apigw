
module "lambda_1" {
    source  = "git::https://github.com/martincastrocm/aws-lambda-apigw"
    
    lambda_function_name            = "${var.project}-${var.stage}-first-lambda"
    lambda_code_path                = "../helloWorld"   # set this path to your lambda code path
    lambda_handler                  = "lambda_function.lambda_handler"
    lambda_runtime                  = "python3.8"
    lambda_policy_arn               = [aws_iam_policy.iampolicy_first_lambda.arn] 
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



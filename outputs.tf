output "lambda_arn" {
    description = "The ARN of the lambda"
    value       = aws_lambda_function.lambda.arn
}

output "lambda_role_arn" {
    description     = "The ARN of your lambda role"
    value           = aws_iam_role.lambda_role.arn
}

output "lambda_role_id" {
    description     = "The ARN of your lambda role"
    value           = aws_iam_role.lambda_role.id
}

output "lambda_role_name" {
    description     = "The ARN of your lambda role"
    value           = aws_iam_role.lambda_role.name
}

output "aws_api_gateway_resource_id" {
    description     = "The id of the api gateway resource"
    value           = concat(aws_api_gateway_resource.api_gateway_resource.*.id, [""])[0]
}

output "aws_api_gateway_resource_path" {
    description     = "The id of the api gateway resource"
    value           = concat(aws_api_gateway_resource.api_gateway_resource.*.path, [""])[0]
}
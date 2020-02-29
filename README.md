# aws-lambda-apigw
An AWS lambda module that allows API gateway rest API integration

## Usage

```hcl
module "lambda_1" {
    source  = "git::https://github.com/martincastrocm/aws-lambda-apigw"

    lambda_function_name            = "first-lambda"
    lambda_code_path                = "../helloWorld"   
    lambda_handler                  = "lambda_function.lambda_handler"
    lambda_runtime                  = "python3.8"
    lambda_policy_arn               = [aws_iam_policy.iampolicy_first_lambda.arn] 
}
```
For using rest API Gateway integration you must provide the api gateway id. 
If you do not specify a resource id, a new one it's going to be created.
You may provide cognito authorizers id for the method.
To enable CORs set the flag to true.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:------:|:-----:|
| lambda\_function\_name| A name for the lambda | string | `-` | yes |
| lambda\_description| Some description for your lambda | string | `"Some description for your lambda"` | no |
| lambda\_lambda\_code\_path | The path to your lamda code and packages | string | `-` | yes |
| lambda\_handler| Lambda handler, e.g: `lambda_function.lambda_handler` | string | `-` | yes |
| lambda\_runtime| Lambda runtime, e.g: `python3.8` | string | `-` | yes |
| lambda\_policy\_arn| A list of policie's arn to attach to your lambda role | list(string) | `-` | yes |
| api\_gateway\_id | If lambda API gateway is desired, then the id of the rest api | string | ` ` | no |
| api\_gateway\_root\_resource\_id | If API gateway is desired, then the parent resource id of the of the rest api | string | ` ` | no |
| resource\_path | If you want to create a new resource to your method, then the path to it | string | `path` | no |
| request\_method | The http request method | string | `GET` | no |
| authorizer\_id | The cognito authorizer id if desired | string | `` | no |
| stage\_name | The stage of the name to deploy the api request | string | `dev` | no |
| region | The aws region to deploy the API gateway | string | `` | no |
| account\_id | Your aws account id | string | `` | no |
| api\_gateway\_resource\_id | If you want to use an existing resource, its id | string | ` ` | no |
| api\_gateway\_resource\_path | If you want to use an existing resource, its path | string | ` ` | no |
| environment | `aws_lambda_function` environment block, that allows to set variables | object | `null` | no |
| tags | Tags to attach to your function | map | `null` | no |
| cors\_enable | Flag to enable or not cors | bool | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| lambda\_arn | ARN of the lambda |
| lambda\_role\_arn | ARN of the lambda role|
| lambda\_role\_id | ID of the lambda role|
| lambda\_role\_name | Name of the lambda role|
| lambda\_name | Name of the lambda|
| aws\_api\_gateway\_resource\_id | If created, the api gateway resource id|
| aws\_api\_gateway\_resource\_path | If created, the the api gateway resource path |

## Examples

* [lambda-basic](https://github.com/rooktechcoop/aws-lambda-apigw/tree/master/examples/lambda-basic)
* [lambda-apigw-integration](https://github.com/rooktechcoop/aws-lambda-apigw/tree/master/examples/lambda-apigw-integration)
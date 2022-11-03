##############################################################################
# GENERAL CONFIGURATION PARAMETERS
##############################################################################
variable "aws_region" {
  type        = string
  description = "AWS region. Only used for creating resource names using naming module"
  default     = "us-east-1"

  validation {
    condition     = contains(["us-east-1", "us-west-2", "eu-west-1", "eu-central-1", "ap-southeast-2"], var.aws_region)
    error_message = "Valid values are us-east-1, us-west-2, eu-west-1, eu-central-1, ap-southeast-2."
  }
}

variable "product_code_tag" {
  type        = string
  description = "PRD code to include in resource naming. This should be in the format PRDXXX/PRDXXXX."

  validation {
    condition = can(regex("^(PRD)[0-9]{3,4}$",
    var.product_code_tag))
    error_message = "Product code should be in format: PRDXXX/PRDXXXX."
  }
}

variable "environment_tag" {
  type        = string
  description = "Environment name, used for tagging and naming resources"
}

variable "inventory_code_tag" {
  type        = string
  description = "Inventory Code, used for tagging and naming resources"
}

variable "product_name" {
  type        = string
  description = "Product Name, used for naming resources"
}

variable "account_tag" {
  type        = string
  description = "Account Tag, used for naming resources"
}

variable "aws_profile" {
  type        = string
  description = "The AWS profile to use."
}

variable "iac_repo" {
  type        = string
  description = "The repository where the infrastructure-as-code exists."
}

##############################################################################
# TEMPLATES CONFIGURATION PARAMETERS
##############################################################################
variable "vpc" {
  type        = string
  description = "The VPC Name"
}

variable "lambda_function_ephemeral_storage_size" {
  description = "Amount of ephemeral storage (/tmp) in MB your Lambda Function can use at runtime. Valid value between 512 MB to 10,240 MB (10 GB)."
  type        = number
  default     = 512
}

variable "recreate_missing_package" {
  description = "Whether to recreate missing Lambda package if it is missing locally or not"
  type        = bool
  default     = true
}

variable "log_events" {
  description = "Boolean flag to enabled/disable logging of incoming events"
  type        = bool
  default     = false
}

variable "reserved_concurrent_executions" {
  description = "The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations"
  type        = number
  default     = -1
}

variable "cloudwatch_log_group_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in log group for Lambda."
  type        = number
  default     = 7
}

variable "handler_py" {
  description = "The handler for the lambda Function"
  type        = string
  default     = null
}

variable "lambda_py_description" {
  description = "The description of the Lambda function"
  type        = string
  default     = null
}

variable "lambda_py_source_path" {
  description = "The source path of the custom Lambda function"
  type        = string
  default     = null
}

variable "handler_go" {
  description = "The handler for the lambda Function"
  type        = string
  default     = null
}

variable "lambda_go_description" {
  description = "The description of the Lambda function"
  type        = string
  default     = null
}

variable "lambda_go_source_path" {
  description = "The source path of the custom Lambda function"
  type        = string
  default     = null
}

variable "lambda_py_architecture" {
  description = "The architecture of the Lambda function (arm64 or x86_64)"
  type        = string
  default     = "x86_64"
}

variable "lambda_go_architecture" {
  description = "The architecture of the Lambda function (arm64 or x86_64)"
  type        = string
  default     = "x86_64"
}

variable "lambda_node_source_path" {
  description = "The source path of the custom Lambda function"
  type        = string
  default     = null
}

variable "lambda_node_architecture" {
  description = "The architecture of the Lambda function (arm64 or x86_64)"
  type        = string
  default     = "x86_64"
}

variable "handler_node" {
  description = "The handler for the lambda Function"
  type        = string
  default     = null
}

variable "lambda_node_description" {
  description = "The description of the Lambda function"
  type        = string
  default     = null
}

output "function_arn" {
  description = "The ARN of the Lambda function"
  value = {
    for v, k in [
      module.lambda_go, module.lambda_python, module.lambda_node
    ] : v => k.lambda_function_arn
  }
}

output "function_name" {
  description = "The name of the Lambda function"
  value = {
    for v, k in [
      module.lambda_go, module.lambda_python, module.lambda_node
    ] : v => k.lambda_function_name
  }
}

output "function_invoke_arn" {
  description = "The Invoke ARN of the Lambda function"
  value = {
    for v, k in [
      module.lambda_go, module.lambda_python, module.lambda_node
    ] : v => k.lambda_function_invoke_arn
  }
}

output "function_qualified_arn" {
  description = "The qualified ARN of the Lambda function"
  value = {
    for v, k in [
      module.lambda_go, module.lambda_python, module.lambda_node
    ] : v => k.lambda_function_qualified_arn
  }
}

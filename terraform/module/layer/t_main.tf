resource "aws_lambda_layer_version" "monter_common_layer" {
  count = fileexists(var.layer_file_path) ? 1 : 0

  layer_name = "${var.project_prop.project_name}_${var.function_prop.function_name}"
  filename   = var.layer_file_path

  description = ""

  compatible_architectures = [var.lambda_prop.architectures]
  compatible_runtimes      = ["${var.lambda_prop.runtime}${var.lambda_prop.runtime_version}"]

  source_code_hash = filebase64sha256(var.layer_file_path)
}
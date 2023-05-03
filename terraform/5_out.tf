resource "local_file" "api_gateway_id" {
  content = module.monter_api_gateway_v2.out.api_gateway_id
  filename = "../${var.workspace}api_gateway_id.txt"
}
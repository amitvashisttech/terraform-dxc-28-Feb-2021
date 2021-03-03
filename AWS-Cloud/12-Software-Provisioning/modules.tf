#module "frontend" {
#   source = "./modules/ec2"
#   ec2_count = var.frontend_instance_count
#}





module "webserver" {
   source = "./modules/web"
   ec2_count = var.frontend_instance_count
}

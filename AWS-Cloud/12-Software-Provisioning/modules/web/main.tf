resource "aws_instance" "dev-app" {
  ami = data.aws_ami.myami.id
  instance_type = "t2.micro"
  count = var.ec2_count
  key_name = var.key_name
  vpc_security_group_ids = [var.sg_id]
  tags = {
    Name = "WebApp-test-01"
  }


 connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file(var.pvt_key)
    host     = self.public_ip
  }
  
  provisioner "file" { 
     source = "${path.module}/frontend"
     destination = "~/"
  }

  provisioner "remote-exec" { 
    inline = [
      "chmod +x ~/frontend/run_frontend.sh", 
      "sudo ~/frontend/run_frontend.sh",
   ]

 } 

}

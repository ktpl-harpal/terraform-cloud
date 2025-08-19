

resource "aws_instance" "Webserver" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"
  tags = {
    Name = "Web-tf"
  }
  vpc_security_group_ids = ["sg-0eb5b78aabca903f8"]
  # user_data              =  "${file("install_nginx.sh")}"
  user_data = file("${path.module}/install_nginx.sh")
  key_name  = "aws"
}

output "instance_details" {
  value = {
    instance_id       = aws_instance.Webserver.id
    instance_name     = aws_instance.Webserver.tags["Name"]
    instance_type     = aws_instance.Webserver.instance_type
    availability_zone = aws_instance.Webserver.availability_zone
    private_ip        = aws_instance.Webserver.private_ip
    public_ip         = aws_instance.Webserver.public_ip
  }
}
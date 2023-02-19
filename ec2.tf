resource "aws_instance" "first_server" {
  ami             = "ami-0dfcb1ef8550277af"
  instance_type   = "t2.micro"
  key_name        = "terraform"
  security_groups = ["terraform-sg"]
  user_data       = <<EOF
  #!/bin/bash
  yum -y update
  yum -y install httpd
  chkconfig httpd on
  service httpd start
  echo "This is the first server" > /var/www/html/index.html
  EOF
  tags = {
    Name   = "First web server"
    source = "terraform"
  }
}

resource "aws_eip" "first_server_eip" {
  instance = aws_instance.first_server.id
  vpc      = true
}

resource "aws_instance" "second_server" {
  ami             = "ami-0dfcb1ef8550277af"
  instance_type   = "t2.micro"
  key_name        = "terraform"
  security_groups = ["terraform-sg"]
  user_data       = <<EOF
  #!/bin/bash
  yum -y update
  yum -y install httpd
  chkconfig httpd on
  service httpd start
  echo "This is the second server" > /var/www/html/index.html
  EOF
  tags = {
    Name   = "Second web server"
    source = "terraform"
  }
}

resource "aws_eip" "second_server_ip" {
  instance = aws_instance.second_server.id
  vpc      = true
}
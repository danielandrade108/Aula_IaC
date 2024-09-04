resource "aws_instance" "ec2-pub-exercicio-subrede" {
  ami           = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"

  tags = {
    Name = "ec2-pub-exercicio-subrede"
  }

  ebs_block_device { // Bloco de armazenamento (disco)
    device_name = "/dev/sda1"
    volume_size = 30
    volume_type = "gp3"
  }

  subnet_id = aws_subnet.sub-az1-pub-exercicio-subrede.id
}

resource "aws_instance" "ec2-pri-exercicio-subrede" {
  ami           = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"

  tags = {
    Name = "ec2-pri-exercicio-subrede"
  }

  ebs_block_device { // Bloco de armazenamento (disco)
    device_name = "/dev/sda1"
    volume_size = 30
    volume_type = "gp3"
  }

  subnet_id = aws_subnet.sub-az1-pri-exercicio-subrede.id
}

resource "aws_vpc" "vpc-exercicio-subrede" {
  cidr_block = "10.10.0.0/23"

  tags = {
    Name = "vpc-exercicio-subrede"
   }
}

resource "aws_subnet" "sub-az1-pub-exercicio-subrede" {
  vpc_id = aws_vpc.vpc-exercicio-subrede.id
  cidr_block = "10.10.0.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "sub-az1-pub-exercicio-subrede"
   }
}

resource "aws_subnet" "sub-az1-pri-exercicio-subrede" {
  vpc_id = aws_vpc.vpc-exercicio-subrede.id
  cidr_block = "10.10.1.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name = "sub-az1-pri-exercicio-subrede"
   }
}
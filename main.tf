resource "aws_vpc" "sethwahleDOTcom" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "sethwahleDOTcom"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.sethwahleDOTcom.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_internet_gateway" "sethwahleDOTcom-igw" {
  vpc_id = aws_vpc.sethwahleDOTcom.id
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.sethwahleDOTcom.id
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.sethwahleDOTcom-igw.id
}

resource "aws_route_table_association" "public-rt-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_security_group" "sethwahleDOTcom-sg" {
  name = "sethwahleDOTcom-sg"
  description = "Security group for SethWahle.com"
  vpc_id = aws_vpc.sethwahleDOTcom.id
}

resource "aws_security_group_rule" "allow-http-inbound" {
    security_group_id = aws_security_group.sethwahleDOTcom-sg.id
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow-http-outbound" {
    security_group_id = aws_security_group.sethwahleDOTcom-sg.id
    type = "egress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow-https-inbound" {
    security_group_id = aws_security_group.sethwahleDOTcom-sg.id
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow-https-outbound" {
    security_group_id = aws_security_group.sethwahleDOTcom-sg.id
    type = "egress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}   

resource "aws_security_group_rule" "allow-ssh-inbound" {
    security_group_id = aws_security_group.sethwahleDOTcom-sg.id
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["136.53.168.21/32"]
}

# resource "aws_security_group_rule" "allow-ssh-outbound" {
#     security_group_id = aws_security_group.sethwahleDOTcom-sg.id
#     type = "egress"
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
# }

resource "aws_key_pair" "sethwahle-key" {
    key_name = "sethwahle-key"
    public_key = file("~/.ssh/sethwahle.pub")
}

resource "aws_instance" "sethwahleDOTcom-web-server" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public-subnet.id
    vpc_security_group_ids = [aws_security_group.sethwahleDOTcom-sg.id]
    key_name = aws_key_pair.sethwahle-key.key_name
    user_data = file("user-data.sh")
    tags = {
        Name = "sethwahleDOTcom-web-server"
    }

    provisioner "local-exec" {
        command = "echo '${aws_instance.sethwahleDOTcom-web-server.public_ip}' >> public_ip.txt"
    }

    provisioner "local-exec" {
        command = templatefile("${var.host_os}-ssh-config.tpl", {
            hostname = self.public_ip,
            user = "${var.ssh_user}",
            identityfile = "${var.ssh_identityfile}"
        })
        interpreter = var.host_os == "windows" ? ["Powershell", "-Command"] : ["bash", "-c"]
    }
}


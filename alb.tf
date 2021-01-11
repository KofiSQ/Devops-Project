provider "aws" {
  profile = var.profile
  region  = var.region-master
  alias   = "region-master"
}
provider "aws" {
  profile = var.profile
  region  = var.region-worker
  alias   = "region-worker"

}
resource "aws_tf" "application-lb" {
  provider       = aws.region-master
  name           = "jenkins-lb"
  internal       = false
  load_balancer_type = "application"
  secuirty_groups    = [aws_security_group.lb-sg.id]
  subnets            = [aws_security_1.id, aws_subnet.subnet_2.id]
  tags = {
    Name = "Jenkins-LB"
    }

}
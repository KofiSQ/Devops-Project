utput "Jenkins-Main-Node-Public-IP" {
  value = aws_instance.jenkins-master.public_ip

}

output "jenkins-Worker-Public-IPs" {
  value = {
    for instance in aws_instance.jenkins-worker-oregon :
    instance.id => instance.public_ip
  }
}
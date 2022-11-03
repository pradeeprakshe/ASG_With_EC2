resource "aws_launch_configuration" "web" {
  name_prefix = "web-"
image_id = "var.ami_id" 
  instance_type = "t2.micro"
  key_name = "tests"
security_groups = [ "${aws_security_group.demosg.id}" ]
  associate_public_ip_address = true
  user_data = "${file("USERDATAFILEWILLKEEPHERE")}"
lifecycle {
    create_before_destroy = true
  }
}
resource "aws_launch_template" "this_template" {
  name_prefix   = "linux_template"
  image_id      = var.linux_ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.main_security_group.id ]

}

resource "aws_autoscaling_group" "bar" {
  desired_capacity   = 2
  max_size           = 4
  min_size           = 1
  force_delete = true
  vpc_zone_identifier = [ aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id  ]



  launch_template {
    id      = aws_launch_template.this_template.id
    version = "$Latest"
    

  } 
  
}
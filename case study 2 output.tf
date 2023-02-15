output "instance_ids" {
  value = aws_instance.my_vm.*.id
}

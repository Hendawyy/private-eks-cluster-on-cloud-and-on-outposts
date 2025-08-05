output "TestHendawy_key_pair" {
  value = data.aws_key_pair.test_hendawy.key_name
  description = "The name of the TestHendawy key pair"
}
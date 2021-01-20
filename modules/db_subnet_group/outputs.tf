output "this_db_subnet_group_id" {
  description = "The db subnet group name"
  value       = element(concat(aws_db_subnet_group.this.*.id, [""]), 0)
}

output "this_db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = element(concat(aws_db_subnet_group.this.*.arn, [""]), 0)
}


output "aws_subnet_ids" {
  description = "The ARN of the db subnet group"
  #value       = data.aws_subnet_ids.database.*.ids
  value = data.aws_subnet.database.*.id[0]
  #value = [data.aws_subnet_ids.database.ids]
}



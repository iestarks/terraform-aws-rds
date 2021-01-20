
##############################################################
# Data sources to get VPC and subnet Details
##############################################################
# locals {
#   subnet_ids_string = join(",", data.aws_subnet_ids.database.ids)
#   subnet_ids_list = split(",", local.subnet_ids_string)
# }


data "aws_vpc" "usbank_vpc" {

  filter {
    name = "tag:Name"
    values = [var.vpcname]
  }
}



data "aws_subnet_ids" "database" {
  vpc_id = data.aws_vpc.usbank_vpc.id
 tags = {
    Name = "bankus_east-1-vpc-public-*"
 }

  # tags = {
  # Name = "bankus_east-1-vpc-db-us-east-1a",
  # Name = "bankus_east-1-vpc-db-us-east-1c",  # insert value here

}

# data "aws_subnet" "database" {
#   vpc_id = data.aws_vpc.usbank_vpc.id
#   count = length(data.aws_subnet_ids.database.ids)
#   id    = local.subnet_ids_list[count.index]
# }




resource "aws_db_subnet_group" "this" {
  count = var.create ? 1 : 0

  name_prefix = var.name_prefix
  description = "Database subnet group for ${var.identifier}"
  subnet_ids = data.aws_subnet_ids.database.*.ids[0]
  #subnet_ids = [data.aws_subnet_ids.database.ids]
  #subnet_ids =  var.subnet_ids

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.identifier)
    },
  )
}


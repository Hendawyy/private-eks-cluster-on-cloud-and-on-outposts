data "aws_subnet" "existing-private-subnet1" {
  id = "subnet-063114999c005d959"
}

data "aws_subnet" "existing-private-subnet2" {
  id = "subnet-07c0de96d16cd3339"
}

data "aws_subnet" "existing-private-subnet3" {
  id = "subnet-01c183f60c6723406"
}

data "aws_subnet" "existing-public-subnet4" {
  id = "subnet-0b48624e5b294ea85"
}

data "aws_subnet" "existing-private-subnet-region-1" {
  id = "subnet-01605fc34793d38b5"
}

data "aws_subnet" "existing-private-subnet-region-2" {
  id = "subnet-0062f5f62c93c1b31"
}

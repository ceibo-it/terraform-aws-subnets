region = "us-east-2"

namespace = "eg"

stage = "test"

name = "multi-az-subnets-only-private"

availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]

cidr_blocks = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]

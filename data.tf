# Fetch all available zones in chose region
data "aws_availability_zones" "this" {
  state = "available"
}

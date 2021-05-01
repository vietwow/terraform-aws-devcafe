# terraform-aws-devcafe

## Introduction



## Security & Compliance [<img src="https://cloudposse.com/wp-content/uploads/2020/11/bridgecrew.svg" width="250" align="right" />](https://bridgecrew.io/)

Security scanning is graciously provided by Bridgecrew. Bridgecrew is the leading fully hosted, cloud-native solution providing continuous Terraform security and compliance.

| Benchmark | Description |
|--------|---------------|
| [![Infrastructure Security](https://www.bridgecrew.cloud/badges/github/vietwow/terraform-aws-devcafe/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=vietwow%2Fterraform-aws-devcafe&benchmark=INFRASTRUCTURE+SECURITY) | Infrastructure Security Compliance |
| [![CIS KUBERNETES](https://www.bridgecrew.cloud/badges/github/vietwow/terraform-aws-devcafe/cis_kubernetes)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=vietwow%2Fterraform-aws-devcafe&benchmark=CIS+KUBERNETES+V1.5) | Center for Internet Security, KUBERNETES Compliance |
| [![CIS AWS](https://www.bridgecrew.cloud/badges/github/vietwow/terraform-aws-devcafe/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=vietwow%2Fterraform-aws-devcafe&benchmark=CIS+AWS+V1.2) | Center for Internet Security, AWS Compliance |
| [![CIS AZURE](https://www.bridgecrew.cloud/badges/github/vietwow/terraform-aws-devcafe/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=vietwow%2Fterraform-aws-devcafe&benchmark=CIS+AZURE+V1.1) | Center for Internet Security, AZURE Compliance |
| [![PCI-DSS](https://www.bridgecrew.cloud/badges/github/vietwow/terraform-aws-devcafe/pci_dss_v321)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=vietwow%2Fterraform-aws-devcafe&benchmark=PCI-DSS+V3.2.1) | Payment Card Industry Data Security Standards Compliance |
| [![NIST-800-53](https://www.bridgecrew.cloud/badges/github/vietwow/terraform-aws-devcafe/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=vietwow%2Fterraform-aws-devcafe&benchmark=NIST-800-53) | National Institute of Standards and Technology Compliance |
| [![ISO27001](https://www.bridgecrew.cloud/badges/github/vietwow/terraform-aws-devcafe/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=vietwow%2Fterraform-aws-devcafe&benchmark=ISO27001) | Information Security Management System, ISO/IEC 27001 Compliance |
| [![SOC2](https://www.bridgecrew.cloud/badges/github/vietwow/terraform-aws-devcafe/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=vietwow%2Fterraform-aws-devcafe&benchmark=SOC2)| Service Organization Control 2 Compliance |
| [![CIS GCP](https://www.bridgecrew.cloud/badges/github/vietwow/terraform-aws-devcafe/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=vietwow%2Fterraform-aws-devcafe&benchmark=CIS+GCP+V1.1) | Center for Internet Security, GCP Compliance |
| [![HIPAA](https://www.bridgecrew.cloud/badges/github/vietwow/terraform-aws-devcafe/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=vietwow%2Fterraform-aws-devcafe&benchmark=HIPAA) | Health Insurance Portability and Accountability Compliance |
| [![FEDRAMP (MODERATE)](https://www.bridgecrew.cloud/badges/github/vietwow/terraform-aws-devcafe/fedramp_moderate)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=vietwow%2Fterraform-aws-devcafe&benchmark=FEDRAMP+%28MODERATE%29) | FedRAMP (Moderate) Compliance |

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cidr\_block | The CIDR block for the VPC | `string` | n/a | yes |
| enable\_dns\_hostnames | A boolean flag to enable/disable DNS hostnames in the VPC | `bool` | `true` | no |
| enable\_dns\_support | A boolean flag to enable/disable DNS support in the VPC | `bool` | `true` | no |
| name | The project name | `string` | `"nashtech"` | no |
| private\_subnets | A list of private subnets inside the VPC | `list(string)` | n/a | yes |
| public\_subnets | A list of public subnets inside the VPC | `list(string)` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| default\_security\_group\_id | n/a |
| private\_subnet\_cidr | n/a |
| private\_subnet\_id | n/a |
| public\_subnet\_cidr | n/a |
| public\_subnet\_id | n/a |
| vpc\_id | VPC |
| vpc\_ipv4\_cidr\_block | n/a |
| vpc\_ipv6\_cidr\_block | n/a |

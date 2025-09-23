# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

# deployment "production" {
#   variables = {
#     region              = "us-west-2"
#     availability_zones  = ["us-west-2a", "us-west-2b", "us-west-2c"]
#     role_arn            = "<specify the ARN of the role Terraform should assume using the identity token>"
#     identity_token_file = identity_token.aws.jwt_filename
#     default_tags      = { stacks-preview-example = "vpc-ec2-stack" }

#     #key_pair_name       = "<Set to the name of an imported SSH key pair (in AWS console under EC2->Key Pairs)>"
#   }
# }


deployment "development" {
  inputs = {
    regions        = ["us-east-1"]
    role_arn       = "arn:aws:iam::949008909725:role/stacks-hashicorp-learn-Learn-Stacks"
    identity_token = identity_token.aws.jwt
    default_tags = {
      Stack       = "learn-stacks-deploy-aws",
      Environment = "dev"
    }
  }
}

deployment "production" {
  inputs = {
    regions        = ["us-east-1", "us-west-1"]
    role_arn       = "arn:aws:iam::949008909725:role/stacks-hashicorp-learn-Learn-Stacks"
    identity_token = identity_token.aws.jwt
    default_tags = {
      Stack       = "learn-stacks-deploy-aws",
      Environment = "prod"
    }
  }
}

# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["terraform-stacks-private-preview"]
}

deployment "development" {
  inputs = {
    regions        = ["us-east-1"]
    role_arn       = "arn:aws:iam::258850230659:role/tfstacks-role"
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
    role_arn       = "arn:aws:iam::258850230659:role/tfstacks-role"
    identity_token = identity_token.aws.jwt
    default_tags = {
      Stack       = "learn-stacks-deploy-aws",
      Environment = "prod"
    }
  }
}

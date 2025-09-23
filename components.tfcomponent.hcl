# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0


component "vpc" {
  source   = "./vpc"
  for_each = var.regions

  inputs = {
    vpc_name = "terraform-stacks-${each.value}-${var.default_tags.Environment}"
  }

  providers = {
    aws = provider.aws.this[each.value]
  }
}

component "instance" {
  source   = "./instance"
  for_each = var.regions

  inputs = {
    network  = component.vpc[each.value]
    key_name = component.key_pair.key_name
  }

  providers = {
    aws = provider.aws.this[each.value]
  }
}

component "key_pair" {
  source   = "./key_pair"
  for_each = var.regions

  providers = {
    aws = provider.aws.this[each.value]
    tls = provider.tls.this
  }
}

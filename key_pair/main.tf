# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "tls_private_key" "stack" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "stack" {
  public_key = tls_private_key.stack.public_key_openssh
}

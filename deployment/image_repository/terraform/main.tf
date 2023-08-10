# Copyright 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0
# Licensed under the Apache License, Version 2.0 https://aws.amazon.com/apache-2-0/


locals {
  account_id           = data.aws_caller_identity.current.account_id
  dns_suffix           = data.aws_partition.current.dns_suffix
  partition            = data.aws_partition.current.partition
  aws_htc_ecr          = var.aws_htc_ecr != "" ? var.aws_htc_ecr : "${local.account_id}.dkr.ecr.${var.region}.${local.dns_suffix}"
  lambda_build_runtime = "${local.aws_htc_ecr}/ecr-public/sam/build-${var.lambda_runtime}:1"
}


# Retrieve the account ID
data "aws_caller_identity" "current" {}


# Retrieve AWS Partition
data "aws_partition" "current" {}

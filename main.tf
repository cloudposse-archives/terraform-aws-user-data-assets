resource "null_resource" "default" {
  triggers = {
    id = "${lower(format("%v-%v-%v-%v", var.namespace, var.stage, var.name, "assets"))}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

data "template_file" "default" {
  template = "${file("${path.module}/user_data.sh")}"

  vars {
    name              = "${var.name}"
    dir               = "${var.dir}"
    bucket            = "${var.bucket}"
    backup_enabled    = "${var.backup_enabled}"
    backup_frequency  = "${var.backup_frequency}"
    ssh_user          = "${var.ssh_user}"
  }
}

## IAM Role Policy that allows access to S3
resource "aws_iam_policy" "default" {
  name = "${null_resource.default.triggers.id}"

  lifecycle {
    create_before_destroy = true
  }

  policy = "${data.aws_iam_policy_document.default.json}"
}

data "aws_iam_policy_document" "default" {
  statement {
    actions = [
      "s3:ListAllMyBuckets",
    ]

    effect = "Allow"

    resources = [
      "arn:aws:s3:::*",
    ]
  }

  statement {
    actions = [ "s3:ListBucket" ]

    effect = "Allow"

    resources = [
      "${format("arn:aws:s3:::%s", replace(${var.bucket}, "/\\/[^|]*/", ""))}"
    ]
  }

  statement {
    actions = [ "s3:*" ]

    effect = "Allow"

    resources = [
      "${format("arn:aws:s3:::%s", replace(${var.bucket}, "/\\/[^|]*/", ""))}",
      "${format("arn:aws:s3:::%s/*", replace(${var.bucket}, "/\\/[^|]*/", ""))}"
    ]
  }
}
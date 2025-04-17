data "aws_iam_policy_document" "ecs_task_exec_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "ecs_task_exec_custom" {
  statement {
    sid    = "AllowCloudWatchLogs"
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["*"]
  }

  statement {
    sid    = "AllowLogsDescribe"
    effect = "Allow"
    actions = [
      "logs:DescribeLogStreams",
      "logs:DescribeLogGroups"
    ]
    resources = ["*"]
  }
}

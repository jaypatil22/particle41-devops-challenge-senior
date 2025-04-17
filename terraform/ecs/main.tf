resource "aws_ecs_cluster" "this" {
  name = "${var.name_prefix}-cluster"
}

resource "aws_iam_role" "ecs_task_exec" {
  name = "${var.name_prefix}-ecs-exec-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_exec_assume_role.json
}

resource "aws_iam_policy" "ecs_exec_custom" {
  name   = "${var.name_prefix}-ecs-execution-policy"
  policy = data.aws_iam_policy_document.ecs_task_exec_custom.json
}

resource "aws_iam_role_policy_attachment" "ecs_task_exec" {
  role       = aws_iam_role.ecs_task_exec.name
  policy_arn = aws_iam_policy.ecs_exec_custom.arn
}

resource "aws_security_group" "ecs" {
  name   = "${var.name_prefix}-ecs-sg"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_from_alb_sg" {
  security_group_id            = aws_security_group.ecs.id
  referenced_security_group_id = var.alb_sg_id
  ip_protocol                  = "tcp"
  from_port                    = 8080
  to_port                      = 8080
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ecs.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_ecs_task_definition" "this" {
  family                   = "${var.name_prefix}-task"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_exec.arn

  container_definitions = jsonencode([{
    name  = "simpletimeservice"
    image = var.image_uri
    portMappings = [{
      containerPort = 8080
      hostPort      = 8080
    }]
  }])
}

resource "aws_ecs_service" "this" {
  name            = "${var.name_prefix}-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = [aws_security_group.ecs.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "simpletimeservice"
    container_port   = 8080
  }

  depends_on = [var.alb_listener]
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"

  identifier = "maindb"

  engine            = "mysql"
  engine_version    = "5.7.19"
  instance_class    = var.instance_class
  allocated_storage = 10

  name     = var.name
  username = var.username
  password = var.password
  port     = "3306"

  publicly_accessible = true
  iam_database_authentication_enabled = true

  vpc_security_group_ids = [aws_security_group.allow_subnets_private.id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"


  subnet_ids = module.vpc.database_subnets


  family = "mysql5.7"


  major_engine_version = "5.7"


  final_snapshot_identifier = "final-shot-instace-terraform"


  deletion_protection = var.deletion_protection

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}")
  )
}

resource "null_resource" "setup_db" {
  depends_on = [module.db] #wait for the db to be ready
  provisioner "local-exec" {
    command = "mysql -u ${var.username} -p${var.password} -h ${module.db.this_db_instance_address} < prueba.sql"
  }
}

provider "aws"{

    region=var.region
}

terraform {
    required_providers{
        docker = {
            source = "kreuzwerker/docker"
            version = "2.15.0"
        }
    }
}


locals {
    aws_ecr_url = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.region}.amazonaws.com"
}

provider "docker" {
    registery_auth = {
        address = local.aws_ecr_url
        username = data.aws_ecr_authorization_token.user_name
        password = data.aws_ecr_authorization_token.password
    }
}


resource "aws_ecr_repository" "webapp-images"{
    for_each = toset(var.ecr_name)
    name = "${each.key}-image"
}

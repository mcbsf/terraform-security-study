data "terraform_remote_state" "eip" {
    backend = "s3"

    config = {
        bucket         = "mario-terraform-s3"
        key            = "network/tmp.tfstate"
        region         = "us-east-1"
    }
}

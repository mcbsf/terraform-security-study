terraform{
    backend "s3" {
        bucket         = "mario-terraform-s3"
        key            = "security/tmp.tfstate"
        region         = "us-east-1"
        dynamodb_table = "terraform-security-state-lock-dynamo"
    }
}
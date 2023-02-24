
locals {
  common_tags = {
    Owner   = "Mario Cardoso Batista da Silva Filho"
    service = "backend-security"
  }
} // WITH THIS VALUES CANT CHANGE. GOOD FOR GRANT VALUES WITHOUT CHILD CHANGES IN MODULES. NOT ALWAYS GOOD PRATICE, ONLY VALUES THAT MAY CHANGE SHOULD BE USED TO AVOID REWORK


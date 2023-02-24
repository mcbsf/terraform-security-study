variable "vpn_ip" {
  default = "116.50.30.20/32"
}

variable "security_group_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8200, 8201, 8300, 9200, 9500]
}

variable "security_group_ports_from_to" {
  type        = map(any)
  description = "list of ingress ports from to"
  default = {
    8200 = 8200,
    8201 = 8201,
    8300 = 8300,
    9200 = 9200,
    9500 = 9500
  }
}
variable "location" {
  type = string
}

variable "suffix" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

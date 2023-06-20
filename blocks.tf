# SINGLE MAP
variable "some_map" {
  type = map
  default     = {}
}

some_map = {
  value1     = ["http://www.*.example.com"]
  #value2 = false #optional
}

dynamic "some_map" {
  for_each = var.some_map[*]
  content {
    value1     = some_map.value.value1
    value2 = try(some_map.value.value2, false)
  }
}

# LIST OF STRINGS
variable "some_list" {
  type        = list(string)
  default     = []
}

# all variables optional
some_list = [
  {
    value1 = a
    value2 = b
  }
]

dynamic "some_list" {
  for_each = var.some_list

  content {
    value1                = try(some_list.value.value1, null)
    value2               = try(some_list.value.value2, null)
    value3 = try(some_list.value.value3, null)
  }
}

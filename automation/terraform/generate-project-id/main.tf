variable "project_name" {}

resource "random_id" "id" {
 byte_length = 4
}

output "project_id" {
 value = "${lower(replace(trimspace(var.project_name), " ", "-"))}-${lower(random_id.id.hex)}"
}
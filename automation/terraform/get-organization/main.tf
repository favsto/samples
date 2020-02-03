# retrieve data
data "google_organization" "org" {
  domain = "${var.org_domain}"
}

# data outputs
output "organization_id" {
  value = "${data.google_organization.org.id}"
}
output "organization_name" {
  value = "${data.google_organization.org.name}"
}

output "organization_state" {
  value = "${data.google_organization.org.lifecycle_state}"
}
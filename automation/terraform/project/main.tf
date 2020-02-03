# retrieve org data
data "google_organization" "org" {
  domain = "${var.organization}"
}

# retrieve folder data
data "google_folder" "folder_container" {
  folder = "folders/${var.folder_path}"
  lookup_organization = true
}

create the project
resource "google_project" "new_project" {
  name = "${var.project_name}"
  project_id = "${var.project_id}"
  folder_id = "${data.google_folder.folder_container.name}"
  org_id = "${data.google_organization.org.id}"
  billing_account = "${var.billing_account_id}"
}

output "org_data" {
  value = "${data.google_organization.org}"
}

output "folder_data" {
  value = "${data.google_folder.folder_container}"
}

output "project_data" {
  value = "${google_project.new_project}"
}
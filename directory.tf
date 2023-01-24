resource "databricks_directory" "my_custom_directory" {
  path = "/terraform-dir"
}

resource "databricks_permissions" "folder_usage" {
  directory_path = databricks_directory.my_custom_directory.path
  depends_on     = [databricks_directory.my_custom_directory]

  access_control {
    group_name       = databricks_group.this.display_name
    permission_level = "CAN_MANAGE"
  }
}
#data assumes the users already exists
data "databricks_user" "user1" {
  user_name = "first.last@databricks.com"
}

data "databricks_user" "user2" {
  user_name = "other.user@databricks.com"
}

resource "databricks_group" "this" {
  display_name               = "TF Group"
  allow_cluster_create       = true
  allow_instance_pool_create = true
}

resource "databricks_group_member" "vip_member1" {
  group_id  = databricks_group.this.id
  member_id = data.databricks_user.user1.id
}

resource "databricks_group_member" "vip_member2" {
  group_id  = databricks_group.this.id
  member_id = data.databricks_user.user2.id
}
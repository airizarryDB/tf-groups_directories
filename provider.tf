terraform {
  required_providers {
    databricks = { source = "databricks/databricks" }
  }
}

// initialize provider in "MWS" mode to provision new workspace
provider "databricks" {
  host  = var.databricks_url
  token = var.workspace_PAT
}

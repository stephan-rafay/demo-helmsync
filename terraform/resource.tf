resource "rafay_workload_cd_operator" "operatordemo" {
  metadata {
    name    = "operatordemo"
    project = "demoorg"
  }
  spec {
    repo_local_path = "/tmp/application-repo"
    repo_url        = "https://github.com/stephan-rafay/demo-helmsync.git"
    repo_branch     = "main"
    #credentials {
    # username = var.git_user
    # token = var.git_token
    #}

    workload {
      name = "httpecho"
      helm_chart_version = "0.3.4"
      helm_chart_name = "http-echo"
      path_match_pattern = "/:project/:workload/:namespace"
      base_path = "httpecho-common"
      include_base_value = true
      delete_action = "delete"
      placement_labels = {
        "httpecho" = "enabled"
      }
    }   
  }
  always_run = "${timestamp()}"
}

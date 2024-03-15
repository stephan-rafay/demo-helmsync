output "workload_status" {
  description = "workload status"
  value       = "${rafay_workload_cd_operator.operatordemo.workload_status}"
}

output "workload_upserts" {
  description = "workload created or updated"
  value       ="${rafay_workload_cd_operator.operatordemo.workload_upserts}"
}

output "workload_decommissions" {
  description = "workload deleted (or) unpublished"
  value       = "${rafay_workload_cd_operator.operatordemo.workload_decommissions}"
}

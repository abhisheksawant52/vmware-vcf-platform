output "tier0_gateway_path" {
  description = "Policy path of the Tier-0 gateway."
  value       = nsxt_policy_tier0_gateway.t0.path
}

output "tier1_gateway_path" {
  description = "Policy path of the Tier-1 gateway."
  value       = nsxt_policy_tier1_gateway.t1.path
}

output "segment_paths" {
  description = "Map of segment name to policy path."
  value       = { for k, v in nsxt_policy_segment.this : k => v.path }
}

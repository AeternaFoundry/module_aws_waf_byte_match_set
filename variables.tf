variable "waf_byte_match_sets" {
  description = <<EOT
Map of waf_byte_match_sets, attributes below
Required:
    - name
Optional:
    - byte_match_tuples (block):
        - field_to_match (required, block):
            - data (optional)
            - type (required)
        - positional_constraint (required)
        - target_string (optional)
        - text_transformation (required)
EOT

  type = map(object({
    name = string
    byte_match_tuples = optional(list(object({
      field_to_match = object({
        data = optional(string)
        type = string
      })
      positional_constraint = string
      target_string         = optional(string)
      text_transformation   = string
    })))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}


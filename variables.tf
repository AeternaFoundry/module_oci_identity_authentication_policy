variable "identity_authentication_policies" {
  description = <<EOT
Map of identity_authentication_policies, attributes below
Required:
    - compartment_id
Optional:
    - network_policy (block):
        - network_source_ids (optional)
    - password_policy (block):
        - is_lowercase_characters_required (optional)
        - is_numeric_characters_required (optional)
        - is_special_characters_required (optional)
        - is_uppercase_characters_required (optional)
        - is_username_containment_allowed (optional)
        - minimum_password_length (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = string
    network_policy = optional(object({
      network_source_ids = optional(list(string))
    }))
    password_policy = optional(object({
      is_lowercase_characters_required = optional(bool)
      is_numeric_characters_required   = optional(bool)
      is_special_characters_required   = optional(bool)
      is_uppercase_characters_required = optional(bool)
      is_username_containment_allowed  = optional(bool)
      minimum_password_length          = optional(number)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}


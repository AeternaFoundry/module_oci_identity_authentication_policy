resource "oci_identity_authentication_policy" "identity_authentication_policies" {
  for_each = var.identity_authentication_policies

  compartment_id = each.value.compartment_id

  dynamic "network_policy" {
    for_each = each.value.network_policy != null ? [each.value.network_policy] : []
    content {
      network_source_ids = network_policy.value.network_source_ids
    }
  }

  dynamic "password_policy" {
    for_each = each.value.password_policy != null ? [each.value.password_policy] : []
    content {
      is_lowercase_characters_required = password_policy.value.is_lowercase_characters_required
      is_numeric_characters_required   = password_policy.value.is_numeric_characters_required
      is_special_characters_required   = password_policy.value.is_special_characters_required
      is_uppercase_characters_required = password_policy.value.is_uppercase_characters_required
      is_username_containment_allowed  = password_policy.value.is_username_containment_allowed
      minimum_password_length          = password_policy.value.minimum_password_length
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}


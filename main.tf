locals {
  some_pets          = ["dog", "cat"]
  some_arbitrary_var = "try-number-2"
}

resource "random_pet" "this" {
  for_each = toset(local.some_pets)
  keepers  = { to_change_or_not_to = local.some_arbitrary_var }
}

output "pets" {
  value = { for pet in local.some_pets : pet => resource.random_pet.this[pet].id }
}

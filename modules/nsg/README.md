# Module README
* Deploys:
   * An NSG
   * Subnet association(s) for the NSG

* The `security_rule` variable has the same requirements as the `security_rule` block in the [azurerm_network_security_group documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group). Each property in the following table must be specified for each security rule. If the property is unused in the rule, then either a `""` or `[]` should be specified, depending on if the property requires a string or a list of strings.

| Property | Description | Unused value |
| -------- | ----------- | ------------ |
| `access` | Specify either rule should Allow or Deny | NA, required value |
| `description` | Specify a description of rule (optional) | `""` |
| `destination_address_prefix` | Specify the destination ip address or ip address prefix (leave blank if multiple ip addresses or prefixes, * for Any) | `""` |
| `destination_address_prefixes` | Specify a range/list of destination ip addresses and/or prefixes (leave blank if only one ip address or prefix, * for Any) | `[]` |
| `destination_application_security_group_ids` | Specify destination Application Security Group IDs | `[]` |
| `destination_port_range` | Specify a single destination port to match (leave blank if multiple ports, * for Any) | `""` |
| `destination_port_ranges` | Specify a range and/or list of ports to match (leave blank if only one port, * for Any) | `[]` |
| `direction` | Specify either Inbound or Outbound rule | NA, required value |
| `name` | Specify the name for the rule | NA, required value |
| `priority` | Rules are processed in priority order; the lower the number, the higher the priority. | NA, required value |
| `protocol` | Specifies protocol to match for rule (Tcp, Udp, Icmp, * for Any) | NA, required value |
| `source_address_prefix` | Specify a single ip address or ip address prefix (leave blank if multiple ip addresses or prefixes, * for Any) | `""` |
| `source_address_prefixes` | Specify a range/list of ip addresses and/or prefixes (leave blank if only one ip address or prefix, * for Any) | `[]` |
| `source_application_security_group_ids` | Specify source Application Security Group IDs | `[]` |
| `source_port_range` | Specify a single source port to match (leave blank if multiple ports, * for Any) | `""` |
| `source_port_ranges` | Specify a range and/or list of ports to match (leave blank if only one port, * for Any) | `[]` |

* If no security rules are needed, then use an empty list - `security_rule = []`
* The `subnet_map` variable represents the subnets to associate with the NSG. The variable is a nested map to simplify the resource group, VNet, and subnet hierarchy without having to use resource IDs. The general structure is:
```
subnet_map = {
    vnet-rg-name-A = {
        vnet-name-1  = [
            subnet-name-x,
            subnet-name-y,
            subnet-name-z
        ]
    }
    vnet-rg-name-B = {
        vnet-name-2 = [
            subnet-name-i
        ]
    }
}
```
* If no subnets are associated to the NSG, then use an empty map - `subnet_map = {}`

## Example
```
module "nsg" {
  source = "../../../modules/nsg"
  providers = {
    azurerm.mod_sub = azurerm.sub
  }

  name                = "nsg-name"
  resource_group_name = "rg-name"
  location            = "eastus2"
  tags = {
    service     = "service-name"
    environment = "dev"
  }
  subnet_map = {
    vnet-rg-name= {
     vnet-name = [
        "subnet1-name",
        "subnet2-name",
        "subnet3-name"
      ]
    }
  }
  security_rule = [
    {
      access                                     = "Allow"
      description                                = ""
      destination_address_prefix                 = "*"
      destination_address_prefixes               = []
      destination_application_security_group_ids = []
      destination_port_range                     = "3389"
      destination_port_ranges                    = []
      direction                                  = "Inbound"
      name                                       = "RDP"
      priority                                   = 100
      protocol                                   = "Tcp"
      source_address_prefix                      = "*"
      source_address_prefixes                    = []
      source_application_security_group_ids      = []
      source_port_range                          = "*"
      source_port_ranges                         = []
    }
  ]
}
```
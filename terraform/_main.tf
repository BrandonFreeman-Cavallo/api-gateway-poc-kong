terraform {

  required_providers {
    kong = {
      source  = "philips-labs/kong"
      version = "6.630.0"
    }
  }

  required_version = "~> 1.5"

  /*The configuration will be merged from the config
  file (.hcl) present in the backend_config/ folder
  and can be provided as input during the init using
  -backend-config, which defines,
  Configuration to be merged with what is in the
  configuration file's 'backend' block. This can be
  either a path to an HCL file with key/value
  assignments (same format as terraform.tfvars) or a
  'key=value' format, and can be specified multiple
  times. The backend type must be in the configuration
  itself*/

  /*Terraform strictly says no to variables for the config file
  (or) backend config and hence environment specific
  backend_config.hcl files are created*/
}

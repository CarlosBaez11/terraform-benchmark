variable "prefix" {
  description = "Prefix for the resources"
  type        = string
  default = "cebaezc1"
}

variable "bucket_name" {
  description = "S3 bucket used for deployment"
  type        = string
  default = "cebaezc1-3026ce8df4f9e9a6"
}

variable "instance_type" {
  description = "Instance type to use"
  type        = string
  default     = "m5.2xlarge"
}

variable "script_path" {
  description = "Script initializer path"
  type        = string
}

variable "experiment_name" {
  description = "Script initializer path"
  type        = string
}


variable "source_name" {
  description = "Script initializer path"
  type        = string
}

variable "data_size" {
  description = "Script initializer path"
  type        = string
}
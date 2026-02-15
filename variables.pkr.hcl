variable "wifi_ssid" {
  type        = string
  description = "The SSID of the WiFi network to connect to."
  default     = env("WIFI_SSID")
}

variable "wifi_password" {
  type        = string
  description = "The password for the WiFi network."
  default     = env("WIFI_PASSWORD")
  sensitive   = true
}

variable "dietpi_global_password" {
  type        = string
  description = "The global password for DietPi."
  default     = env("DIETPI_GLOBAL_PASSWORD")
  sensitive   = true
}

variable "dietpi_ssh_pubkey" {
  type        = string
  description = "The SSH public key to be added to authorized_keys"
  default     = env("DIETPI_SSH_PUBKEY")
}

variable "dietpi_image_url" {
  type        = string
  description = "The URL of the base DietPi image to download."
}

variable "dietpi_image_checksum" {
  type        = string
  description = "The SHA256 checksum of the base DietPi image."
}

variable "dietpi_image_path" {
  type        = string
  description = "The name of the image file output"
}

variable "dietpi_locale" {
  type        = string
  description = "Locale for the system (e.g., C.UTF-8, en_GB.UTF-8)"
  default     = "C.UTF-8"
}

variable "dietpi_keyboard_layout" {
  type        = string
  description = "Keyboard layout (e.g., gb, us, de)"
  default     = "gb"
}

variable "dietpi_timezone" {
  type        = string
  description = "Timezone (e.g., Europe/London, UTC)"
  default     = "UTC"
}

variable "dietpi_ethernet_enabled" {
  type        = string
  description = "Enable Ethernet adapter (1=enable, 0=disable)"
  default     = "1"
}

variable "dietpi_wifi_enabled" {
  type        = string
  description = "Enable WiFi adapter (1=enable, 0=disable)"
  default     = "0"
}

variable "dietpi_wifi_country_code" {
  type        = string
  description = "WiFi country code (e.g., GB, US)"
  default     = "GB"
}

variable "dietpi_hostname" {
  type        = string
  description = "Hostname for the device"
  default     = "DietPi"
}

variable "dietpi_setup_automated" {
  type        = string
  description = "Run automated setup on first boot (1=enable, 0=disable)"
  default     = "0"
}

variable "dietpi_enable_ipv6" {
  type        = string
  description = "Enable IPv6 (1=enable, 0=disable)"
  default     = "1"
}

variable "dietpi_disable_ssh_password" {
  type        = string
  description = "Disable SSH password logins (0=allow all, 1=disable all, root=disable root only)"
  default     = "0"
}

variable "dietpi_apt_packages" {
  type        = list(string)
  description = "APT packages to install on first boot"
  default     = []
}

variable "dietpi_install_software" {
  type        = list(string)
  description = "Software packages to install on first boot"
  default     = []
}

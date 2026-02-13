source "arm" "dietpi" {
  file_urls          = [var.dietpi_image_url]
  file_checksum_type = "sha256"
  file_checksum      = var.dietpi_image_checksum
  image_type         = "dos"

  file_target_extension = "xz"
  file_unarchive_cmd    = ["xz", "--decompress", "$ARCHIVE_PATH"]
  image_build_method    = "reuse"
  image_path            = var.dietpi_image_path
  image_size            = "2G"


  image_partitions {
    name         = "boot"
    type         = "c"
    start_sector = "2048"
    filesystem   = "fat"
    size         = "128M"
    mountpoint   = "/boot/firmware"
  }

  image_partitions {
    name         = "root"
    type         = "83"
    start_sector = "264192"
    filesystem   = "ext4"
    size         = "0"
    mountpoint   = "/"
  }

  qemu_binary_source_path      = "/usr/bin/qemu-aarch64-static"
  qemu_binary_destination_path = "/usr/bin/qemu-aarch64-static"
}

build {
  sources = ["source.arm.dietpi"]

  # Inject configuration files
  provisioner "file" {
    content = templatefile("${path.root}/config/dietpi-wifi.txt.pkrtpl", {
      wifi_ssid     = var.wifi_ssid
      wifi_password = var.wifi_password
    })
    destination = "/boot/dietpi-wifi.txt"
  }

  provisioner "file" {
    content = templatefile("${path.root}/config/dietpi.txt.pkrtpl", {
      dietpi_global_password      = var.dietpi_global_password
      dietpi_ssh_pubkey           = var.dietpi_ssh_pubkey
      dietpi_locale               = var.dietpi_locale
      dietpi_keyboard_layout      = var.dietpi_keyboard_layout
      dietpi_timezone             = var.dietpi_timezone
      dietpi_ethernet_enabled     = var.dietpi_ethernet_enabled
      dietpi_wifi_enabled         = var.dietpi_wifi_enabled
      dietpi_wifi_country_code    = var.dietpi_wifi_country_code
      dietpi_hostname             = var.dietpi_hostname
      dietpi_setup_automated      = var.dietpi_setup_automated
      dietpi_enable_ipv6          = var.dietpi_enable_ipv6
      dietpi_disable_ssh_password = var.dietpi_disable_ssh_password
      dietpi_apt_packages         = join(" ", var.dietpi_apt_packages)
    })
    destination = "/boot/dietpi.txt"
  }

  provisioner "file" {
    source      = "config/config.txt"
    destination = "/boot/firmware/config.txt"
  }
}

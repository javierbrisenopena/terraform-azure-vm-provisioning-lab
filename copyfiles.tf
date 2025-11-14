resource "null_resource" "addfiles" {
  provisioner "file" {
    source      = "default.html"
    destination = "/home/linuxadmin/default.html"
  }

  connection {
    type = "ssh"
    user = "linuxadmin"
    password = var.adminpassword
    host = azurerm_public_ip.appip["appvm01"].ip_address

  }
    
 provisioner "remote-exec" {
  connection {
    type = "ssh"
    user = "linuxadmin"
    password = var.adminpassword
    host = azurerm_public_ip.appip["appvm01"].ip_address
  }
  inline = ["sudo mv /home/linuxadmin/default.html /var/www/html/default.html"  ]
  }

    depends_on = [ azurerm_network_security_group.app_nsg ]
}





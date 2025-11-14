# Terraform Azure Two-Tier VM Environment with Automated Provisioning

This project deploys a complete **two-tier virtual machine environment** in **Microsoft Azure** using **Terraform**.  
It includes:

- Windows Server VM (IIS web server)  
- Linux Ubuntu VM (nginx)  
- Automated provisioning scripts on both VMs  
- Azure Bastion for secure remote access  
- Virtual network, subnets, NSG rules, and availability set  

This repository demonstrates real-world **Infrastructure-as-Code**, secure VM access, and automated server configuration using PowerShell, cloud-init, and Terraform provisioners.

---

## 🚀 Features

### **🔹 Two-Tier Architecture**
- **Tier 1 – Web Tier:**  
  Windows Server VM running **IIS**, configured with a PowerShell script deployed through Azure Custom Script Extension.

- **Tier 2 – App Tier:**  
  Ubuntu VM running **nginx**, configured using **cloud-init** and Terraform **file** + **remote-exec** provisioners.

---

## 🏗️ Infrastructure Deployed

### **Networking**
- Virtual Network (`10.0.0.0/16`)
- Subnets:
  - `websubnet01` (Windows web tier)
  - `appsubnet01` (Linux app tier)
  - `AzureBastionSubnet` (Bastion host)
- Network Security Group with rules for:
  - **80** HTTP  
  - **22** SSH  
  - **3389** RDP  

### **Compute**
#### **Windows Web Server**
- Azure Windows Server VM
- IIS installed automatically using:
  - Azure Storage
  - PowerShell provisioning script (`IIS.ps1`)
  - Custom Script Extension
- Custom `default.html` page displaying computer name

#### **Linux App Server**
- Ubuntu VM
- nginx installed using:
  - cloud-init YAML file (`cloudinit`)
  - Terraform `file` provisioner to upload web content
  - Terraform `remote-exec` to move content into `/var/www/html/`

### **Secure Access**
- **Azure Bastion** deployed for secure RDP/SSH access  
  (no open RDP/SSH ports exposed to the internet)

### **Redundancy**
- Availability Set for improved VM resiliency









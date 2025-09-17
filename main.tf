# Define the VM
resource "oci_core_instance" "ansible_control_node" {
  count = var.create_vm ? 1 : 0

  availability_domain = var.availability_domain
  compartment_id      = var.compartment_ocid
  display_name        = var.instance_name
  # shape               = "VM.Standard.E2.1.Micro"
  shape               = "VM.Standard.E4.Flex"

  shape_config {
    memory_in_gbs = "4"
    ocpus = "1"
  }

  create_vnic_details {
    subnet_id        = var.subnet_ocid
    display_name     = "primaryvnic"
    assign_public_ip = true
  }

  source_details {
    source_type = "image"
    source_id   = var.image_ocid
  }

  metadata = {
    ssh_authorized_keys = file("~/.ssh/oci_jkazda.pub")
    user_data           = base64encode(file("${path.module}/user_data.tftpl"))
  }
}

# Output the VM IP (placeholder for actual implementation)
output "vm_ip" {
  value = var.create_vm ? oci_core_instance.ansible_control_node[0].public_ip : "VM not created"
}

provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_volume" "volume" {
  name = "volume.qcow2"
  pool = "kvm-home"
  source = "/home/svitlana/kvm-home/centos-volume.qcow2"
  format = "qcow2"
}

resource "libvirt_domain" "instance" {
  name   = "tomcat-server"
  memory = "1024"
  vcpu   = 1
  qemu_agent = true
  
  network_interface {
    wait_for_lease = true
    bridge = "br0"
  }

  disk {
    volume_id = "${libvirt_volume.volume.id}"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  console {
      type = "pty"
      target_type = "virtio"
      target_port = "1"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
 
   provisioner "local-exec" {
    command = "echo tomcat-server ansible_host=${self.network_interface.0.addresses.0} ansible_user=${var.ansible_user} ansible_password=${var.ansible_password} > /home/svitlana/Terraform/hosts && ansible-playbook tomcat-deploy.yml && sleep 10 && python -m webbrowser http://${self.network_interface.0.addresses.0}:8080/"
  }
}

output "ip" {
  value = "${libvirt_domain.instance.network_interface.0.addresses.0}"
}

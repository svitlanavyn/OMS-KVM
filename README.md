<<< Deployment of OMS java app to tomcat >>>

Required:
1. libvirt provider for KVM - https://titosoft.github.io/kvm/terraform-and-kvm/
2. geerlingguy.java role

Before performing next actions you need to rewrite inventory path in ansible.cfg and add vars.tf script in OMS-libvirt directory.

Example of vars.tf:

    variable "ansible_user" {
      type = "string"
      default = "your_ansible_user"
    }
    variable "ansible_password" {
      type = "string"
      default = "your_ansible_password"
    }

And finally tou can deploy the OMS application by running one the following commands at command prompt:

    $ git clone https://github.com/svitlanavyn/OMS-libvirt.git
    $ cd OMS-libvirt
    $ terraform apply

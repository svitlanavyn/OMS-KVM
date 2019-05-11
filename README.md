# Deployment of OMS java app to tomcat using Terraform and Ansible

Required:
1. libvirt provider for KVM - https://titosoft.github.io/kvm/terraform-and-kvm/
2. geerlingguy.java role
3. Builded war-file of OMS app (in my case it's already uploaded to Nexus Repository Manager, its url is written in tomcat-deploy.yml)

Before performing next actions you need to rewrite inventory path in ansible.cfg and add vars.tf script to OMS-libvirt directory.

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

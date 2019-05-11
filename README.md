<<< Deployment an OMS java app to tomcat >>>

Required:
1. libvirt provider for KVM - https://titosoft.github.io/kvm/terraform-and-kvm/
2. geerlingguy.java role

You can deploy the OMS application by running one of the following commands at command prompt:

    git clone https://github.com/svitlanavyn/OMS-libvirt.git
    cd OMS-libvirt
    terraform apply

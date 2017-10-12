Role Name
=========

A brief description of the role goes here.

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

Non settable variables in vars/main.yml

- ami_search_tags
This is to give the dependent role lookup_ec2_ami

This role input is ec2_instance_ami_search_tags so ami_search_tags will be set using ec2_instance_ami_search_tags when calling lookup_ec2_ami.

Dependencies
------------

- role: lookup_ec2_ami 
to get the dict 'ami' for this role to use it in launching the instance.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).

Role Name
=========

A brief description of the role goes here.

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

* `ec2_key_pair_bastion` - Optional - No default
  The private key file used to access the bastion hosts

* `bastion_ansible_user` - Optional - Default: ubuntu
  The ssh user name used to connect to bastion host

These above vars allow us to use different ssh key and username for bastion to
increase security and isolation. Usually in ssh config file we can specify each
key for each group of hosts but not for bastions because bastion host IP
address varies across aws account thus need to be dynamically set the ssh key
and username if needed. Other than that we might get authentication errors
because ssh send too many keys and the fail count exceeds the limit that the
remote ssh server allows.

* `ami_search_tags` - used by `lookup_ec2_ami` role to find the AMI on which to base the instance
* `ec2_instance_vol_tags` - This is a dict set of key/value of a volume that is
   going to be attached to the instance. The volume must be created before and
   must be available for attach.

* `ec2_instance_public_dns`
* `ec2_instance_private_dns`
   These dns will be created via route53 if they are of string type. The public will use
   the aws account specified in the variable below in the zone below.

* `ec2_instance_route53_public_zone` - The public zone that we are going to create the public DNS entry.
   Default: xvt.technology

* `aws_route53_profile_public` - The aws profile used to create public route53 entry.
   Optional and will use the current ec2 IAM profile to assume iam role
   route53_admin in the aws account if not provided.

* `aws_route53_profile_private` - Same as above but for private zone

* `ec2_instance_target_target_group` - Optional - No default value
   The target group name that you want to register the ec2 instance with. Do
   nothing if it is not set.

THIS ROLE HAS MORE VARIABLES THAT NOT DOCUMENTED YET HERE. SEE
defaults/main.yml for complete list for now.

Dependencies
------------

- role: lookup_ec2_ami
  to get the dict 'ami' for this role to use it in launching the instance.

- Unmerged anisble PR https://github.com/ansible/ansible/pull/26483
  For the ansible module 'elb_target' used to register the instance with a TG
  if required.

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

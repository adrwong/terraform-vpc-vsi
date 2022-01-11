# terraform-vpc-vsi

## How to run

By running the below script, it can create VPC, VSI, subnet, security group and floating IP, and then destory all of them. 
```
chmod +x create_vpc_vsi.sh
./create_vpc_vsi.sh
```

## Notes

1. I got VPC infrastructure relevant screenshot.png from IBM Cloud Resource List after `terraform apply` running stage, before `terraform destory` running stage.


2. I am using `ibm-centos-7-9-minimal-amd64-3` as image.


3. As for instance profile which can support `2 v100 GPU`, I can only find `gx2-16x128x2v100` and `gx2-32x256x2v100` by executing `ibmcloud is instance-profiles`, I cannot find `gx2-4x64x2v100` profile. So I am using `gx2-16x128x2v100`.


4. I masked API key and SSH key of my trail account in `create_vpc_vsi.sh` and `terraform.tfvars`.


5. I deleted `terraform.tfstate.backup` which was generated after running `create_vpc_vsi.sh` successfully because there were sensitive information in that file.


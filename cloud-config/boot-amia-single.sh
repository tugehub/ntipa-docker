source ~/openrc
nova boot --user-data ./cloud-config-amia-single.yaml --image be98be5f-6c99-475f-b2c9-96157127bac2 \
--nic net-id=5a4331d6-0ce9-4ab2-857b-dcd52bd97dba \
--key-name tino --flavor m1.medium --security-groups default amia

PROJECT_NAME := "rds_aurora_tf"
NON_PROD_ID := "id_here"
.DEFAULT_GOALT := help
.ONESHELL: ;
.NOTPARALLEL: ;
.EXPORT_ALL_VARIABLES: ;

help:
	@ echo
	@ echo ' Usage:'
	@ echo ''
	@ echo '		make <target> [flags...]'
	@ echo ''
	@ echo ' Targets:'
	@ echo ''
	@ awk '/^#/{ comment = substr($$0,3) } comment && /^[a-zA-Z][a-zA-Z0-9_-]+ ?:/{ print "   ", $$1, comment }' ./Makefile | column -t -s ':' | sort
	@ echo ''
	@ echo ' Flags:'
	@ echo ''
	@ awk '/^#/{ comment = substr($$0,3) } comment && /^[a-zA-Z][a-zA-Z0-9_-]+ ?\?=/{ print "   ", $$1, $$2, comment }' ./Makefile | column -t -s '?=' | sort
	@ echo ''


cleanup:
	rm -rvf .terraform/
	rm -vf *.tfplan

# initalize the backend first, this is critical.
init_only:
	terraform init -backend-config=./backend.hcl

# clean and init
init: cleanup init_only

#validates the terraform config files
validate:
	terraform validate

# format the terraform.
fmt:
	terraform fmt

# destroy ENV=env
destroy:
	terraform workspace select $(PROJECT_NAME)-$(ENV)
	terraform destroy -var-file=$(ENV).tfvars -auto-approve

# plan ENV=env
plan:
	terraform workspace select $(PROJECT_NAME)-$(ENV)
	terraform plan -var-file=$(ENV).tfvars -out=$(ENV).tfplan -lock=false

# apply ENV=env
apply:
	terraform workspace select $(PROJECT_NAME)-$(ENV)
	terraform apply $(ENV).tfplan

# cleanup
clean:
	-rm *.tfplan



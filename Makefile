PROJECT_NAME ?= sample
TEMPLATE_FILE := ./terraform_state_backend.yml
REGION ?= ap-northeast-1
PROFILE ?= default

.PHONY create_aws_stack:
create_aws_stack:
	aws cloudformation create-stack \
		--stack-name $(PROJECT_NAME) \
		--template-body file://$(TEMPLATE_FILE) \
		--parameters ParameterKey=ProjectName,ParameterValue=$(PROJECT_NAME) \
		--region $(REGION) \
		--profile $(PROFILE)

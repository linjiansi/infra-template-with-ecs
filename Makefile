PROJECT_NAME ?= sample
TEMPLATE_FILE := ./terraform_state_backend.yml
REGION ?= ap-northeast-1
PROFILE ?= default

.PHONY create_stack:
create_stack:
	aws cloudformation create-stack \
		--stack-name $(PROJECT_NAME) \
		--template-body file://$(TEMPLATE_FILE) \
		--parameters ParameterKey=ProjectName,ParameterValue=$(PROJECT_NAME) \
		--region $(REGION) \
		--profile $(PROFILE)

.PHONY tf_init:
tf_init:
	docker compose exec tf terraform init

.PHONY tf_plan:
tf_plan:
	docker compose exec tf terraform plan

.PHONY tf_apply:
tf_apply:
	docker compose exec tf terraform apply

.PHONY tf_fmt:
tf_fmt:
	docker compose exec tf terraform fmt

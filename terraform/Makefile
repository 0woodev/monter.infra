#$(eval export ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST)))))
ROOT_DIR := $(shell eval pwd)/..
CURRENT_DIR := $(shell eval pwd)
$(info ROOT_DIR = ${ROOT_DIR})
$(info CURRENT_DIR = ${CURRENT_DIR})

ifneq ("$(wildcard ${ROOT_DIR}/env/project_name.txt)","")
	FILE_EXISTS = 1
else
	FILE_EXISTS = 0
endif

ifneq ("$(wildcard ${ROOT_DIR}/env/workspace.txt)","")
	WORKSPACE_FILE_EXISTS = 1
else
	WORKSPACE_FILE_EXISTS = 0
endif

.SILENT: set-variable set-workspace-variable

set-workspace-variable:
ifeq ($(WORKSPACE_FILE_EXISTS), 1)
	$(info set-variable --- ROOT_DIR = ${ROOT_DIR})
	$(info cat ${ROOT_DIR}/env/workspace.txt)
	echo "\n[workspace]"
	cat "${ROOT_DIR}/env/workspace.txt"

	$(eval export TF_VAR_workspace := $(shell cat ${ROOT_DIR}/env/workspace.txt || tr A-Z a-z)_)
	$(info set-variable --- ROOT_DIR = ${ROOT_DIR} - Done)

else
	$(info execute "make" will read configuration)

	echo ex\) !qwer1234 ...
	@read -p "Enter workspace: " workspace; \
	echo $$workspace > ${ROOT_DIR}/env/workspace.txt; \
	echo workspace.txt file is
	cat ${ROOT_DIR}/env/workspace.txt;

	exit 0
endif




set-variable:
ifeq ($(FILE_EXISTS), 1)
	$(info set-variable --- ROOT_DIR = ${ROOT_DIR})
	$(info cat ${ROOT_DIR}/env/project_name.txt)
	$(info cat ${ROOT_DIR}/env/stage_name.txt)
	$(info cat ${ROOT_DIR}/env/dynamodb_name_pattern.txt)

	$(info cat ${ROOT_DIR}/env/db_endpoint.txt)
	$(info cat ${ROOT_DIR}/env/db_port.txt)
	$(info cat ${ROOT_DIR}/env/db_name.txt)
	$(info cat ${ROOT_DIR}/env/db_user.txt)
	$(info cat ${ROOT_DIR}/env/db_password.txt)
	$(info cat ${ROOT_DIR}/env/jwt_secret_key.txt)

	$(info cat ${ROOT_DIR}/env/from.txt)
	$(info cat ${ROOT_DIR}/env/account_sid.txt)
	$(info cat ${ROOT_DIR}/env/auth_token.txt)

	echo "\n[project_name]"
	cat "${ROOT_DIR}/env/project_name.txt"
	echo "\n[stage_name]"
	cat "${ROOT_DIR}/env/stage_name.txt"
	echo "\n[dynamodb_name_pattern]"
	cat "${ROOT_DIR}/env/dynamodb_name_pattern.txt"

	echo "\n[db_endpoint]"
	cat "${ROOT_DIR}/env/db_endpoint.txt"
	echo "\n[db_port]"
	cat "${ROOT_DIR}/env/db_port.txt"
	echo "\n[db_name]"
	cat "${ROOT_DIR}/env/db_name.txt"
	echo "\n[db_user]"
	cat "${ROOT_DIR}/env/db_user.txt"
	echo "\n[db_password]"
	cat "${ROOT_DIR}/env/db_password.txt"
	echo "\n[jwt_secret_key]"
	cat "${ROOT_DIR}/env/jwt_secret_key.txt"

	echo "\n[from]"
	cat "${ROOT_DIR}/env/from.txt"
	echo "\n[account_sid]"
	cat "${ROOT_DIR}/env/account_sid.txt"
	echo "\n[auth_token]"
	cat "${ROOT_DIR}/env/auth_token.txt"


	$(eval export TF_VAR_project_name := $(shell cat ${ROOT_DIR}/env/project_name.txt || tr A-Z a-z))
	$(eval export TF_VAR_stage_name := $(shell cat ${ROOT_DIR}/env/stage_name.txt || tr A-Z a-z))
	$(eval export TF_VAR_dynamodb_name_pattern := $(shell cat ${ROOT_DIR}/env/dynamodb_name_pattern.txt || tr A-Z a-z))
	$(eval export TF_VAR_db_endpoint := $(shell cat ${ROOT_DIR}/env/db_endpoint.txt || tr A-Z a-z))
	$(eval export TF_VAR_db_port := $(shell cat ${ROOT_DIR}/env/db_port.txt || tr A-Z a-z))
	$(eval export TF_VAR_db_name := $(shell cat ${ROOT_DIR}/env/db_name.txt || tr A-Z a-z))
	$(eval export TF_VAR_db_user := $(shell cat ${ROOT_DIR}/env/db_user.txt || tr A-Z a-z))
	$(eval export TF_VAR_db_password := $(shell cat ${ROOT_DIR}/env/db_password.txt || tr A-Z a-z))
	$(eval export TF_VAR_jwt_secret_key := $(shell cat ${ROOT_DIR}/env/jwt_secret_key.txt || tr A-Z a-z))
	$(eval export TF_VAR_workspace := )

	$(eval export TF_VAR_from := $(shell cat ${ROOT_DIR}/env/from.txt || tr A-Z a-z))
	$(eval export TF_VAR_account_sid := $(shell cat ${ROOT_DIR}/env/account_sid.txt || tr A-Z a-z))
	$(eval export TF_VAR_auth_token := $(shell cat ${ROOT_DIR}/env/auth_token.txt || tr A-Z a-z))

	$(info set-variable --- ROOT_DIR = ${ROOT_DIR} - Done)
else
	$(info execute "make" will read configuration)
	@read -p "Enter project_name(project_name.txt): " project_name; \
	echo $$project_name > ${ROOT_DIR}/env/project_name.txt; \
	echo project_name.txt file is
	cat ${ROOT_DIR}/env/project_name.txt;

	echo ex\) dev, stage, v1alpha, v1beta, v1, v2alpha, v2beta, v2, ...
	@read -p "Enter Stage name: " stage_name; \
	echo $$stage_name > ${ROOT_DIR}/env/stage_name.txt; \
	echo stage_name.txt file is
	cat ${ROOT_DIR}/env/stage_name.txt;

	echo ex\) 0woodev_v1, dev_0woodev, ...
	@read -p "Enter db name pattern: " dynamodb_name_pattern; \
	echo $$dynamodb_name_pattern > ${ROOT_DIR}/env/dynamodb_name_pattern.txt; \
	echo dynamodb_name_pattern.txt file is
	cat ${ROOT_DIR}/env/dynamodb_name_pattern.txt;

	echo ex\) 3306, 5432, ...
	@read -p "Enter postgres db port: " db_port; \
	echo $$db_port > ${ROOT_DIR}/env/db_port.txt; \
	echo db_port.txt file is
	cat ${ROOT_DIR}/env/db_port.txt;

	echo ex\) abcd.ap-northeast-2.rds.amazonaws.com ...

	@read -p "Enter postgres db endpoint: " db_endpoint; \
	echo $$db_endpoint > ${ROOT_DIR}/env/db_endpoint.txt; \
	echo db_endpoint.txt file is
	cat ${ROOT_DIR}/env/db_endpoint.txt;


	echo ex\) KAKAO, KAKAO_BANK, NAVER, ...
	@read -p "Enter postgres db schema name: " db_name; \
	echo $$db_name > ${ROOT_DIR}/env/db_name.txt; \
	echo db_name.txt file is
	cat ${ROOT_DIR}/env/db_name.txt;


	echo ex\) admin, user, user1, ...
	@read -p "Enter postgres db user: " db_user; \
	echo $$db_user > ${ROOT_DIR}/env/db_user.txt; \
	echo db_user.txt file is
	cat ${ROOT_DIR}/env/db_user.txt;

	echo ex\) !qwer1234 ...
	@read -p "Enter postgres db user password: " db_password; \
	echo $$db_password > ${ROOT_DIR}/env/db_password.txt; \
	echo db_password.txt file is
	cat ${ROOT_DIR}/env/db_password.txt;

	echo ex\) !qwer1234 ...
	@read -p "Enter jwt secret key: " jwt_secret_key; \
	echo $$jwt_secret_key > ${ROOT_DIR}/env/jwt_secret_key.txt; \
	echo jwt_secret_key.txt file is
	cat ${ROOT_DIR}/env/jwt_secret_key.txt;

	echo ex\) !qwer1234 ...
	@read -p "Enter workspace: " workspace; \
	echo $$workspace > ${ROOT_DIR}/env/workspace.txt; \
	echo workspace.txt file is
	cat ${ROOT_DIR}/env/workspace.txt;

		echo ex\) !qwer1234 ...
	@read -p "Enter postgres db user password: " from; \
	echo $$from > ${ROOT_DIR}/env/from.txt; \
	echo from.txt file is
	cat ${ROOT_DIR}/env/from.txt;

	echo ex\) !qwer1234 ...
	@read -p "Enter jwt secret key: " account_sid; \
	echo $$account_sid > ${ROOT_DIR}/env/account_sid.txt; \
	echo account_sid.txt file is
	cat ${ROOT_DIR}/env/account_sid.txt;

	echo ex\) !qwer1234 ...
	@read -p "Enter workspace: " auth_token; \
	echo $$auth_token > ${ROOT_DIR}/env/auth_token.txt; \
	echo auth_token.txt file is
	cat ${ROOT_DIR}/env/auth_token.txt;


	exit 0
endif


init-submodule: force
	git submodule init
	git submodule update

init: force set-variable
	$(info set-variable --- TF_VAR_project_name = ${TF_VAR_project_name} - Done)
	terraform init

fmt: force set-variable
	$(info set-variable --- TF_VAR_project_name = ${TF_VAR_project_name} - Done)
	terraform fmt

plan: force set-variable
	$(info set-variable --- TF_VAR_project_name = ${TF_VAR_project_name} - Done)
	terraform plan

apply: force set-variable
	$(info set-variable --- TF_VAR_project_name = ${TF_VAR_project_name} - Done)
	terraform apply

applyq: init
	$(info set-variable --- TF_VAR_project_name = ${TF_VAR_project_name} - Done)
	terraform apply -auto-approve

destroy: force set-variable
	$(info set-variable --- TF_VAR_project_name = ${TF_VAR_project_name} - Done)
	terraform destroy

# workspace

workspace: force set-variable set-workspace-variable
	$(info terraform plan with  ${TF_VAR_workspace})
	terraform workspace new ${TF_VAR_workspace}

plan-workspace: force set-variable set-workspace-variable
	$(info set-variable --- TF_VAR_project_name = ${TF_VAR_project_name} - Done)
	terraform workspace select ${TF_VAR_workspace}
	terraform plan

apply-workspace: force set-variable set-workspace-variable
	$(info set-variable --- TF_VAR_project_name = ${TF_VAR_project_name} - Done)
	terraform workspace select ${TF_VAR_workspace}
	terraform apply

applyq-workspace: init set-variable set-workspace-variable
	$(info set-variable --- TF_VAR_project_name = ${TF_VAR_project_name} - Done)
	terraform workspace select ${TF_VAR_workspace}
	terraform apply -auto-approve

destroy-workspace: force set-variable set-workspace-variable
	$(info set-variable --- TF_VAR_project_name = ${TF_VAR_project_name} - Done)
	terraform workspace select ${TF_VAR_workspace}
	terraform destroy
	cd .. && rm ${TF_VAR_workspace}api_gateway_id.txt

force:

build:
	cd ../api && make setup && make build

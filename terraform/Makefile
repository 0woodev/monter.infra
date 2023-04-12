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

.SILENT: set-variable
set-variable:
ifeq ($(FILE_EXISTS), 1)
	$(info set-variable --- ROOT_DIR = ${ROOT_DIR})
	$(info cat ${ROOT_DIR}/env/project_name.txt)
	$(info cat ${ROOT_DIR}/env/stage_name.txt)
	$(info cat ${ROOT_DIR}/env/dynamodb_name_pattern.txt)
	$(info cat ${ROOT_DIR}/env/db_endpoint.txt)
	$(info cat ${ROOT_DIR}/env/db_port.txt)
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


	$(eval export TF_VAR_project_name := $(shell cat ${ROOT_DIR}/env/project_name.txt || tr A-Z a-z))
	$(eval export TF_VAR_stage_name := $(shell cat ${ROOT_DIR}/env/stage_name.txt || tr A-Z a-z))
	$(eval export TF_VAR_dynamodb_name_pattern := $(shell cat ${ROOT_DIR}/env/dynamodb_name_pattern.txt || tr A-Z a-z))
	$(eval export TF_VAR_db_endpoint := $(shell cat ${ROOT_DIR}/env/db_endpoint.txt || tr A-Z a-z))
	$(eval export TF_VAR_db_port := $(shell cat ${ROOT_DIR}/env/db_port.txt || tr A-Z a-z))
	$(info set-variable --- ROOT_DIR = ${ROOT_DIR} - Done)
else
	$(info execute "make" will read configuration)
	@read -p "Enter project_name(project_name.txt): " project_name; \
	echo $$project_name > ${ROOT_DIR}/env/project_name.txt; \
	echo project_name.txt file is
	cat ${ROOT_DIR}/env/project_name.txt;

	echo ex\) v1alpha, v1beta, v1, v2alpha, v2beta, v2, ...
	@read -p "Enter Stage name: " stage_name; \
	echo $$stage_name > ${ROOT_DIR}/env/stage_name.txt; \
	echo stage_name.txt file is
	cat ${ROOT_DIR}/env/stage_name.txt;

	echo ex\) dev_song, song_p, dev_ted, push_dan, ...
	@read -p "Enter db name pattern: " db_name_pattern; \
	echo $$db_name_pattern > ${ROOT_DIR}/env/db_name_pattern.txt; \
	echo db_name_pattern.txt file is
	cat ${ROOT_DIR}/env/db_name_pattern.txt;

	echo ex\) dev_song, song_p, dev_ted, push_dan, ...
	@read -p "Enter community db name pattern: " community_db_name_pattern; \
	echo $$db_name_pattern > ${ROOT_DIR}/env/community_db_name_pattern.txt; \
	echo db_name_pattern.txt file is
	cat ${ROOT_DIR}/env/community_db_name_pattern.txt;

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

applyq: force set-variable
	$(info set-variable --- TF_VAR_project_name = ${TF_VAR_project_name} - Done)
	terraform apply -auto-approve

destroy: force set-variable
	$(info set-variable --- TF_VAR_project_name = ${TF_VAR_project_name} - Done)
	terraform destroy

force:

build:
	cd ../api && make setup && make build

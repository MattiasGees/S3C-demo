.PHONY: help
help:

spdx-sbom-generator := v0.0.10
trivy := 0.32.1

install: install-opensbom-generator install-tern install-syft install-sbom-tool install-kubernetes-bom install-trivy

install-opensbom-generator:
	wget https://github.com/spdx/spdx-sbom-generator/releases/download/$(spdx-sbom-generator)/spdx-sbom-generator-$(spdx-sbom-generator)-linux-amd64.tar.gz
	tar -xf spdx-sbom-generator-$(spdx-sbom-generator)-linux-amd64.tar.gz
	mv -f spdx-sbom-generator /usr/local/bin
	rm -rf spdx-sbom-generator-$(spdx-sbom-generator)-linux-amd64.tar.gz

install-tern:
	docker pull philipssoftware/tern:latest
 
install-syft:
	curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin

install-sbom-tool:
	curl -Lo sbom-tool https://github.com/microsoft/sbom-tool/releases/latest/download/sbom-tool-linux-x64
	chmod +x sbom-tool
	mv -f sbom-tool /usr/local/bin

install-kubernetes-bom:
	go install sigs.k8s.io/bom/cmd/bom@latest

install-trivy:
	rpm -ivh https://github.com/aquasecurity/trivy/releases/download/v$(trivy)/trivy_$(trivy)Linux-64bit.rpm

build:
	@docker build -t benediktwetzel/k8s-jmeter:local .

build_all:
	@while read -r version ; do \
		docker build --build-arg JMETER_VERSION=$$version -t benediktwetzel/k8s-jmeter:$$version-libs-prom . ; \
		docker push benediktwetzel/k8s-jmeter:$$version-libs-prom ; \
	done < VERSIONS

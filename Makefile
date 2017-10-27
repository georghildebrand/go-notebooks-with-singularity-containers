.PHONY: clean clean check image.def

IMAGE_DEF  	?= singularity_go-notebook.def
IMAGE_SIZE 	?= 1500
FLAG		?= go-notebook
IMAGE_FILE ?= /tmp/$(FLAG).img

default: bootstrap

bootstrap:
	sudo rm -f $(IMAGE_FILE)
	sudo singularity create --size $(IMAGE_SIZE) $(IMAGE_FILE)
	sudo singularity bootstrap $(IMAGE_FILE) $(IMAGE_DEF)
	sudo chmod a+rwx $(IMAGE_FILE)

setup:	
	sudo singularity copy $(IMAGE_FILE) copy_kernel.sh setup_golang_and_gophernotes.sh /
	sudo singularity exec -w $(IMAGE_FILE) chmod a+rx /setup_golang_and_gophernotes.sh /copy_kernel.sh
	sudo singularity exec -w $(IMAGE_FILE) /setup_golang_and_gophernotes.sh
	# create gophernotes kernel dir
	mkdir -p ~/.ipython/kernels/gophernotes

run_local:
	singularity run $(IMAGE_FILE)

export:
	sudo singularity export $(IMAGE_FILE) | gzip -9 > $(IMAGE_FILE).tar.gz

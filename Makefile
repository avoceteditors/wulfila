CALL=python3 setup.py 

all: dev-install download

dev-install:
	@$(CALL) build_ext 
	@$(CALL) install --user --force

install:
	@$(CALL) build_ext 
	@sudo $(CALL) install

clean: cython-clean python-clean

python-clean:
	@$(CALL) clean 

cython-clean:
	@rm wulfila/*.c

download:
	./utils/update-on -D



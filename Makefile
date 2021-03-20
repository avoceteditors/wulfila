CALL=python3 setup.py 

all: install ctags

install:
	@$(CALL) build_ext 
	@$(CALL) install --user --force

clean: 
	@$(CALL) clean 


ctags:
	ctags -R wulfila 


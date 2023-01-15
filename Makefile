.PHONY: preview watch deploy

LISP_CODE    = '(format t "~A" (getf (with-open-file (input ".coleslawrc") (read input)) '':staging-dir))'
STAGING_DIR != ros run -e $(LISP_CODE) -q

preview:
	mkdir -p "$(STAGING_DIR)"
	coleslaw generate
	coleslaw preview

watch:
	coleslaw watch

deploy:
	coleslaw deploy

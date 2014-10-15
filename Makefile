DEPLOYHOST    = tangiblepastathens.com
DEPLOYDIR     = /home/douhel3shell/tangiblepastathens.com

help:
	@echo deploy - copy site to server

.PHONEY: deploy
deploy: sitemap
	rsync -a -v --progress content/ $(DEPLOYHOST):$(DEPLOYDIR)
	$(MAKE) sitemap-announce

.PHONEY: sitemap
sitemap:
	./bin/sitemap_gen.py --config=etc/sitemap_gen_config.xml --testing

.PHONEY: sitemap-announce
sitemap-announce:
	./bin/sitemap_gen.py --config=etc/sitemap_gen_config.xml

.PHONEY: test
test:
	(cd content && python -m SimpleHTTPServer 8080)

all: test
byte: test7.byte
paint.cmo:
	$(MAKE) -f paint.mk $@
test7.byte: test7.ml paint.cmo
	ocamlc -o $@ -I . paint.cmo $<
VIZ=feh
test: test7.byte
	ocamlrun test7.byte | $(VIZ) -
clean:
	$(RM) test7.byte
	$(MAKE) -f paint.mk clean
	$(RM) test7.cmi
	$(RM) test7.cmo
	$(RM) test7.p3
	$(RM) test7.png

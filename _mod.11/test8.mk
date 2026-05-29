all: test
byte: test8.byte
paint.cmo:
	$(MAKE) -f paint.mk $@
test8.byte: test8.ml paint.cmo
	ocamlc -o $@ -I . paint.cmo $<
VIZ=feh
test: test8.byte
	ocamlrun test8.byte | $(VIZ) -
clean:
	$(RM) test8.byte
	$(MAKE) -f paint.mk clean
	$(RM) test8.cmi
	$(RM) test8.cmo
	$(RM) test8.p3
	$(RM) test8.png

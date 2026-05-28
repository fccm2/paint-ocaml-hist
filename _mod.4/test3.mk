all: test
byte: test3.byte
paint.cmo:
	$(MAKE) -f paint.mk $@
test3.byte: test3.ml paint.cmo
	ocamlc -o $@ -I . paint.cmo $<
VIZ=feh
test: test3.byte
	ocamlrun test3.byte | $(VIZ) -
clean:
	$(RM) test3.byte
	$(MAKE) -f paint.mk clean
	$(RM) test3.cmi
	$(RM) test3.cmo
	$(RM) test3.p3
	$(RM) test3.png

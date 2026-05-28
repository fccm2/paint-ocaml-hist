all: test
byte: test4.byte
paint.cmo:
	$(MAKE) -f paint.mk $@
test4.byte: test4.ml paint.cmo
	ocamlc -o $@ -I . paint.cmo $<
VIZ=feh
test: test4.byte
	ocamlrun test4.byte | $(VIZ) -
clean:
	$(RM) test4.byte
	$(MAKE) -f paint.mk clean
	$(RM) test4.cmi
	$(RM) test4.cmo
	$(RM) test4.p3
	$(RM) test4.png

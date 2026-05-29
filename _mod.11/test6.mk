all: test
byte: test6.byte
paint.cmo:
	$(MAKE) -f paint.mk $@
test6.byte: test6.ml paint.cmo
	ocamlc -o $@ -I . paint.cmo $<
VIZ=feh
test: test6.byte
	ocamlrun test6.byte | $(VIZ) -
clean:
	$(RM) test6.byte
	$(MAKE) -f paint.mk clean
	$(RM) test6.cmi
	$(RM) test6.cmo
	$(RM) test6.p3
	$(RM) test6.png

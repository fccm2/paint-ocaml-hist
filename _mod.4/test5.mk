all: test
byte: test5.byte
paint.cmo:
	$(MAKE) -f paint.mk $@
test5.byte: test5.ml paint.cmo
	ocamlc -o $@ -I . paint.cmo $<
VIZ=feh
test: test5.byte
	ocamlrun test5.byte | $(VIZ) -
clean:
	$(RM) test5.byte
	$(MAKE) -f paint.mk clean
	$(RM) test5.cmi
	$(RM) test5.cmo
	$(RM) test5.p3
	$(RM) test5.png

all: test
bytes: test2.byte test1.byte test0.byte
paint.cmo:
	$(MAKE) -f paint.mk $@
test2.byte: test2.ml paint.cmo
	ocamlc -o $@ -I . paint.cmo $<
test1.byte: test1.ml paint.cmo
	ocamlc -o $@ -I . paint.cmo $<
test0.byte: test0.ml paint.cmo
	ocamlc -o $@ -I . paint.cmo $<
VIZ=feh
test: test2.byte test1.byte test0.byte
	ocamlrun test0.byte | $(VIZ) -
	ocamlrun test1.byte | $(VIZ) -
	ocamlrun test2.byte | $(VIZ) -
clean:
	$(RM) test2.byte
	$(RM) test1.byte
	$(RM) test0.byte
	$(MAKE) -f paint.mk clean
	$(RM) test0.cmi
	$(RM) test0.cmo
	$(RM) test1.cmi
	$(RM) test1.cmo
	$(RM) test2.cmi
	$(RM) test2.cmo
	$(RM) test0.p3
	$(RM) test0.png
	$(RM) test1.p3
	$(RM) test1.png
	$(RM) test2.p3
	$(RM) test2.png

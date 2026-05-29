all: paint.cmo
opt: paint.cmx
paint.cmx: paint.ml paint.cmi
	ocamlopt -c paint.ml
paint.cmo: paint.ml paint.cmi
	ocamlc -c paint.ml
paint.cmi: paint.mli
	ocamlc -c paint.mli
clean:
	$(RM) paint.cmi
	$(RM) paint.cmo
	$(RM) paint.cmx
	$(RM) paint.o

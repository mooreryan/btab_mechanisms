(lang dune 3.2)

(generate_opam_files true)

(cram enable)

(package
 (name btab_mechanisms)
 (depends
  (bio_io
   (= "0.5.0-PREVIEW"))
  (cmdliner
   (>= "1.1"))
  (core
   (>= "v0.15"))
  (ocaml
   (>= "4.08"))
  (ppx_jane
   (>= "v0.15"))
  (bisect_ppx :dev)
  (ocamlformat
   (and
    (= "0.22.4")
    :dev))))

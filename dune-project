(lang dune 2.9)

(name dream-accept)

(documentation "https://tmattio.github.io/dream-accept/")

(source
 (github tmattio/dream-accept))

(license MIT)

(authors "Thibaut Mattio")

(maintainers "Thibaut Mattio")

(generate_opam_files true)

(package
 (name dream-accept)
 (synopsis "Accept headers parsing for Dream.")
 (description "Accept headers parsing for Dream.")
 (depends
  (ocaml
   (>= 4.08.0))
  dune
  dream
  (odoc :with-doc)))

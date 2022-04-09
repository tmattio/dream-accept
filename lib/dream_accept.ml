type media_type = Accept.media_type =
  | Media_type of string * string
  | Any_media_subtype of string
  | Any

type charset = Accept.charset = Charset of string | Any

type encoding = Accept.encoding =
  | Encoding of string
  | Gzip
  | Compress
  | Deflate
  | Identity
  | Any

type language = Accept.language = Language of string | Any

let accepted_charsets req =
  Accept.charsets @@ Dream.header req "Accept-Charset"
  |> Accept.qsort |> List.map snd

let accepted_charsets_with_quality req =
  Accept.charsets @@ Dream.header req "Accept-Charset"

let accept_charsets charsets req =
  let charsets = Accept.string_of_charsets charsets in
  Dream.add_header req charsets "Accept-Charset";
  req

let accepted_encodings req =
  Accept.encodings @@ Dream.header req "Accept-Encoding"
  |> Accept.qsort |> List.map snd

let accepted_encodings_with_quality req =
  Accept.encodings @@ Dream.header req "Accept-Encoding"

let accept_encodings encodings req =
  let encodings = Accept.string_of_encodings encodings in
  Dream.add_header req encodings "Accept-Encoding";
  req

let accepted_languages req =
  Accept.languages @@ Dream.header req "Accept-Language"
  |> Accept.qsort |> List.map snd

let accepted_languages_with_quality req =
  Accept.languages @@ Dream.header req "Accept-Language"

let accept_languages languages req =
  let languages = Accept.string_of_languages languages in
  Dream.add_header req languages "Accept-Language";
  req

let accepted_media_types req =
  Accept.media_types @@ Dream.header req "Accept"
  |> Accept.qsort
  |> List.map (fun x -> fst (snd x))

let accepted_media_types_with_quality req =
  Accept.media_types @@ Dream.header req "Accept"
  |> List.map (fun (i, x) -> (i, fst x))

let accept_media_types media_types req =
  let media_types =
    Accept.string_of_media_types
      (List.map (fun (i, x) -> (i, (x, []))) media_types)
  in
  Dream.add_header req media_types "Accept";
  req

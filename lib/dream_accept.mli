type media_range =
  | Media_type of string * string
  | Any_media_subtype of string
  | Any

type charset =
  | Charset of string
  | Any

type encoding =
  | Encoding of string
  | Gzip
  | Compress
  | Deflate
  | Identity
  | Any

val accepted_charsets : 'a Dream.message -> string list
(** Retrieve the accepted charset from the [Accept-Charset] header.

    The results are ordered by their quality in decreasing order. *)

val accepted_charsets_with_quality : 'a Dream.message -> (string * int) list

val accept_charsets : string list -> 'a Dream.message -> 'a Dream.message

val accepted_encodings : 'a Dream.message -> string list

val accept_encodings : string list -> 'a Dream.message -> 'a Dream.message

val accepted_languages : 'a Dream.message -> string list

val accept_languages : string list -> 'a Dream.message -> 'a Dream.message

val accepted_media_ranges : 'a Dream.message -> string list

val accept_media_ranges : string list -> 'a Dream.message -> 'a Dream.message

val accepted_media_types : 'a Dream.message -> string list

val accept_media_types : string list -> 'a Dream.message -> 'a Dream.message

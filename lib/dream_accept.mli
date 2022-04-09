type media_type =
  | Media_type of string * string
  | Any_media_subtype of string
  | Any

type charset = Charset of string | Any

type encoding =
  | Encoding of string
  | Gzip
  | Compress
  | Deflate
  | Identity
  | Any

type language = Language of string | Any

val accepted_charsets : 'a Dream.message -> charset list
(** Retrieve the accepted charset from the [Accept-Charset] header.

    The results are ordered by their quality in decreasing order. *)

val accepted_charsets_with_quality : 'a Dream.message -> (int * charset) list
(** Retrieve the accepted charset from the [Accept-Charset] header with their
    associated quality.

    The result are in the same order as the HTTP header, which is not garanteed
    to be in decreasing order. *)

val accept_charsets :
  (int * charset) list -> 'a Dream.message -> 'a Dream.message
(** Set the [Accept-Charset] header of the given dream message. *)

val accepted_encodings : 'a Dream.message -> encoding list
(** Retrieve the accepted encoding from the [Accept-Encoding] header.

    The results are ordered by their quality in decreasing order. *)

val accepted_encodings_with_quality : 'a Dream.message -> (int * encoding) list
(** Retrieve the accepted encoding from the [Accept-Encoding] header with their
    associated quality.

    The result are in the same order as the HTTP header, which is not garanteed
    to be in decreasing order. *)

val accept_encodings :
  (int * encoding) list -> 'a Dream.message -> 'a Dream.message
(** Set the [Accept-Encoding] header of the given dream message. *)

val accepted_languages : 'a Dream.message -> language list
(** Retrieve the accepted language from the [Accept-Language] header.

    The results are ordered by their quality in decreasing order. *)

val accepted_languages_with_quality : 'a Dream.message -> (int * language) list
(** Retrieve the accepted language from the [Accept-Language] header with their
    associated quality.

    The result are in the same order as the HTTP header, which is not garanteed
    to be in decreasing order. *)

val accept_languages :
  (int * language) list -> 'a Dream.message -> 'a Dream.message
(** Set the [Accept-Language] header of the given dream message. *)

val accepted_media_types : 'a Dream.message -> media_type list
(** Retrieve the accepted media type from the [Accept] header.

    The results are ordered by their quality in decreasing order. *)

val accepted_media_types_with_quality :
  'a Dream.message -> (int * media_type) list
(** Retrieve the accepted media type from the [Accept] header with their
    associated quality.

    The result are in the same order as the HTTP header, which is not garanteed
    to be in decreasing order. *)

val accept_media_types :
  (int * media_type) list -> 'a Dream.message -> 'a Dream.message
(** Set the [Accept] header of the given dream message. *)

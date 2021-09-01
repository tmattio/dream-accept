(* From https://github.com/lyrm/ocaml-httpadapter/blob/master/src/http.mli

   Copyright (c) 2019 Carine Morel <carine@tarides.com>

   Permission to use, copy, modify, and distribute this software for any purpose
   with or without fee is hereby granted, provided that the above copyright
   notice and this permission notice appear in all copies.

   THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
   REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
   AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
   INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
   LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
   OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
   PERFORMANCE OF THIS SOFTWARE. *)

type p = string * string

type media_type =
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

(** Basic language range tag. ["en-gb"] is represented as
    [Language \["en"; "gb"\]].

    @see <https://tools.ietf.org/html/rfc7231#section-5.3.5> the specification. *)
type language =
  | Language of string
  | Any

(** Accept-Encoding HTTP header parsing and generation *)

(** Qualities are integers between 0 and 1000. A header with ["q=0.7"]
    corresponds to a quality of [700]. *)
type q = int

(** Lists, annotated with qualities. *)
type 'a qlist = (q * 'a) list

val qsort : 'a qlist -> 'a qlist
(** Sort by quality, biggest first. Respect the initial ordering. *)

val media_types : string option -> (media_type * p list) qlist

val charsets : string option -> charset qlist

val encodings : string option -> encoding qlist

val languages : string option -> language qlist

val string_of_media_type : ?q:q -> media_type * p list -> string

val string_of_charset : ?q:q -> charset -> string

val string_of_encoding : ?q:q -> encoding -> string

val string_of_language : ?q:q -> language -> string

val string_of_media_types : (media_type * p list) qlist -> string

val string_of_charsets : charset qlist -> string

val string_of_encodings : encoding qlist -> string

val string_of_languages : language qlist -> string

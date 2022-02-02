(** Main entry point for our application. *)

let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router
       [ Dream.get "/" (fun req ->
             let media_type =
               match Dream_accept.accepted_media_types req |> List.hd with
               | Dream_accept.Media_type (s, sub) ->
                 Printf.sprintf "%s/%s" s sub
               | Dream_accept.Any_media_subtype s ->
                 s
               | Dream_accept.Any ->
                 "*"
             in
             let language =
               match Dream_accept.accepted_languages req |> List.hd with
               | Dream_accept.Language s ->
                 s
               | Dream_accept.Any ->
                 "*"
             in
             Dream.html
               (Printf.sprintf
                  "Media type: %s<br>Language: %s"
                  media_type
                  language))
       ]
  @@ Dream.not_found

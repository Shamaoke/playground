open Tyxml

let%html mycontent = {|
  <div class="content">
    <h1>A fabulous title</h1>
    This is a fabulous content.
  </div>
|}

let my_content = Data.read "my_content"
let my_title   = Data.read "my_title"
let my_page    = Data.read "my_page" [("my_title", my_title); ("my_content", my_content)]

(* is the same as *)
let my_content = [%data "my_content" ]
let my_title   = [%data "my_title" ]
let my_page    = [%data "my_page" [("my_title", my_title); ("my_content", my_content)] ]

(* and the same as *)
let%data my_content = "my_content"
let%data my_title   = "my_title"
let%data my_page    = "my_page"

let file = open_out "index.html" in
  let fmt = Format.formatter_of_out_channel file in

    Format.fprintf fmt "%a@." (Haml.parse ~indent:true ()) my_page;
    close_out file

;;

let file = open_out "index_html"
and html = Haml.parse ~indent:true () my_page
and frmt = "%a@." in
let frm  = Format.formatter_of_out_channel file in
           Format.fprintf frm frmt html;
           close_out file
;;

let file = open_out "index_html" in
let html = Haml.parse ~indent:true () my_page in
let frmt = "%a@." in
let frm  = Format.formatter_of_out_channel file in

  Format.fprintf frm frmt html;
  close_out file

;;

let mytitle = Html.pcdata "A Fabulous Web Page"

let%html mypage =
  {|<html>
     <head>
       <title>|}mytitle{|</title>
     </head>
     <body>"mycontent"</body>
   </html>
  |}

let () =
  let file = open_out "index.html" in
  let fmt = Format.formatter_of_out_channel file in
  Format.fprintf fmt "%a@." (Html.pp ~indent:true ()) mypage;
  close_out file

[%%data
  [ ("my_conent",
    {|
      %div{ :class => 'conent' }
        %h1 A fabulous title
        %conent This is a fabulous content.
    |});

    ("my_title", "A Fabulous Web Page");

    ("my_page",
    {|
      %html
        %head
          %title= @title
          %body= @my_content
    |}) ]
]

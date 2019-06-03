(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   examples_of_file.ml                                :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/27 19:20:26 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/28 22:43:59 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let is_alpha str =
    try 
        float_of_string str;
        false
     with e -> true

let count_float lst =
    let ret = ref ((List.length lst) - 1)
    in for i = 0 to !ret; do
        if is_alpha (List.nth lst i) then decr ret
    done;
    (!ret)

let create_row line  =
    let split = String.split_on_char ',' line
    in let tab_length = count_float split
    in let tab = Array.make tab_length 1.0
    in for i = 0 to tab_length - 1; do
        (*print_endline( string_of_float (float_of_string (List.nth split i)));*)
        tab.(i) <- float_of_string (List.nth split i);
        done;
     (tab, List.nth split (tab_length + 1))

let examples_of_file file_name  =
  let ic = open_in file_name
  in let lst = ref []
  in try 
      while true do
        let line = input_line ic
        in lst := ((create_row line)::!lst);
      done;
      !lst
  with 
   | End_of_file -> close_in ic;
  !lst

let file_to_array file_name = 
  let rec print_data data = match data with
      | [] -> () 
      | head::tail -> let (a, b) = head
          in for i = 0 to (Array.length a) - 1;do
              print_string ((string_of_float a.(i)) ^ " ");
          done;print_endline b; print_data tail;
   in print_data (examples_of_file file_name)
    

let main () =
    let read_arg argc argv = match (argc, argv) with
     | (2, _)-> print_endline Sys.argv.(1);file_to_array Sys.argv.(1)
     | _ -> ()
in read_arg (Array.length Sys.argv) Sys.argv

let () = main ()

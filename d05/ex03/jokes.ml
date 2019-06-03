(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   jokes.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/27 14:55:39 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/28 22:14:35 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let print_random_joke jokes = 
    Random.self_init ();
    print_string jokes.(Random.int (Array.length jokes))

let is_new str = str == "new"

let get_line ic jokes iter =
    let index = ref 0 
    in let line = ref ""
    in while !line <> "end" do
    line := input_line ic
    ; if (!line = "new") then
     incr index
    else
        jokes.(!index) <- jokes.(!index) ^ !line ^ "\n";
  done;
  jokes

let file_to_array file_name = 
  let ic = open_in file_name
  in try 
  let joke_count = (int_of_string (input_line ic))
  in let jokes = Array.make (joke_count) ""
  in print_random_joke (get_line ic jokes joke_count);
  close_in ic                  (* close the input channel *) 

  with e ->                      (* some unexpected exception occurs *)
    close_in_noerr ic;           (* emergency closing *)
    print_endline "please enter the right jokes number"
    
                                   
let main () =
    let read_arg argc argv = match (argc, argv) with
     | (2, _)-> file_to_array Sys.argv.(1)
     | _ -> ()
in read_arg (Array.length Sys.argv) Sys.argv

let () = main ()

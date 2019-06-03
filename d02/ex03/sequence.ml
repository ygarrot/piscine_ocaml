(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   sequence.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/22 20:15:14 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/23 16:36:06 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)
let rec print_list = function 
    | [] -> print_char '\n'
    | e::l -> let (a, b) = e in
    print_int a;
    print_char ' ';
    print_char b;
    print_string " " ;
    print_list l


let sequence n =
    let rec list_to_string lst = match lst with
    | [] -> ""
    | head::tail -> (string_of_int head) ^ " " ^ (list_to_string tail)

    in let get_first lst = match lst with
    | [] -> 1 
    | head::tail -> head

    in let rec count_same_elem lst elem count = match lst with
    | [] -> count::elem::[]
    | head::tail -> if head = elem then (count_same_elem tail head (count + 1))
                                    else count::elem::(count_same_elem tail head 1)

    in let rec iter_sequence lst x = match x with
    | 0 -> lst
    | x when x < 0 -> []
    | _ -> iter_sequence (count_same_elem lst (get_first lst) 0) (x - 1)
    in list_to_string (iter_sequence [1] (n - 1))

let main () =
    print_endline (sequence (-1));
    print_endline (sequence 0);
    print_endline (sequence 1);
    print_endline (sequence 2);
    print_endline (sequence 3);
    ()

let () = main ()

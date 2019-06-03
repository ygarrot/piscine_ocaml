(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   encode.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/22 09:57:18 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/31 20:13:53 by ygarrot          ###   ########.fr       *)
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


let encode lst =
    if lst =[] then [] else begin 

    let get_first lst = match lst with
    | [] -> ' '
    | head::tail -> head

    in let rec count_same_elem lst elem count = match lst with
    | [] -> [(count, elem)]
    | head::tail -> if head = elem then (count_same_elem tail head (count + 1))
                                    else (count, elem)::(count_same_elem tail head 1)
    in count_same_elem lst (get_first lst) 0 end

let main () =
    print_list (encode ['a'; 'a'; 'a'; 'b'; 'b']) ;
    print_list (encode ['b']) ;
    print_list (encode []) ;
    ()

let () = main ()

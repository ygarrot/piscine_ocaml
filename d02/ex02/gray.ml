(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   gray.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/22 15:13:09 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/23 15:50:05 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let gray n =
    if n < 1 then () else begin
    let rec empty x lst = match x with
    | x when x > 0 -> empty (x - 1) (0::lst)
    | _ -> lst 

    in let rec isdone lst = match lst with
    | node::[] when node = 1 -> true
    | node::tail when node = 0 -> isdone tail
    | node::tail when node = 1 -> false
    | _ ->  false

    in let rec print_list = function 
    | [] -> ()
    | e::l -> print_list l; print_int e

    in let rec fill_lst ls = match ls with
    | [] -> []
    | head::tail -> let res = head lxor 1 in
                    if res = 0 then res::fill_lst tail
                    else res::tail

    in let rec iter lst =
    print_list lst;
    print_char ' '; 
    if isdone lst then () 
    else begin
        iter (fill_lst lst)
    end
    in iter (empty n []);
    print_char '\n'
    end

let main () =
    gray 0;
    gray (-1);
    gray 1;
    gray 2;
    gray 3;
    gray 10;
    ()

let () = main ()

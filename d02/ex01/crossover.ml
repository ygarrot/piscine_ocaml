(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   crossover.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/22 12:30:10 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/23 11:07:02 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let crossover lst lst2 =
    if lst = [] || lst2 = [] then []
    else
    let rec find elem = function
    | [] -> false
    | head::tail -> head = elem || find elem tail
    in let rec  match_list lst lst2 lst3 = match lst with 
    | [] -> lst3
    | head::tail -> if find head lst2 then match_list tail lst2 (head::lst3)
                                        else match_list tail lst2 lst3
    in match_list lst lst2 []

let rec print_list = function 
    [] -> ()
    | e::l -> print_int e ; print_string " " ; print_list l

let main ()  =
    let t = [1; 2;4]
    in let t2 = [1; 2;3;4;4;5]
    in let l = (crossover t t2)
    in print_list l;
    ()

let () =  main()

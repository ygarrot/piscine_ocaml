(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   sum.ml                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/27 16:15:22 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/28 17:24:36 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let sum a b= 
    try
        a +. b
    with e -> nan

let main () =
    print_endline (string_of_float (sum 1.2  3.4));
    print_endline (string_of_float (sum max_float max_float));
    ()

let () = main ()

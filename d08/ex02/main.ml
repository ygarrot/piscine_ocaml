(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/30 13:04:46 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/31 21:59:03 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () = 
    let methane = new Alkane.methane
    in let ethane = new Alkane.ethane
    in let octane = new Alkane.octane
    in 
    print_endline methane#formula;
    print_endline ethane#formula;
    print_endline octane#formula;
    print_endline (string_of_bool (octane#equals octane));
    print_endline (string_of_bool (octane#equals ethane));

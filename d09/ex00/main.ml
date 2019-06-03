(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/31 11:14:36 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/06/01 17:37:29 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () = 
    print_endline (string_of_int (Watchtower.Watchtower.add 12 5));
    print_endline (string_of_int (Watchtower.Watchtower.sub 5 12));
    print_endline (string_of_int (Watchtower.Watchtower.zero));

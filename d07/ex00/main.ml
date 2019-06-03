(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/29 10:57:51 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/29 12:10:00 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
    let jackie = new People.people "Jackie Tyler"
    in jackie#talk;
    print_endline jackie#to_string;
    jackie#die

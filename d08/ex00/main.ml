(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/30 13:04:46 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/30 13:25:42 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () = 
    let hydrogen = new Atom.hydrogen
    in let carbon = new Atom.carbon
    in let oxygen = new Atom.oxygen
    in let nitrogen = new Atom.nitrogen
    in let helium = new Atom.helium
    in let sulfur = new Atom.sulfur
    in let iodine = new Atom.iodine
    in let phosphorus = new Atom.phosphorus
    in 
    print_endline hydrogen#to_string;
    print_endline carbon#to_string;
    print_endline oxygen#to_string;
    print_endline nitrogen#to_string;
    print_endline helium#to_string;
    print_endline sulfur#to_string;
    print_endline iodine#to_string;
    print_endline phosphorus#to_string;
    print_endline (string_of_bool (helium#equal hydrogen));
    print_endline (string_of_bool (helium#equal helium))

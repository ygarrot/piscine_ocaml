(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/30 13:04:46 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/31 22:00:21 by ygarrot          ###   ########.fr       *)
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
    in let water = new Molecule.water
    in let carbon_dioxyde = new Molecule.carbon_dioxyde
    in let diamond = new Molecule.diamond
    in let carbon_monoxyde = new Molecule.carbon_monoxyde
    in let ruby = new Molecule.ruby
    in 
    print_endline water#formula;
    print_endline carbon_dioxyde#formula;
    print_endline diamond#formula;
    print_endline carbon_monoxyde#formula;
    print_endline ruby#formula;
    print_endline ruby#to_string;
    print_endline (string_of_bool (ruby#equals ruby));
    print_endline (string_of_bool (ruby#equals diamond));


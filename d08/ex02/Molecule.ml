(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Molecule.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/30 13:28:23 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/31 21:56:34 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let sort_list atom_1 atom_2 =  match atom_1 with
        | atom_1 when atom_1#symbol = "C" -> -1
        | atom_1 when atom_2#symbol = "C" -> 1
        | atom_1 when atom_1#symbol = "H" && atom_2#symbol = "C" -> -1
        | atom_1 when atom_1#symbol = "H" -> -1
        | atom_1 when atom_2#symbol = "H" -> -1
        | atom_1 when atom_1#symbol = atom_2#symbol -> compare atom_2#symbol.[0] atom_1#symbol.[0]
        | _ -> 0

type formula_type = string

class virtual molecule (n_name:string) (atoms:Atom.atom list) =
    object (self: 'a)
        method name:string = n_name
         method formula:formula_type =
            let sorted = List.sort sort_list atoms
        in let rec group_by lst count symbol = match lst with
        | [] -> symbol ^ (string_of_int (count + 1))
        | head::tail when head#symbol = symbol -> group_by tail (count + 1) symbol
        | head::tail -> let ret = symbol ^ (string_of_int (count + 1)) ^ (group_by tail (0) head#symbol)
        in if symbol = " " then (group_by tail (0) head#symbol) else ret
        in group_by sorted 0 " "
        method equals (that:'a) = self#formula = that#formula
        method to_string = self#name ^ " " ^ self#formula
    end

class water =
object 
    inherit molecule "water" [new Atom.hydrogen; new Atom.hydrogen; new Atom.oxygen] 
end

class carbon_dioxyde =
object 
    inherit molecule "carbon_dioxyde" [new Atom.carbon; new Atom.oxygen; new Atom.oxygen] 
end

class carbon_monoxyde =
object 
    inherit molecule "carbon_monoxyde" [new Atom.carbon; new Atom.oxygen] 
end

class diamond =
object 
    inherit molecule "diamond" [new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon;new Atom.carbon] 
end

class ruby =
object 
    inherit molecule "ruby" [new Atom.aluminium; new Atom.aluminium; new Atom.oxygen; new Atom.oxygen; new Atom.oxygen] 
end


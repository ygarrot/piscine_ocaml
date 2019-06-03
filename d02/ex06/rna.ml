(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   rna.ml                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/23 13:44:30 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/23 16:51:49 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type phosphate = string 
type deoxyribose = string 
type nucleobase = A | T | C | G | U | None
type nucleotide =
{
    phos:phosphate;
    deo:deoxyribose;
    nucl:nucleobase;
}
type helix = nucleotide list
type rna = nucleobase list

let char_of_nucleobase nucl = match nucl with
| A ->"Adenine"
| T -> "Thymine"
| C -> "Cytosine"
| G -> "Guanine"
| U -> "Uracil"
| None -> "None"

let rec generate_nucleotide n =
    Random.self_init ();
    let random_dic x = match x with
    | 0 -> A
    | 1 -> T
    | 2 -> C
    | 3 -> G
    | _ -> None
    in let iter_creation n = match n with 
    | x when x > 0 -> 
        {
            phos = "phosphate";
            deo = "deoxyribose";
            nucl = (random_dic (Random.int 4))
        }::(generate_nucleotide (x - 1))
    | _ ->[]
    in iter_creation n

let rec rna_to_string helix_list = match helix_list with
    | [] -> ""
    | head::tail -> (char_of_nucleobase head) ^ " " ^ (rna_to_string tail)

let rec helix_to_string helix_list = match helix_list with
    | [] -> ""
    | head::tail -> head.phos ^ " " ^ head.deo ^ " " ^ (char_of_nucleobase head.nucl) ^ " " ^ (helix_to_string tail)

let rec complementary_helix helix =
    let complementary_helix_aux nucl = match nucl with
        | A -> T
        | T -> A
        | C -> G
        | G -> C
        | _ -> None
    in let rec iter_helix lst = match lst with
    | [] -> []
    | head::tail -> let current = complementary_helix_aux head.nucl
                    in {phos = head.phos;deo = head.deo;nucl = current}::(iter_helix tail)
    in iter_helix helix 

let rec generate_rna helix =
    let generate_rna_aux nucl = match nucl with
        | A -> U
        | T -> A
        | C -> G
        | G -> C
        | _ -> None
    in let rec iter_helix lst = match lst with
    | [] -> []
    | head::tail -> let current = generate_rna_aux head.nucl
                    in current::(iter_helix tail)
    in iter_helix helix 

let main () =
    let lst = (generate_nucleotide 4) in 
    let lst2 = generate_rna lst in
    print_endline (helix_to_string lst);
    print_endline (rna_to_string lst2);
    ()

let () = main ()

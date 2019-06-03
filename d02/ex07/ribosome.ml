(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ribosome.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/23 14:08:34 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/23 22:04:43 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type phosphate = string 
type deoxyribose = string 
type nucleobase = A | T | C | G | U | None
type aminoacid = Stop | Ala | Arg | Asn | Asp | Cys | Gln | Glu | Gly | His | Ile | Leu | Lys | Met | Phe | Pro | Ser | Thr | Trp | Tyr | Val
type 'a protein = aminoacid list * 'a ->string
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
    let complementary_helix_aux nucl = match nucl with
        | A -> U
        | T -> A
        | C -> G
        | G -> C
        | _ -> None
    in let rec iter_helix lst = match lst with
    | [] -> []
    | head::tail -> let current = complementary_helix_aux head.nucl
                    in current::(iter_helix tail)
    in iter_helix helix 

let rec generate_bases_triplets rna = match rna with
| head::node::node_2::tail -> (head, node, node_2)::(generate_bases_triplets tail)
| _ -> []

let string_of_protein protein = 
    let prot_dic prot = match prot with
    | Stop -> "End of translation" 
    | Ala -> "Alanine" 
    | Arg -> "Arginine" 
    | Asn -> "Asparagine" 
    | Asp -> "Aspartique" 
    | Cys -> "Cysteine" 
    | Gln -> "Glutamine" 
    | Glu -> "Glutamique" 
    | Gly -> "Glycine" 
    | His -> "Histidine" 
    | Ile -> "Isoleucine" 
    | Leu -> "Leucine" 
    | Lys -> "Lysine" 
    | Met -> "Methionine" 
    | Phe -> "Phenylalanine" 
    | Pro -> "Proline" 
    | Ser -> "Serine" 
    | Thr -> "Threonine" 
    | Trp -> "Tryptophane" 
    | Tyr -> "Tyrosine" 
    | Val -> "Valine" 
    in let rec set_value key = match key with
    | head::tail -> (prot_dic head) ^ " " ^ (set_value tail)
    | [] -> ""
    in set_value protein

let rec decode_arn rna = match rna with
   |head::tail when head = (U,G,G) -> Trp::decode_arn tail
   |head::tail when head = (A,U,G) -> Met::decode_arn tail
   |head::node1::tail when head = (A,A,C) && node1 = (A,A,U) -> Asn::decode_arn tail
   |head::node1::tail when head = (G,A,C) && node1 = (G,A,U) -> Asp::decode_arn tail
   |head::node1::tail when head = (U,G,C) && node1 = (U,G,U) -> Cys::decode_arn tail
   |head::node1::tail when head = (C,A,A) && node1 = (C,A,G) -> Gln::decode_arn tail
   |head::node1::tail when head = (G,A,A) && node1 = (G,A,G) -> Glu::decode_arn tail
   |head::node1::tail when head = (A,A,A) && node1 = (A,A,G) -> Lys::decode_arn tail
   |head::node1::tail when head = (U,U,C) && node1 = (U,U,U) -> Phe::decode_arn tail
   |head::node1::tail when head = (U,A,C) && node1 = (U,A,U) -> Tyr::decode_arn tail
   |head::node1::tail when head = (C,A,C) && node1 = (C,A,U) -> His::decode_arn tail
   |head::node1::node2::tail when head = (U,A,A) && node1 = (U,A,G) && node2 = (U,G,A) -> Stop::decode_arn tail
   |head::node1::node2::tail when head = (A,U,A) && node1 = (A,U,C) && node2 = (A,U,U) -> Ile::decode_arn tail
   |head::node1::node2::node3::tail when head = (G,G,A) && node1 = (G,G,C) && node2 = (G,G,G) && node3 = (G,G,U) -> Gly::decode_arn tail
   |head::node1::node2::node3::tail when head = (A,C,A) && node1 = (A,C,C) && node2 = (A,C,G) && node3 = (A,C,U) -> Thr::decode_arn tail
   |head::node1::node2::node3::tail when head = (C,C,C) && node1 = (C,C,A) && node2 = (C,C,G) && node3 = (C,C,U) -> Pro::decode_arn tail
   |head::node1::node2::node3::tail when head = (G,U,A) && node1 = (G,U,C) && node2 = (G,U,G) && node3 = (G,U,U) -> Val::decode_arn tail
   |head::node1::node2::node3::tail when head = (G,C,A) && node1 = (G,C,C) && node2 = (G,C,G) && node3 = (G,C,U) -> Ala::decode_arn tail
   |head::node1::node2::node3::node4::node5::tail when head = (A,G,A) && node1 = (A,G,G) && node2 = (C,G,A) && node3 = (C,G,C) && node4 = (C,G,G) && node5 = (C,G,U) -> Arg::decode_arn tail
   |head::node1::node2::node3::node4::node5::tail when head = (C,U,A) && node1 = (C,U,C) && node2 = (C,U,G) && node3 = (C,U,U) && node4 = (U,U,A) && node5 = (U,U,G) -> Leu::decode_arn tail
   |head::node1::node2::node3::node4::node5::tail when head = (U,C,A) && node1 = (U,C,C) && node2 = (U,C,G) && node3 = (U,C,U) && node4 = (A,G,U) && node5 = (A,G,C) -> Ser::decode_arn tail

let main () =
    let lst = (generate_nucleotide 4) in 
    let lst2 = generate_rna lst in
    print_endline (helix_to_string lst);
    print_endline (rna_to_string lst2);
    ()

let () = main ()

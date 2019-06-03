(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   nucleotide.ml                                      :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/23 11:51:01 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/23 16:43:47 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type phosphate = string 
type deoxyribose = string 
type nucleobase = A | T | C | G | None
type nucleotide =
{
    phos:phosphate;
    deo:deoxyribose;
    nucl:nucleobase;
}

let generate_nucleotide new_val = 
    let char_of_nucleobase nucl = match nucl with
| 'A' -> A
| 'T' -> T
| 'C' -> C
| 'G' -> G
| _ -> None

    in {
        phos = "phosphare";
        deo = "deoxyribose";
        nucl = (char_of_nucleobase new_val);
    }

let main () =
    generate_nucleotide 'A';
    generate_nucleotide 'T';
    generate_nucleotide 'X';
    ()

let () = main ()

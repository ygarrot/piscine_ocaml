(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/24 15:45:34 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/24 17:08:44 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () =
let rec draw_all deck = 
let (card, new_deck) = Deck.drawCard deck 
in print_endline (Deck.Card.toStringVerbose card); draw_all new_deck 
in let rec print_all lst = match lst with
[] -> ()
| head::tail -> print_string head; print_char '\n';print_all tail
in let deck = Deck.newDeck
in print_all (Deck.toStringListVerbose deck) ;
print_endline "~~~~~~~~~~~~~~~~~~~~~~~";
draw_all deck; 
 ()

let () = main ()

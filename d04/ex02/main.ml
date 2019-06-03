(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/24 13:09:40 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/24 14:53:22 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () =
    let rec iter_all cards =match cards with
| [] -> ()
| head::tail -> print_string (Card.toStringVerbose head);
 print_char '\n';iter_all tail

    (*print_endline (Card.toStringVerbose (Card.newCard Card.Value.T2 Card.Color.Spade));*)
    in let spade = Card.newCard Card.Value.T2 Card.Color.Spade
    in let spade2 = Card.newCard Card.Value.T2 Card.Color.Spade
    in let qspade = Card.newCard Card.Value.Queen Card.Color.Spade
    in let lst = [ spade;spade2;qspade]
    in 
    print_endline "~~~~~~~~~~~~~~~~~~~~~~~~~";
    print_int (compare spade spade2); print_char '\n';
    print_int (compare qspade spade); print_char '\n';
    print_int (compare spade qspade); print_char '\n';
    print_endline "~~~~~~~~~~~~~~~~~~~~~~~~~";
    print_endline (Card.toStringVerbose (Card.min spade qspade));
    print_endline (Card.toStringVerbose (Card.min spade spade));
    print_endline (Card.toStringVerbose (Card.max spade qspade));
    print_endline "~~~~~~~~~~~~~~~~~~~~~~~~~";
    print_endline (string_of_bool (Card.isOf spade Card.Color.Spade));
    print_endline (string_of_bool (Card.isSpade spade));
    print_endline (string_of_bool (Card.isHeart spade));
    print_endline (string_of_bool (Card.isDiamond spade));
    print_endline (string_of_bool (Card.isClub spade));
    print_endline "~~~~~~~~~~~~~~~~~~~~~~~~~";
    print_endline (Card.toStringVerbose (Card.best lst));
    print_endline "~~~~~~~~~~~~~~~~~~~~~~~~~";
    iter_all Card.all;
()

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   jokes.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/27 13:53:24 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/28 16:31:13 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let jokes = 
    let jokes_a = [| 
   "Q. How did the programmer die in the shower?\nA. He read the shampoo bottle instructions: Lather. Rinse. Repeat.";
    " Points commun entre un tsunami et un panaché ? Plus y'a d'eau, moins y'a de jaunes";
    "Knock, knock.” “Who’s there?” very long pause…. “Java.”";
    "There are 10 kinds of people in this world: those who know binary, those who don’t, and those who didn't expect this joke to be in ternary.";
    "A man is smoking a cigarette and blowing smoke rings into the air.  His girlfriend becomes irritated with the smoke and says, “Can’t you see the warning on the cigarette pack?  Smoking is hazardous to your health!”
    To which the man replies, “I am a programmer.  We don’t worry about warnings; we only worry about errors.”";
    "What's a computer's favorite beat ? \n An algo-rhythme"|]
    in Random.self_init ();
    print_endline jokes_a.(Random.int (Array.length jokes_a))

let () = jokes;

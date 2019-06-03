(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   galifrey.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/29 14:40:47 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/30 23:23:06 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


class galifrey =
object 
    val _dalek_army = Army.army [Dalek.dalek;Dalek.dalek;Dalek.dalek]
    val _doctor_army = Army.army [Doctor.doctor "The doctor 1"300;Doctor.doctor "The doctor 2";Doctor.doctor "The doctor 3"]
    val _people_army = Army.army [People.people "jacky";People.people "jacky";People.people "jacky"]
    method do_time_war = 
        let iter_number = max (List.length _dalek_army) (max (List.length _doctor_army) (List.length _people_army))
        in let do_war iter = match iter with 
        | 0 -> print_endline "The war has ended"
        | _ -> let () = Random.self_init () 
               in let choice = Random.int 3
               in let choose_attack = match choice with
                    | 0 when _dalek_army#is_alive
                        -> let dalek = choose_random _dalek_army 
                        in let victim = choose_random _people_army
                        in let fight dalek people = match (dalek, people) with
                            | ([], _) -> people#talk
                            | (_, []) -> dalek#talk
                            | (dalek, people) -> dalek#exterminate people
                        in fight dalek victim
               in choose_attack choice
        | 1 -> _doctor_army#talk
        in do_war iter_number

end

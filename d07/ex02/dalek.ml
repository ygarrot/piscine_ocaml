(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   dalek.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/29 12:50:53 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/30 20:37:51 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec set_random_name length = match length with
    | length when length > 0 ->
            let () = Random.self_init () ;
            in let random_value = Random.int 9
         in (string_of_int random_value) ^ (set_random_name (length - 1))
    | _ -> ""

class dalek =
object
    val mutable _hp:int = 100
    val mutable _shield:bool = true
    val _name:string = "dalek" ^ (set_random_name 3)

    method to_string = if _shield then "I'm " ^ _name ^ ", I have "^ string_of_int _hp ^ " hp and I have a shield"
                                   else "I'm " ^ _name ^ ", I have "^ string_of_int _hp ^ " hp and I have not a shield"
    method talk = let quotes = ["Explain! Explain!"; "Exterminate! Exterminate!"; "I obey!";
        "You are the Doctor! You are the enemy of the Daleks!"]
        in let rec choose_random_quotes quotes index = match quotes with
            | [] -> ""
            | head::tail when index = 0 -> head
            | _::tail -> choose_random_quotes tail (index - 1)
        in Random.self_init ();
       print_endline (choose_random_quotes quotes (Random.int 4))
    method set_hp hp = _hp <- hp
    method exterminate (people:People.people) = people#die; _shield <- not _shield
    method die = print_endline "Emergency Temporal Shift!"
end

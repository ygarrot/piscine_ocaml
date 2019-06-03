(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   people.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/29 10:51:01 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/30 20:30:22 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class doctor (name:string) (age:int) (sidekick:People.people) =
object
    initializer print_endline "Oh yeah, its good to feel alive [ again ]"
    val _name:string = name
    val mutable _hp:int = 100
    val mutable _age:int = age
    val _sidekick:People.people = sidekick
    method to_string = "I'm " ^ _name 
    ^ " I am " ^ string_of_int _age ^ ", years old"
    ^" and I got " ^ string_of_int _hp ^ " hp."
    ^ " This is my sidekick : " ^ _sidekick#to_string
    method talk = print_endline "Hi! I’m the Doctor!"
    method use_sonic_screwdriver = print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii"
    method set_hp hp = _hp <- hp
    method regenerate = _hp <- 100
    method travel_in_time (start:int) (arrival:int) =
print_endline "        ___
_______(_@_)_______
| POLICE      BOX |
|_________________|
 | _____ | _____ |
 | |###| | |###| |
 | |###| | |###| | 
 | _____ | _____ |
 | || || | || || |
 | ||_|| | ||_|| |
 | _____ |$_____ |
 | || || | || || |
 | ||_|| | ||_|| |
 | _____ | _____ |
 | || || | || || | 
 | ||_|| | ||_|| | 
 |       |       | 
 *****************"
    
end

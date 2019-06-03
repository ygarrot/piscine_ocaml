(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   people.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/29 10:51:01 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/29 12:46:05 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class people (name:string) =
object (self)
    initializer print_endline "Oh yeah, its good to feel alive"
    val _name:string = name
    val _hp:int = 100
    method to_string = "I'm " ^ _name ^ " and I got " ^ string_of_int _hp ^ " hp"
    method talk = print_endline ("I'm " ^ _name ^ "! Do you know the Doctor?")
    method die = print_endline "Aaaarghh!"
end

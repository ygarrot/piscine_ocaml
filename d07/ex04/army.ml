(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   army.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/29 13:53:13 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/30 23:11:29 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class ['a] army (first:'a) =
object(self)
    val mutable _member:'a list = [first]
    method add new_member = _member <- (new_member::_member)
    method is_alive = List.length _member > 0
    method choose_random = 
        let ()= Random.self_init () 
        in let random_index = Random.int (List.length _member)
        in List.nth _member random_index 
    method talk = if self#is_alive then self#talk else ()
   method print_head = match _member with
   | head::_ -> print_endline head#to_string
   | _ -> print_endline "got no head D:"
   method delete = let pop lst = match lst with
   | head::tail -> tail
   | _ -> []
   in _member <- pop _member
end

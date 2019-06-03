(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   army.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/29 13:53:13 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/30 22:43:14 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class ['a] army (first:'a) =
object
    val mutable _member:'a list = [first]
    method add new_member = _member <- (new_member::_member)
   method print_head = match _member with
   | head::_ -> print_endline head#to_string
   | _ -> print_endline "got no head D:"
   method delete = let pop lst = match lst with
   | head::tail -> tail
   | _ -> []
   in _member <- pop _member
end

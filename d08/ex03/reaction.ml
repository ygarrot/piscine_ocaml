(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   reaction.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/31 22:17:44 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/31 22:32:19 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class type reaction  =
    object 
        method is_balanced: bool
        method get_start: (Molecule.molecule * int) list
        method get_end: (Molecule.molecule * int) list
        method balance: reaction
    end


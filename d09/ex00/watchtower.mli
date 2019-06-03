(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   watchtower.mli                                     :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/31 10:13:23 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/31 11:22:00 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module Watchtower :
    sig
type hour = int
val zero : hour
val add : hour -> hour -> hour
val sub : hour -> hour -> hour
    end



(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Color.mli                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/24 11:04:19 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/24 11:05:09 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type t = Spade | Heart | Diamond | Club

val all : t list (** The list of all values of type t *)

val toString : t -> string (** "S", "H", "D" or "C" *)

val toStringVerbose : t -> string (** "Spade", "Heart", etc *)

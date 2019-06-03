(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   watchover.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/31 10:11:15 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/06/01 17:39:13 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module Watchtower = 
struct
    type hour = int

    let zero = 0

    let add hour_1 hour_2 = abs ((hour_1 + hour_2) mod 12)

    let sub hour_1 hour_2 = abs ((hour_1 - hour_2) mod 12)
end

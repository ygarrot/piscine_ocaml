(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ex00.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/28 11:28:44 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/28 11:34:49 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module StringSet = Set.Make(String)

let () =
    let set = List.fold_right StringSet.add [ "foo"; "bar"; "baz"; "qux" ] StringSet.empty in
    StringSet.iter print_endline set;
    print_endline (StringSet.fold ( ^ ) set "")

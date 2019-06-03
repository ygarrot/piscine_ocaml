(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ex01.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/28 11:37:29 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/28 12:32:14 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let strhash str =
	let rec loselose hash length = match length with
	| 0 ->hash
	| _->	loselose (hash + int_of_char str.[length]) (length + 1)
	in loselose 0 0

module HashedString =
  struct
    type t = string
    let equal = ( = )
	
    let hash = (strhash) 
  end

module StringHashtbl = Hashtbl.Make(HashedString) 

let () =
    let ht = StringHashtbl.create 5 in
    let values = [ "Hello"; "world"; "42"; "Ocaml"; "H" ] in
    let pairs = List.map (fun s -> (s, String.length s)) values in
    List.iter (fun (k,v) -> StringHashtbl.add ht k v) pairs;
    StringHashtbl.iter (fun k v -> Printf.printf "k = \"%s\", v = %d\n" k v) ht

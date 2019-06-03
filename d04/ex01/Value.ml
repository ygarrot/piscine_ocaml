(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Value.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/24 11:06:45 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/24 11:29:37 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


type t = T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | Jack | Queen | King | As

let all = [T2 ; T3 ; T4 ; T5 ; T6 ; T7 ; T8 ; T9 ; T10 ; Jack ; Queen ; King ; As]

let toInt t = match t with
| T2 -> 1
| T3 -> 2
| T4 -> 3
| T5 -> 4
| T6 -> 5
| T7 -> 6
| T8 -> 7
| T9 -> 8
| T10 -> 9
| Jack -> 10
| Queen -> 11
| King -> 12
| As -> 13

let toString t = match t with
| T2 -> "2"
| T3 -> "3"
| T4 -> "4"
| T5 -> "5"
| T6 -> "6"
| T7 -> "7"
| T8 -> "8"
| T9 -> "9"
| T10 -> "10"
| Jack -> "J"
| Queen -> "Q"
| King -> "K"
| As -> "A"

let toStringVerbose t = match t with
| T2 -> "2"
| T3 -> "3"
| T4 -> "4"
| T5 -> "5"
| T6 -> "6"
| T7 -> "7"
| T8 -> "8"
| T9 -> "9"
| T10 -> "10"
| Jack -> "Jack"
| Queen -> "Queen"
| King -> "King"
| As -> "As"

let next card = let rec find_next lst = match lst with 
| head::node::tail when head = card -> node
| head::tail -> find_next tail 
| _ -> invalid_arg  "Invalid arg"
        in find_next all

let previous card = let rec find_next lst = match lst with 
| head::node::tail when node = card -> head
| head::tail -> find_next tail 
| _ -> invalid_arg  "Invalid arg"
        in find_next all


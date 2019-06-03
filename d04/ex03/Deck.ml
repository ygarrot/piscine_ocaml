(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Deck.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/24 15:09:51 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/24 16:49:11 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module Card = 
struct 

module Color  =
struct
type t = Spade | Heart | Diamond | Club

let all = [Spade; Heart; Diamond; Club]

let toString color = match color with
    | Spade -> "S"
    | Heart -> "H"
    | Diamond -> "D"
    | Club -> "C"

let toStringVerbose color = match color with
    | Spade -> "Spade"
    | Heart -> "Heart"
    | Diamond -> "Diamond"
    | Club -> "Club"

end

module Value =
struct

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

end

type t = {
        color:Color.t;
        value:Value.t;
}

let newCard (value:Value.t) (color:Color.t) =
    {color = color; value = value}

let allSpades = [
{color = Color.Spade; value = Value.T2};
{color = Color.Spade; value = Value.T3};
{color = Color.Spade; value = Value.T4};
{color = Color.Spade; value = Value.T5};
{color = Color.Spade; value = Value.T6};
{color = Color.Spade; value = Value.T7};
{color = Color.Spade; value = Value.T8};
{color = Color.Spade; value = Value.T9};
{color = Color.Spade; value = Value.T10};
{color = Color.Spade; value = Value.Jack};
{color = Color.Spade; value = Value.Queen};
{color = Color.Spade; value = Value.King}
]

let allHearts = [
{color = Color.Heart; value = Value.T2};
{color = Color.Heart; value = Value.T3};
{color = Color.Heart; value = Value.T4};
{color = Color.Heart; value = Value.T5};
{color = Color.Heart; value = Value.T6};
{color = Color.Heart; value = Value.T7};
{color = Color.Heart; value = Value.T8};
{color = Color.Heart; value = Value.T9};
{color = Color.Heart; value = Value.T10};
{color = Color.Heart; value = Value.Jack};
{color = Color.Heart; value = Value.Queen};
{color = Color.Heart; value = Value.King}
]

let allDiamonds = [
{color = Color.Diamond; value = Value.T2};
{color = Color.Diamond; value = Value.T3};
{color = Color.Diamond; value = Value.T4};
{color = Color.Diamond; value = Value.T5};
{color = Color.Diamond; value = Value.T6};
{color = Color.Diamond; value = Value.T7};
{color = Color.Diamond; value = Value.T8};
{color = Color.Diamond; value = Value.T9};
{color = Color.Diamond; value = Value.T10};
{color = Color.Diamond; value = Value.Jack};
{color = Color.Diamond; value = Value.Queen};
{color = Color.Diamond; value = Value.King}
]

let allClubs = [
{color = Color.Club; value = Value.T2};
{color = Color.Club; value = Value.T3};
{color = Color.Club; value = Value.T4};
{color = Color.Club; value = Value.T5};
{color = Color.Club; value = Value.T6};
{color = Color.Club; value = Value.T7};
{color = Color.Club; value = Value.T8};
{color = Color.Club; value = Value.T9};
{color = Color.Club; value = Value.T10};
{color = Color.Club; value = Value.Jack};
{color = Color.Club; value = Value.Queen};
{color = Color.Club; value = Value.King}
]

let all = allSpades @ allHearts @ allDiamonds @ allClubs

let getValue card = card.value

let getColor card = card.color

let toString card = Value.toString card.value ^ Color.toString card.color

let toStringVerbose card =
 Printf.sprintf "Card(%s, %s)" (Value.toStringVerbose card.value) (Color.toStringVerbose card.color) 

let compare card1 card2 = match card1 with
| {color = _; value = value} when value < card2.value -> -1
| {color = _; value = value} when value = card2.value -> 0
| {color = _; value = value} when value > card2.value -> 1
| _ -> 0

let max card1 card2 = if card1.value >= card2.value then card1 else card2

let min card1 card2 = if card1.value <= card2.value then card1 else card2

let best cards = let rec best_match cards current = match cards with
| [] -> current
| head::tail -> best_match tail ( max head current)
in best_match cards {color = Color.Spade; value = Value.T2}

let isOf card color = match card with
| { color = card_color ; value = _} when card_color = color -> true
| _ -> false

let isSpade card = isOf card Color.Spade

let isHeart card = isOf card Color.Heart

let isDiamond card = isOf card Color.Diamond

let isClub card = isOf card Color.Club
end 

type t = Card.t list

let newDeck = 
Random.self_init ();

let shuffle d =
    let nd = List.map (fun c -> (Random.bits (), c)) d in
    let sond = List.sort compare nd in
    List.map snd sond
in shuffle Card.all

let rec toStringList deck = match deck with
[] -> []
| head::tail -> (Card.toString head)::(toStringList tail)

let rec toStringListVerbose deck = match deck with
[] -> []
| head::tail -> (Card.toStringVerbose head)::(toStringListVerbose tail)

let drawCard deck = match deck with
| [] -> raise (Failure "Deck is empty")
| head::tail -> (head, tail)

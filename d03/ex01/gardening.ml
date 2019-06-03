(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   gardening.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@"42".fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/24 17:30:53 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/24 18:03:19 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a tree = Nil | Node of 'a * 'a tree * 'a tree

let rec size tree = match tree with
| Node (node, left, right) -> 1 + (size left) + (size right)
| leaf -> 0

let rec height tree = match tree with
| Node (node, left, right) -> 1 + max (size left) (size right)
| leaf -> 0

let draw_square x y size =
   let half = size / 2 in let (x0, y0, x1, y1) = (x - half, y - half, x+half, y+half)
   in
     Graphics.moveto x0 y0; 
     Graphics.lineto x0 y1; Graphics.lineto x1 y1;  
     Graphics.lineto x1 y0; Graphics.lineto x0 y0; 
     Graphics.moveto x0 y0; ()


let draw_tree tree = 
	let size = 30 in 
let half = size / 2 
in let dec_x = 30
in let dec_y = 40 
in let draw_lines x y =
	 Graphics.moveto (x + half) y; Graphics.lineto(x + dec_x) (y + dec_y);Graphics.moveto (x + half) y ;Graphics.lineto (x + dec_x)(y - dec_y)
	in let draw_node str x y z  = 
		draw_square x y size ; Graphics.moveto (x - (size / 2)) y;  Graphics.draw_string str;
	in let rec draw tree x y  = match tree with
	| Node (node, left, right) -> draw_lines x y ; draw left (x + dec_y) (y + dec_y); draw_node node x y size ; draw right (x + dec_y) (y - dec_y)
	| leaf -> draw_node "Nil" x y size;()
	in draw tree 20 200;Graphics.moveto 20 200;()


let main () =
    print_endline (string_of_int (size (Node("42", Nil, Nil))));
    print_endline (string_of_int (height (Node ("42", Node ("42", Nil, Nil), Node ("42", Nil, Nil)))));
    print_endline (string_of_int (height (Node ("42", Node ("42", Node ("42", Nil, Nil), Nil), Node ("42", Nil, Nil)))));
    Graphics.open_graph "";
	draw_tree (Node ("42", Node ("42", Nil, Nil), Node ("42", Nil, Nil)));
Graphics.read_key ();
    ()

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   crossover.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/23 17:36:37 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/24 18:00:39 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a tree = Nil | Node of 'a * 'a tree * 'a tree

let draw_square x y size =
   let half = size / 2 in let (x0, y0, x1, y1) = (x - half, y - half, x+half, y+half)
   in
     Graphics.moveto x0 y0; 
     Graphics.lineto x0 y1; Graphics.lineto x1 y1;  
     Graphics.lineto x1 y0; Graphics.lineto x0 y0; 
     Graphics.moveto x0 y0; ()

let draw_tree_node tree = 
	let size = 30 in 
let half = size / 2 
in let dec_x = 30
in let dec_y = 40 
in let draw_lines x y =
	 Graphics.moveto (x + half) y; Graphics.lineto(x + dec_x) (y + dec_y);Graphics.moveto (x + half) y ;Graphics.lineto (x + dec_x)(y - dec_y)
	in let draw_node str x y z  = 
		draw_square x y size ; Graphics.moveto (x - (size / 2)) y;  Graphics.draw_string str;
	in let rec draw tree x y  = match tree with
	| Node (node, left, right) -> draw_lines x y ; draw Nil (x + dec_y) (y + dec_y); draw_node (string_of_int node) x y size ; draw Nil (x + dec_y) (y - dec_y)
	| leaf -> draw_node ("Nil") x y size;()
	in draw tree 20 200;Graphics.moveto 20 200;()

let main () = 
    Graphics.open_graph "";
	draw_tree_node (Node (42, Node (42, Nil, Nil), Node (42, Nil, Nil)));
	Graphics.read_key ();()


let () = main ()

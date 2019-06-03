(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/25 19:04:16 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/26 21:06:38 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () =
    let grid = Game.Grid.newGrid [3;3] 0 0 0

    in 
    print_endline (Game.Grid.toString grid 2);
    Game.Grid.setEndGrid grid Game.Player.Circle;

()

let () = main ()

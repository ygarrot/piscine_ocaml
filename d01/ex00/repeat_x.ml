(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   repeat_x.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/21 10:19:30 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/21 10:26:48 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec repeat_x count =
    if count < 0 then "Error"
    else begin if count = 0 then ""
    else "x" ^ (repeat_x (count - 1)) end

let main () = 
    print_endline (repeat_x 1);
 print_endline (repeat_x 0);
 print_endline (repeat_x (-1));
 print_endline (repeat_x 3)

let () = main ()

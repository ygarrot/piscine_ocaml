(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   repeat_string.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/21 10:28:28 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/21 10:41:45 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec repeat_string ?(str="") n =
    if n < 0 then "Error"
    else begin if n = 0 then ""
    else str ^ repeat_string ~str ( n - 1 ) end


let main () = 
    print_endline (repeat_string 2);
    print_endline (repeat_string ~str:"toto" 2);
    print_endline (repeat_string ~str:"a" 3);
    print_endline (repeat_string ~str:"ze" ( -1 ) )

let () = main ()

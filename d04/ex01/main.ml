(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/24 11:26:11 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/24 12:09:35 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () =
    let rec print_all lst = match lst with
    |[] -> ()
    |head::tail ->
    if head <> Value.T2 then  print_string (Value.toStringVerbose (Value.previous head));
    print_char ' ';
    if head <> Value.As then print_string (Value.toStringVerbose (Value.next head));
    print_char ' ';
     print_endline (Value.toStringVerbose head);
    print_all tail
    in print_all Value.all

let () = main ()

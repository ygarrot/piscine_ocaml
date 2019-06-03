(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   micronap.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/27 12:04:20 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/27 12:41:54 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


let main () =
    let sleep_loop n = for i = 0 to n do
        let my_sleep = Unix.sleep 1 in
        my_sleep
    done;
    in let check_arg argc = match argc with
    | x when x > 1 -> sleep_loop (int_of_string Sys.argv.(1))
    | _ -> ()
    in check_arg (Array.length Sys.argv)

let () = main ()

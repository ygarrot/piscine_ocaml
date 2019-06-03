(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   eu_dist.ml                                         :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/27 16:19:56 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/28 22:16:24 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let eu_dist a b = 
    let sum = ref 0.0
    in let size = min (Array.length a) (Array.length b)
    in for i = 0 to size - 1 do
        let tmp = a.(i) -. b.(i)
        in  sum := !sum +. (tmp *. tmp)
    done;
    sqrt !sum

let main () = 
    let a = [|4.1;2.2|]
    in let b = [|1.1;2.2;3.3|]
    in print_endline (string_of_float (eu_dist a b));
    ()

let () = main ()

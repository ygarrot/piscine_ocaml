(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   iter.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/21 12:31:07 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/21 12:40:21 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec iter f x n = 
    if n < 0 then -1
    else begin if n = 0 then x
    else begin if n = 1 then f x
    else iter f (f x) ( n - 1 ) end
    end

let main () =
    print_int ( iter (fun x -> x * x) 2 4 );
    print_char '\n';
    print_int ( iter (fun x -> x * 2) 2 4 );
    print_char '\n'

let () = main ()

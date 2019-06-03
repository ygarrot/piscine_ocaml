(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   converges.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/21 12:41:05 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/22 09:54:02 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec converges f x n =
    if n < 0 then false 
    else begin if x = ( f x ) then true
    else converges f (f x) ( n - 1 ) end
    
let main () =
    print_endline (string_of_bool ( converges (( * ) 2) 2 5 ));
    print_endline ( string_of_bool ( converges (fun x -> x / 2) 2 3 ));
    print_endline (string_of_bool ( converges (fun x -> x / 2) 2 2 ))

let () = main ()

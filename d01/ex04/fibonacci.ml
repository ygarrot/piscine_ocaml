(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   fibonacci.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/21 11:55:54 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/21 12:16:30 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec fibonacci n =
    if n < 0 then -1
    else let rec fib_aux x =
         if x < 2 then x 
         else fib_aux ( x - 2 )  + fib_aux ( x - 1 )
     in
    fib_aux n

let main () =
    print_int (fibonacci ( -42 ));
    print_char '\n';
    print_int (fibonacci 1);
    print_char '\n';
    print_int (fibonacci 3);
    print_char '\n';
    print_int (fibonacci 6);
    print_char '\n'

let () = main ()

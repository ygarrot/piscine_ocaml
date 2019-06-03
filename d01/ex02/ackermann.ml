(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ackermann.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/21 10:42:57 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/22 17:34:49 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ackermann m n =
    if m < 0 || n < 0 then -1
    else begin if m = 0 then n + 1
    else begin if m > 0 && n = 0 then ackermann ( m - 1 ) 1
    else ackermann ( m - 1 ) ( ackermann m ( n - 1 ) ) end
    end
        

let main () =
    print_int (ackermann ( -1 ) 3);
    print_char '\n';
    print_int (ackermann 0 0);
    print_char '\n';
    print_int (ackermann 2 3);
    print_char '\n';
    print_int (ackermann 4 1);
    print_char '\n'

let () = main ()

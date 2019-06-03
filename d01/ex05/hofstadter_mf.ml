(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   hofstadter_mf.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/21 12:18:25 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/25 16:16:09 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec hfs_f n = 
    if n < 0 then -1
    else begin if n = 0 then 1
    else n - hfs_m ( hfs_f ( n - 1 ) ) end

and hfs_m n =
    if n < 0 then -1
    else begin if n = 0 then 0
    else n - hfs_f ( hfs_m ( n - 1 ) ) end

let main () =
    print_int ( hfs_m 0 );
    print_char '\n';
    print_int ( hfs_f 0 );
    print_char '\n';
    print_int ( hfs_m 4 );
    print_char '\n';
    print_int ( hfs_f 4 );
    print_char '\n'

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_rev.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/20 12:27:03 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/21 16:04:44 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_rev str = 
    let rec loop length =
        if length > ( -1 )
        then begin
            print_char (String.get str length);
            loop (length - 1)
        end
    in 
    loop (String.length(str) - 1);
    print_char '\n'


let main () = 
    ft_print_rev "";
    ft_print_rev "test"

let () = main ()

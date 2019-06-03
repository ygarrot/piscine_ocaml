(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_countdown.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/20 10:15:04 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/21 16:51:19 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ft_countdown count =
    if count <= 0 then print_endline "0"
    else begin
        print_int count;
        print_char '\n';
        ft_countdown (count - 1)
    end


let main () =
    ft_countdown 3;
    ft_countdown ( -1 );
    ft_countdown 0


let () = main ()

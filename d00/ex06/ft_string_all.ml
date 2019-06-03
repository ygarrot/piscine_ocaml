(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_string_all.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/20 12:59:16 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/21 15:07:02 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_string_all f str =
    if String.length str <= 0
        then false
        else begin
            let rec loop length =
                if (length >= 0)
                then begin if f (String.get str length)
                        then loop (length - 1)
                        else false
                end
                else true
            in
            loop (String.length str - 1)
        end


let is_digit c = c >= '0' && c <= '9'

let print_bool b =
    let result = if b then "true" else "false" in
    print_endline result 

let main () =
    print_bool (ft_string_all is_digit "023");
    print_bool (ft_string_all is_digit "e23");
    print_bool (ft_string_all is_digit "");
    print_bool (ft_string_all is_digit "0123456789");
    print_bool (ft_string_all is_digit "O12EAS67B9")

let () = main () 

(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_is_palindrom.ml                                 :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/20 14:33:25 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/20 14:57:38 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_is_palindrom str =
    let total_length = (String.length str) - 1 in
    if total_length <= 0
    then true
        else
            begin
        let rec check_half length =
            if ((total_length mod 2 = 0) && (length = total_length / 2))
                 || ((total_length mod 2 = 1) && length = (total_length / 2) + 1)
            then true 
            else
                begin 
                    if String.get str length <> String.get str (total_length - length)
                        then false
                        else check_half (length + 1)
                end
        in
        check_half 0
    end



let print_bool b =
    let result = if b then "true" else "false" in
    print_endline result 


let main () =
    print_bool (ft_is_palindrom "a");
    print_bool (ft_is_palindrom "");
    print_bool (ft_is_palindrom "madam");
    print_bool (ft_is_palindrom "madem")


let () = main()

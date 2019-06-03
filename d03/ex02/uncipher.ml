(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   uncipher.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/24 18:33:07 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/24 20:54:30 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let islower c = c >= 'a' && c <= 'z'
let isupper c = c >= 'A' && c <= 'Z'
let is_alpha c = islower c || isupper c
let is_print c = c >= '!' && c <=  '~'
let as_printable p n = let c = int_of_char p in let as_print = match c with
| c when islower p && islower (char_of_int(c + n)) -> char_of_int(c + n)
| c when islower p -> char_of_int (int_of_char 'a' + ((c + n) mod 26))
| c when isupper p && isupper (char_of_int(c + n)) -> char_of_int(c + n)
| c when isupper p -> char_of_int (int_of_char 'A' + ((c + n) mod 26))
| _-> char_of_int(c + n)
in as_print


let unrot42 str = 
    String.map (fun x -> as_printable x 42) str

let uncaesar str n = 
    let swap_char c =
        as_printable c n
    in
    String.map swap_char str

let main () = 
    print_endline (unrot42 "test");
    print_endline (uncaesar "test" 100);
    ()

let () = main ()

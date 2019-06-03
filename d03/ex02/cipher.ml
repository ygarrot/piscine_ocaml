(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   cipher.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/24 18:33:09 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/24 22:15:48 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let islower c = c >= 'a' && c <= 'z'
let isupper c = c >= 'A' && c <= 'Z'
let is_alpha c = islower c || isupper c
let is_print c = c >= '!' && c <=  '~'
let unas_printable p n = let c = int_of_char p in let as_print = match c with
| c when n - c > 97 && islower p && islower (char_of_int(c - n)) -> char_of_int(c - n)
| c when islower p -> char_of_int (97 + (26 + (c - 97) + n) mod 26)
| c when n - c > 65 && isupper p && isupper (char_of_int(c - n)) -> char_of_int(c - n)
| c when isupper p -> char_of_int (65 + (26 + (c - 65) + n) mod 26)
| _-> char_of_int(c - n mod 26)
in as_print

let as_printable p n = let c = int_of_char p in let as_print = match c with
| c when islower p && islower (char_of_int(c + n)) -> char_of_int(c + n)
| c when islower p -> char_of_int (int_of_char 'a' + (((c - 97) + n) mod 26))
| c when isupper p && isupper (char_of_int(c + n)) -> char_of_int(c + n)
| c when isupper p -> char_of_int ( int_of_char 'A' + (((c - 65) + n) mod 26))
| _-> char_of_int(c + n)
in as_print

(*let as_printable p n = let c = int_of_char p in
    if is_print (char_of_int(c + n)) then char_of_int (c + n)
                        else char_of_int (int_of_char '!' + ((c + n) mod (int_of_char '~')))
*)
let rot42 str = 
    String.map (fun x -> as_printable x 42) str

let uncaesar n str= 
    let swap_char c =
        unas_printable c (n)
    in
    String.map swap_char str


let caesar n str= 
    let swap_char c =
        as_printable c n
    in
    String.map swap_char str

let xor str key = String.map (fun x -> as_printable (char_of_int (int_of_char x lxor key)) 0) str

let rec ft_crypt str f_list = match f_list with 
| [] -> str
| head::tail -> ft_crypt (head str) tail

let main () = 
    print_endline (rot42 "test");
    print_endline ( (caesar 100 "test"));
    print_endline (uncaesar 100 (caesar 100 "test"));
    print_endline (xor "test" 42);
    print_endline (xor (xor "test" 100) 100);
    print_endline (ft_crypt "test" [rot42;rot42;(caesar 12)]);
    ()

let () = main ()

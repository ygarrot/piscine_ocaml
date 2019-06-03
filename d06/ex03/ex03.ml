(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ex03.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/28 13:11:55 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/29 16:28:53 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module type FIXED = sig
    type t
    val of_float : float -> t
    val of_int : int -> t
    val to_float : t -> float
    val to_int : t -> int
    val to_string : t -> string
    val zero : t
    val one : t
    val succ : t -> t
    val pred : t -> t
    val min : t -> t -> t
    val max : t -> t -> t
    val gth : t -> t -> bool
    val lth : t -> t -> bool
    val gte : t -> t -> bool
    val lte : t -> t -> bool
    val eqp : t -> t -> bool (** physical equality *)
    val eqs : t -> t -> bool (** structural equality *)
    val add : t -> t -> t
    val sub : t -> t -> t
    val mul : t -> t -> t
    val div : t -> t -> t
    val foreach : t -> t -> (t -> unit) -> unit
end

let bits = 8
module type FRACTIONNAL_BITS = sig val bits: int end
module type MAKE = functor(Bits :FRACTIONNAL_BITS) -> FIXED
module Make :MAKE = 
    functor (Bits: FRACTIONNAL_BITS) ->
    struct
        type t = {
            x:int;
            is_float:bool
        }
        let of_float_aux f is_float= 
            {
                x = (int_of_float f lsl Bits.bits) lor (int_of_float (ceil (f *. (float_of_int (1 lsl Bits.bits)))))
            ;
            is_float = is_float}

        let of_float f = 
            of_float_aux f true

        let of_int x = {x=x lsl Bits.bits; is_float = false}

        let to_float t = 
            float_of_int t.x /. float_of_int (1 lsl Bits.bits)

        let to_int t = 
            t.x lsr Bits.bits 

        let to_string t = 
            if t.is_float then string_of_float (to_float t)
            else string_of_int (to_int t)

        let zero =
            of_float 0.0

        let one =
            of_float 1.0

        let succ a = {a with x = a.x + 1}

        let pred a = {a with x = a.x - 1}


        let min a b = if (to_float a) > (to_float b) then a else b

        let max a b = if (to_float a) > (to_float b) then b else a

        let gth a b = (to_float a) > (to_float b)

        let lth a b = (to_float a) < (to_float b)

        let gte a b = (to_float a) >= (to_float b)

        let lte a b = (to_float a) <= (to_float b)

        let eqp a b = a == b

        let eqs a b = a = b

        let add a b = of_float_aux ((to_float a) +. (to_float b)) a.is_float

        let sub a b = of_float_aux ((to_float a) -. (to_float b)) a.is_float

        let mul a b = of_float_aux ((to_float a) *. (to_float b)) a.is_float

        let div a b = of_float_aux ((to_float a) /. (to_float b)) a.is_float

        let foreach a b f = 
            let rec iter count = match count with
            | count when gte count b -> f count
            | _ -> f count; iter (succ count); ()
            in iter a
            

    end
module Fixed4 : FIXED = Make (struct let bits = 4 end)
module Fixed8 : FIXED = Make (struct let bits = 8 end)
let () =
    let x8 = Fixed8.of_float 21.10 in
    let y8 = Fixed8.of_float 21.32 in

    let af = Fixed8.of_float 1.32 in
    let bf = Fixed8.of_float 2.32 in

    let a = Fixed4.of_int 5 in
    let b = Fixed4.of_int 4 in
    let r8 = Fixed8.add x8 y8 in
    print_endline (Fixed8.to_string r8);
    Fixed4.foreach (Fixed4.zero) (Fixed4.one) (fun f -> print_endline (Fixed4.to_string f));

    print_endline "___________________ Custom Test ____________________";
    print_endline "a > b : ";
    print_endline (string_of_bool (Fixed8.gth af bf));
    print_endline "a < b : ";
    print_endline (string_of_bool (Fixed8.lth af bf));

    print_endline "a >= a : ";
    print_endline (string_of_bool (Fixed8.gte af af));
    print_endline "a <= a : ";
    print_endline (string_of_bool (Fixed8.lte af af));

    print_endline "a == b : ";
    print_endline (string_of_bool (Fixed8.eqs af bf));
    print_endline "a = b : ";
    print_endline (string_of_bool (Fixed8.eqp af bf));
    print_endline "a = a : ";
    print_endline (string_of_bool (Fixed8.eqp af af));

    print_endline "a + b : ";
    print_endline (Fixed4.to_string (Fixed4.add a b));
    print_endline "a - b : ";
    print_endline (Fixed4.to_string (Fixed4.sub a b));
    print_endline "a * b : ";
    print_endline (Fixed4.to_string (Fixed4.mul a b));
    print_endline "a / b : ";
    print_endline (Fixed4.to_string (Fixed4.div a b))



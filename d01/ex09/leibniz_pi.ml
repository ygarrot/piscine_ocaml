(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   leibniz_pi.ml                                      :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/21 14:05:23 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/21 15:01:54 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let leibniz_pi delta =
    if delta < 0.0 then -1
    else begin
        let ref = 4.0 *. (4.0 *. (atan 1.0)) in
        let rec loop sigma n =
            let i = float_of_int n in
                if ((4.0 *. sigma) -. ref) = delta then n
                else loop (sigma +. ( ((-1.0) *. i) /. (2.0 *. i +. 1.0) )) (n + 1)
    in loop 0.0 0
    end

let main () =
    print_int (leibniz_pi (4.14));
    print_char '\n'

let () = main ()

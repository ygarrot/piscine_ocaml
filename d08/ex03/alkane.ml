(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   alkane.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/31 18:37:45 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/31 21:58:12 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let generate n = match n with
            | n when n < 0 || n > 12 -> invalid_arg "give me an arg between 0 and 12 ty"
            | _ -> ((List.init n (fun x -> if x >= 0 then new Atom.carbon else invalid_arg "carbon"))@(
                List.init ((2 * n ) + 2) (fun x-> if x >= 0 then new Atom.hydrogen else invalid_arg "hydrogen")))

class alkane (name:string) (n:int) =
    object 
        inherit Molecule.molecule name (generate n) as ml
    end 
    
class methane =
object 
    inherit alkane "methane" 1
end

class ethane =
object 
    inherit alkane "ethane" 2
end

class octane =
object 
    inherit alkane "octane" 8
end

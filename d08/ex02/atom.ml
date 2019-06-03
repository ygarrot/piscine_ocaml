(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   atom.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/30 11:40:18 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/30 20:25:16 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual atom  (n_name:string) (n_symbol:string) (n_atomic_number:int)=
object (self)
    method name:string = n_name
    method symbol:string = n_symbol
    method atomic_number:int = n_atomic_number
    method to_string : string = n_name ^ " " ^ n_symbol ^ " " ^ (string_of_int n_atomic_number)
    method equal (atom:atom) = 
    atom#name = self#name && atom#symbol = self#symbol && atom#atomic_number = self#atomic_number
end

class hydrogen =
object
   inherit atom "hydrogen" "H" 1
end

class carbon =
object
   inherit atom "carbon" "C" 6
end

class oxygen =
object
   inherit atom "oxygen" "O" 8
end

class nitrogen =
object
   inherit atom "nitrogen" "N" 7
end

class helium =
object
   inherit atom "helium" "He" 2
end

class sulfur =
object
   inherit atom "sulfur" "S" 16
end

class iodine =
object
   inherit atom "iodine" "I" 16
end

class phosphorus =
object
   inherit atom "phosphorus" "P" 16
end

class aluminium =
object
   inherit atom "aluminium" "AL" 13
end



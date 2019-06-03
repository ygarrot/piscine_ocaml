(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/31 12:19:38 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/06/01 18:50:45 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


(*module APP :
    sig
        type project = string * string * int
        val zero : project
        val combine : project -> project -> project
        val fail : project -> project
        val success : project -> project
    end
*)

module App =
    struct
    type project = string * string * int
    let zero = ("", "", 0)
    let combine (project_1:project) (project_2:project) =
        let (str_1, status_1, grade_1) = project_1
        in let (str_2, status_2, grade_2) = project_2
        in let conc_str = str_1 ^ str_2
        in match (grade_1 + grade_2) / 2 with
            | x when x > 80 -> (conc_str, "success", x)
            | x -> (conc_str, "failure", x)

    let fail = ("", "failed", 0)
    let success = ("", "success", 80)

    end

let print_proj project =
    let (str, status, grade) = project in 
    print_endline (str ^ " " ^ status ^ " " ^ (string_of_int grade))

let () =
    print_proj App.zero;
    print_proj App.fail;
    print_proj App.success;
    print_proj (App.combine ("bla", "success", 0) ("bla", "success", 0));
    print_proj (App.combine ("bla", "failure", 0) ("bla", "success", 162))


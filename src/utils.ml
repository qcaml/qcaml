let strbin_of_int n =
  match n with
  | 0 -> "0"
  | _ ->
    let result = ref "" in
    let temp = ref n in
    while !temp > 0 do
      result := string_of_int (!temp mod 2) ^ !result;
      temp := !temp / 2
    done;
    !result

      

-module(diamonds).

-compile(export_all).

diamonds(C) ->
    Map = #{"A" => 1, "B" => 2, "C" => 3, "D" => 4,
	    "E" => 5, "F" => 6, "G" => 7, "H" => 8, "I" => 9,
	    "J" => 10, "K" => 11, "L" => 12, "M" => 13, "N" => 14,
	    "O" => 15, "P" => 16, "Q" => 17, "R" => 18, "S" => 19,
	    "T" => 20, "U" => 21, "V" => 22, "W" => 23, "X" => 24,
	    "Y" => 25, "Z" => 26},
    Limit = maps:get(C, Map),
    Pred = fun (K, V) -> V =< Limit end,
    Map2 = maps:filter(Pred, Map),
    maps:fold(fun (K, V, ok) ->
		      row(K, V, V), io:format("~n")
	      end,
	      ok, Map2),
    List = lists:droplast(maps:to_list(Map2)),
    ReverseL = lists:reverse(List),
    lists:foldl(fun ({K, V}, Limit) ->
			row(K, V, V), io:format("~n")
		end,
		0, ReverseL).

row(K, V, Acc) when Acc == 0 -> io:format("~c", K);
row(K, V, Acc) when Acc == V andalso V /= 1 ->
    io:format("~c", K), row(K, V, Acc - 1);
row(K, V, Acc) when Acc < V orelse V == 1 ->
    io:format("~s", [" "]), row(K, V, Acc - 1).

printSpaces(Acc) when Acc == 0 -> Acc;
printSpaces(Acc) ->
    io:format("~s", [" "]), printSpaces(Acc - 1).

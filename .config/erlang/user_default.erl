-module(user_default).

-export([cls/0, cmd/1]).

cmd(Cmd) -> io:format("~s~n", [os:cmd(Cmd)]).

cls() ->
    io:format("\ec").

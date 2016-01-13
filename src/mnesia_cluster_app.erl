%%%-------------------------------------------------------------------
%% @doc mnesia_loader public API
%% @end
%%%-------------------------------------------------------------------

-module('mnesia_cluster_app').

-behaviour(application).

%% Application callbacks
-export([start/2
        ,stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    case mnesia_cluster:start() of
        ok ->
            mnesia_cluster_sup:start_link();
        E ->
            E
    end.

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================

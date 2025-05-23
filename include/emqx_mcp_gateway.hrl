-define(MCP_VERSION, <<"2024-11-05">>).
-define(INIT_TIMEOUT, 5_000).
-define(RPC_TIMEOUT, 5_000).
-define(MCP_SERVER_ID(NAME),
    fun(N) ->
        HEX = binary:encode_hex(N),
        <<"$mcp-gateway:", HEX/binary>>
    end(
        NAME
    )
).
-define(MCP_RPC_REQ(RPC),
    RPC =:= send_ping;
    RPC =:= send_progress_notification;
    RPC =:= set_logging_level;
    RPC =:= list_resources;
    RPC =:= list_resource_templates;
    RPC =:= read_resource;
    RPC =:= subscribe_resource;
    RPC =:= unsubscribe_resource;
    RPC =:= call_tool;
    RPC =:= list_prompts;
    RPC =:= get_prompt;
    RPC =:= complete;
    RPC =:= list_tools;
    RPC =:= send_roots_list_changed
).

-define(TAG, "MCP_GATEWAY").

-define(PLUGIN_NAME, "emqx_mcp_gateway").
-define(PLUGIN_VSN, "0.0.1").
-define(PLUGIN_NAME_VSN, <<?PLUGIN_NAME, "-", ?PLUGIN_VSN>>).

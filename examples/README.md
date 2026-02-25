# Examples

Each subdirectory is a self-contained Pony program demonstrating a different part of the mare library. Ordered from simplest to most involved.

## [echo](echo/)

A WebSocket echo server that echoes back text and binary messages. Listens on `ws://localhost:8080`. Connect with any WebSocket client (e.g., `websocat ws://localhost:8080`) and send messages to see them echoed back. Start here if you're new to the library.

## [request-filter](request-filter/)

A WebSocket server that filters connections by URI path and Origin header. Demonstrates `on_upgrade_request()` to accept or reject connections before the handshake completes — only connections to `/ws` from origin `http://localhost` are accepted, all others receive 403 Forbidden. Connect with `websocat -H "Origin: http://localhost" ws://localhost:8081/ws`.

## [close-codes](close-codes/)

A WebSocket server that demonstrates server-initiated close and close status handling. Send "goodbye" to trigger a normal close (1000), "kick" to trigger a policy violation close (1008), or any other message to echo it back. The `on_closed` callback matches on `CloseStatus` variants (`CloseCode`, `CloseNoStatusReceived`, `CloseAbnormalClosure`, `OtherCloseCode`) to log how the connection closed. Connect with `websocat ws://localhost:8082`.

## [chat](chat/)

A multi-client chat server that broadcasts messages to all connected clients. Demonstrates inter-actor communication: `ChatHandler` actors register with `ChatListener`, which maintains a set of connected handlers and broadcasts incoming messages to all others. Connect multiple clients with `websocat ws://localhost:8083`.

## [wss](wss/)

A secure WebSocket (WSS) echo server using TLS with self-signed certificates. Demonstrates `WebSocketServer.ssl` for TLS support: creating an `SSLContext`, loading certificate and key files, and passing the context through the listener to each handler. Must be run from the project root so the relative certificate paths resolve correctly. Connect with `websocat -k wss://localhost:8443`.

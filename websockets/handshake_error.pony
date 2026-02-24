// Errors that can occur during WebSocket HTTP upgrade handshake validation.
type HandshakeError is
  ( HandshakeRequestTooLarge
  | HandshakeInvalidHTTP
  | HandshakeMissingHost
  | HandshakeMissingUpgrade
  | HandshakeWrongVersion
  | HandshakeMissingKey )

primitive HandshakeRequestTooLarge is Stringable
  """The HTTP upgrade request exceeded the maximum allowed size."""
  fun string(): String iso^ =>
    "Handshake request too large".clone()

primitive HandshakeInvalidHTTP is Stringable
  """The HTTP request line was malformed or not a GET request."""
  fun string(): String iso^ =>
    "Invalid HTTP request".clone()

primitive HandshakeMissingHost is Stringable
  """The required Host header was missing."""
  fun string(): String iso^ =>
    "Missing Host header".clone()

primitive HandshakeMissingUpgrade is Stringable
  """
  The required Upgrade and Connection headers were missing or had
  incorrect values.
  """
  fun string(): String iso^ =>
    "Missing or invalid Upgrade/Connection headers".clone()

primitive HandshakeWrongVersion is Stringable
  """The Sec-WebSocket-Version header was not 13."""
  fun string(): String iso^ =>
    "Wrong WebSocket version (expected 13)".clone()

primitive HandshakeMissingKey is Stringable
  """The Sec-WebSocket-Key header was missing."""
  fun string(): String iso^ =>
    "Missing Sec-WebSocket-Key header".clone()

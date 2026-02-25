// CloseStatus covers all close status codes that can be reported to the
// application via the on_closed() callback. This is a superset of CloseCode
// (the send API type) — it adds indicator codes (1005, 1006) and
// OtherCloseCode for valid codes without named primitives.
type CloseStatus is
  ( CloseCode
  | CloseNoStatusReceived
  | CloseAbnormalClosure
  | OtherCloseCode )

primitive CloseNoStatusReceived is Stringable
  """
  No status received (1005).

  Indicates the close frame had no payload. This is an indicator code that
  must never appear on the wire — it exists only for the application callback.
  """
  fun code(): U16 => 1005
  fun string(): String iso^ => "1005 No Status Received".clone()

primitive CloseAbnormalClosure is Stringable
  """
  Abnormal closure (1006).

  Indicates the TCP connection dropped without a close handshake. This is an
  indicator code that must never appear on the wire — it exists only for the
  application callback.
  """
  fun code(): U16 => 1006
  fun string(): String iso^ => "1006 Abnormal Closure".clone()

class val OtherCloseCode is Stringable
  """
  A valid close status code without a named primitive.

  Covers application-defined codes (3000-4999), IANA-registered codes without
  named primitives (1010, 1012-1014), and any future additions to the
  standard range. The raw code is preserved for application inspection.
  """
  let _code: U16

  new val create(code': U16) =>
    _code = code'

  fun code(): U16 => _code

  fun string(): String iso^ =>
    (_code.string() + " Other").clone()

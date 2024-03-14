import gleam/io
import gleam/bytes_builder
import gleam/bit_array
// import gleam/string
import gleam/result
import glisten/tcp
import glisten/socket

// import glisten/socket/options.{ActiveMode, Passive}

/// Handle incoming connections to the server
pub fn handle_connection(socket: socket.Socket) {
  let msg =
    tcp.receive(socket, 0)
    |> result.unwrap(bit_array.from_string(""))
    |> bit_array.to_string()
    |> result.unwrap("")

  io.debug(msg)

  // let response = route(msg)
  let response = "HTTP/1.1 200 OK\r\n\r\nHello, World!"

  let result = send_response(socket, response)

  io.debug(result)
}

/// Send an HTTP response to the client
pub fn send_response(socket: socket.Socket, response: String) {
  let response_bits = bit_array.from_string(response)
  let response_bytes = bytes_builder.from_bit_array(response_bits)

  tcp.send(socket, response_bytes)
}

pub fn route(route: String) -> String {
  io.debug(route)
}

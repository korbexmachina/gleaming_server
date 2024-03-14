import gleam/io
// import gleam/http
import gleam/result
import glisten/tcp
import glisten/socket
import glisten/socket/options.{ActiveMode, Passive}

/// Entry point for the program
pub fn main() {
  // Print a message to the console
  io.println("Starting server...")

  // Bind to the port
  use listener <- result.then(tcp.listen(8080, [ActiveMode(Passive)]))
  use socket <- result.then(tcp.accept(listener))
  handle_connection(socket)
}

fn handle_connection(socket: socket.Socket) {
  use msg <- result.then(tcp.receive(socket, 0))
  io.debug(#("Received message: ", msg))
  Ok(Nil)
}

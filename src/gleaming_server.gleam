import gleam/io
// import gleam/http
import gleam/result
import glisten/tcp
// import glisten/socket
import glisten/socket/options.{ActiveMode, Passive}
import gleaming_server/internal

/// Entry point for the program
pub fn main() {
  // Print a message to the console
  io.println("Starting server...")

  // Bind to the port
  use listener <- result.then(tcp.listen(8080, [ActiveMode(Passive)]))
  use socket <- result.then(tcp.accept(listener))
  let _ = internal.handle_connection(socket)
}

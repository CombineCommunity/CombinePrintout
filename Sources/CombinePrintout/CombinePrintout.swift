import Combine

class PrintCancellable: Cancellable {
  let wrapped: AnyCancellable
  let id: String
  
  init(_ wrapped: AnyCancellable, id: String? = nil) {
    self.wrapped = wrapped
    self.id = id ?? ""
    Swift.print("Cancellable: init \(self.id)")
  }
  
  func cancel() {
    wrapped.cancel()
    Swift.print("Cancellable: cancel \(id)")
  }

  deinit {
    Swift.print("Cancellable: deinit \(id)")
  }
}

extension Cancellable {

  /// A debugging `Cancellable` wrapper that prints out `Cancellable` life cycle events.
  /// - Parameter id: An optional identifier to print along the output.
  public func printCancellable(id: String? = nil) -> AnyCancellable {
    return AnyCancellable(PrintCancellable(AnyCancellable(self), id: id))
  }
}

extension Publisher {

  /// A debugging sink that prints all received events.
  /// - Parameter id: An optional identifier to print along the output.
  public func printSink(id: String = "") -> AnyCancellable {
    return sink(receiveCompletion: { Swift.print("Sink: \($0) \(id)") },
                receiveValue: { Swift.print("Sink: output(\($0)) \(id)") })
  }
}

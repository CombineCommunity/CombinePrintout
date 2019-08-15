![Combine Printout Logo](https://github.com/combineopensource/CombinePrintout/raw/master/Assets/combine-printout.png)

A Combine micro debugging framework. It helps you log subscription events to the console so you can track their life cycle.

## Usage

#### A debugging print sink

The built-in `print()` operator is useful but you still need to add a subscriber to your subscription. `printSink()` is a subscriber that you can use to debug a subscription without the need to add a separate subscriber like so:

```swift
Just(["One", "Two"])
  .printSink()
```

`printSink()` will subscribe the publisher and log all events like so:

```none
Sink: output(["One", "Two"]) 
Sink: finished
```

#### A debugging print cancellable

If you're building more complex memory management logic or not sure when are your cancellables released you can use `printCancellable()` to log a given `Cancellable`'s life cycle like so:

```swift
Just(["One", "Two"])
  .assign(to: \.model, on: self)
  .printCancellable()
  .store(in: &subscriptions)
```

`printCancellable()` wraps the `AnyCancellable` returned from `assign(to:on:)` and logs all the received events:

```none
Cancellable: init 
... 
(self.subscriptions is released from memory)
...
Cancellable: cancel 
Cancellable: deinit 
```

## Installation

### Swift Package Manager

Add the following dependency to your **Package.swift** file:

```swift
.package(url: "https://github.com/combineopensource/CombinePrintout, from: "0.2")
```
## License

CombineOpenSource is available under the MIT license. See the LICENSE file for more info.


## Credit

Copyright (c) 2019 Combine Open Source
Created by: Marin Todorov

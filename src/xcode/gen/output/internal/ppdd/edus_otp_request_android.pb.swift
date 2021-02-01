// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: internal/ppdd/edus_otp_request_android.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

/// This file is auto-generated, DO NOT make any changes here

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct SAP_Internal_Ppdd_EDUSOneTimePasswordRequestAndroid {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var authentication: SAP_Internal_Ppdd_PPACAndroid {
    get {return _authentication ?? SAP_Internal_Ppdd_PPACAndroid()}
    set {_authentication = newValue}
  }
  /// Returns true if `authentication` has been explicitly set.
  var hasAuthentication: Bool {return self._authentication != nil}
  /// Clears the value of `authentication`. Subsequent reads from it will return its default value.
  mutating func clearAuthentication() {self._authentication = nil}

  var payload: SAP_Internal_Ppdd_EDUSOneTimePassword {
    get {return _payload ?? SAP_Internal_Ppdd_EDUSOneTimePassword()}
    set {_payload = newValue}
  }
  /// Returns true if `payload` has been explicitly set.
  var hasPayload: Bool {return self._payload != nil}
  /// Clears the value of `payload`. Subsequent reads from it will return its default value.
  mutating func clearPayload() {self._payload = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _authentication: SAP_Internal_Ppdd_PPACAndroid? = nil
  fileprivate var _payload: SAP_Internal_Ppdd_EDUSOneTimePassword? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "SAP.internal.ppdd"

extension SAP_Internal_Ppdd_EDUSOneTimePasswordRequestAndroid: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".EDUSOneTimePasswordRequestAndroid"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "authentication"),
    2: .same(proto: "payload"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._authentication) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._payload) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._authentication {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if let v = self._payload {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_Ppdd_EDUSOneTimePasswordRequestAndroid, rhs: SAP_Internal_Ppdd_EDUSOneTimePasswordRequestAndroid) -> Bool {
    if lhs._authentication != rhs._authentication {return false}
    if lhs._payload != rhs._payload {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

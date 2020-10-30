// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: internal/app_version_config.proto
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

struct SAP_Internal_ApplicationVersionConfiguration {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var ios: SAP_Internal_ApplicationVersionInfo {
    get {return _ios ?? SAP_Internal_ApplicationVersionInfo()}
    set {_ios = newValue}
  }
  /// Returns true if `ios` has been explicitly set.
  var hasIos: Bool {return self._ios != nil}
  /// Clears the value of `ios`. Subsequent reads from it will return its default value.
  mutating func clearIos() {self._ios = nil}

  var android: SAP_Internal_ApplicationVersionInfo {
    get {return _android ?? SAP_Internal_ApplicationVersionInfo()}
    set {_android = newValue}
  }
  /// Returns true if `android` has been explicitly set.
  var hasAndroid: Bool {return self._android != nil}
  /// Clears the value of `android`. Subsequent reads from it will return its default value.
  mutating func clearAndroid() {self._android = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _ios: SAP_Internal_ApplicationVersionInfo? = nil
  fileprivate var _android: SAP_Internal_ApplicationVersionInfo? = nil
}

struct SAP_Internal_ApplicationVersionInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var latest: SAP_Internal_SemanticVersion {
    get {return _latest ?? SAP_Internal_SemanticVersion()}
    set {_latest = newValue}
  }
  /// Returns true if `latest` has been explicitly set.
  var hasLatest: Bool {return self._latest != nil}
  /// Clears the value of `latest`. Subsequent reads from it will return its default value.
  mutating func clearLatest() {self._latest = nil}

  var min: SAP_Internal_SemanticVersion {
    get {return _min ?? SAP_Internal_SemanticVersion()}
    set {_min = newValue}
  }
  /// Returns true if `min` has been explicitly set.
  var hasMin: Bool {return self._min != nil}
  /// Clears the value of `min`. Subsequent reads from it will return its default value.
  mutating func clearMin() {self._min = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _latest: SAP_Internal_SemanticVersion? = nil
  fileprivate var _min: SAP_Internal_SemanticVersion? = nil
}

struct SAP_Internal_SemanticVersion {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var major: UInt32 = 0

  var minor: UInt32 = 0

  var patch: UInt32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "SAP.internal"

extension SAP_Internal_ApplicationVersionConfiguration: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ApplicationVersionConfiguration"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "ios"),
    2: .same(proto: "android"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularMessageField(value: &self._ios)
      case 2: try decoder.decodeSingularMessageField(value: &self._android)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._ios {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if let v = self._android {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_ApplicationVersionConfiguration, rhs: SAP_Internal_ApplicationVersionConfiguration) -> Bool {
    if lhs._ios != rhs._ios {return false}
    if lhs._android != rhs._android {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension SAP_Internal_ApplicationVersionInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ApplicationVersionInfo"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "latest"),
    2: .same(proto: "min"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularMessageField(value: &self._latest)
      case 2: try decoder.decodeSingularMessageField(value: &self._min)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._latest {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if let v = self._min {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_ApplicationVersionInfo, rhs: SAP_Internal_ApplicationVersionInfo) -> Bool {
    if lhs._latest != rhs._latest {return false}
    if lhs._min != rhs._min {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension SAP_Internal_SemanticVersion: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SemanticVersion"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "major"),
    2: .same(proto: "minor"),
    3: .same(proto: "patch"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt32Field(value: &self.major)
      case 2: try decoder.decodeSingularUInt32Field(value: &self.minor)
      case 3: try decoder.decodeSingularUInt32Field(value: &self.patch)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.major != 0 {
      try visitor.visitSingularUInt32Field(value: self.major, fieldNumber: 1)
    }
    if self.minor != 0 {
      try visitor.visitSingularUInt32Field(value: self.minor, fieldNumber: 2)
    }
    if self.patch != 0 {
      try visitor.visitSingularUInt32Field(value: self.patch, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_SemanticVersion, rhs: SAP_Internal_SemanticVersion) -> Bool {
    if lhs.major != rhs.major {return false}
    if lhs.minor != rhs.minor {return false}
    if lhs.patch != rhs.patch {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: internal/risk_score_parameters.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

/// This file is auto-generated, DO NOT make any changes here
/// See page 15:
/// https://covid19-static.cdn-apple.com/applications/covid19/current/static/contact-tracing/pdf/ExposureNotification-FrameworkDocumentationv1.2.pdf

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

struct SAP_Internal_RiskScoreParameters {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// App-specific mapping
  var transmission: SAP_Internal_RiskScoreParameters.TransmissionRiskParameters {
    get {return _transmission ?? SAP_Internal_RiskScoreParameters.TransmissionRiskParameters()}
    set {_transmission = newValue}
  }
  /// Returns true if `transmission` has been explicitly set.
  var hasTransmission: Bool {return self._transmission != nil}
  /// Clears the value of `transmission`. Subsequent reads from it will return its default value.
  mutating func clearTransmission() {self._transmission = nil}

  var transmissionWeight: Double = 0

  var duration: SAP_Internal_RiskScoreParameters.DurationRiskParameters {
    get {return _duration ?? SAP_Internal_RiskScoreParameters.DurationRiskParameters()}
    set {_duration = newValue}
  }
  /// Returns true if `duration` has been explicitly set.
  var hasDuration: Bool {return self._duration != nil}
  /// Clears the value of `duration`. Subsequent reads from it will return its default value.
  mutating func clearDuration() {self._duration = nil}

  var durationWeight: Double = 0

  var daysSinceLastExposure: SAP_Internal_RiskScoreParameters.DaysSinceLastExposureRiskParameters {
    get {return _daysSinceLastExposure ?? SAP_Internal_RiskScoreParameters.DaysSinceLastExposureRiskParameters()}
    set {_daysSinceLastExposure = newValue}
  }
  /// Returns true if `daysSinceLastExposure` has been explicitly set.
  var hasDaysSinceLastExposure: Bool {return self._daysSinceLastExposure != nil}
  /// Clears the value of `daysSinceLastExposure`. Subsequent reads from it will return its default value.
  mutating func clearDaysSinceLastExposure() {self._daysSinceLastExposure = nil}

  var daysWeight: Double = 0

  var attenuation: SAP_Internal_RiskScoreParameters.AttenuationRiskParameters {
    get {return _attenuation ?? SAP_Internal_RiskScoreParameters.AttenuationRiskParameters()}
    set {_attenuation = newValue}
  }
  /// Returns true if `attenuation` has been explicitly set.
  var hasAttenuation: Bool {return self._attenuation != nil}
  /// Clears the value of `attenuation`. Subsequent reads from it will return its default value.
  mutating func clearAttenuation() {self._attenuation = nil}

  var attenuationWeight: Double = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  struct TransmissionRiskParameters {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var appDefined1: SAP_Internal_RiskLevel = .unspecified

    var appDefined2: SAP_Internal_RiskLevel = .unspecified

    var appDefined3: SAP_Internal_RiskLevel = .unspecified

    var appDefined4: SAP_Internal_RiskLevel = .unspecified

    var appDefined5: SAP_Internal_RiskLevel = .unspecified

    var appDefined6: SAP_Internal_RiskLevel = .unspecified

    var appDefined7: SAP_Internal_RiskLevel = .unspecified

    var appDefined8: SAP_Internal_RiskLevel = .unspecified

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  struct DurationRiskParameters {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// D = 0 min, lowest risk
    var eq0Min: SAP_Internal_RiskLevel = .unspecified

    /// 0 < D <= 5 min
    var gt0Le5Min: SAP_Internal_RiskLevel = .unspecified

    /// 5 < D <= 10 min
    var gt5Le10Min: SAP_Internal_RiskLevel = .unspecified

    /// 10 < D <= 15 min
    var gt10Le15Min: SAP_Internal_RiskLevel = .unspecified

    /// 15 < D <= 20 min
    var gt15Le20Min: SAP_Internal_RiskLevel = .unspecified

    /// 20 < D <= 25 min
    var gt20Le25Min: SAP_Internal_RiskLevel = .unspecified

    /// 25 < D <= 30 min
    var gt25Le30Min: SAP_Internal_RiskLevel = .unspecified

    /// > 30 min, highest risk
    var gt30Min: SAP_Internal_RiskLevel = .unspecified

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  struct DaysSinceLastExposureRiskParameters {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// D >= 14 days, lowest risk
    var ge14Days: SAP_Internal_RiskLevel = .unspecified

    /// 12 <= D < 14 days
    var ge12Lt14Days: SAP_Internal_RiskLevel = .unspecified

    /// 10 <= D < 12 days
    var ge10Lt12Days: SAP_Internal_RiskLevel = .unspecified

    /// 8 <= D < 10 days
    var ge8Lt10Days: SAP_Internal_RiskLevel = .unspecified

    /// 6 <= D < 8 days
    var ge6Lt8Days: SAP_Internal_RiskLevel = .unspecified

    /// 4 <= D < 6 days
    var ge4Lt6Days: SAP_Internal_RiskLevel = .unspecified

    /// 2 <= D < 4 days
    var ge2Lt4Days: SAP_Internal_RiskLevel = .unspecified

    /// 0 <= D < 2 days, highest risk
    var ge0Lt2Days: SAP_Internal_RiskLevel = .unspecified

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  struct AttenuationRiskParameters {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// A > 73 dBm, lowest risk
    var gt73Dbm: SAP_Internal_RiskLevel = .unspecified

    /// 63 < A <= 73 dBm
    var gt63Le73Dbm: SAP_Internal_RiskLevel = .unspecified

    /// 51 < A <= 63 dBm
    var gt51Le63Dbm: SAP_Internal_RiskLevel = .unspecified

    /// 33 < A <= 51 dBm
    var gt33Le51Dbm: SAP_Internal_RiskLevel = .unspecified

    /// 27 < A <= 33 dBm
    var gt27Le33Dbm: SAP_Internal_RiskLevel = .unspecified

    /// 15 < A <= 27 dBm
    var gt15Le27Dbm: SAP_Internal_RiskLevel = .unspecified

    /// 10 < A <= 15 dBm
    var gt10Le15Dbm: SAP_Internal_RiskLevel = .unspecified

    /// A <= 10 dBm, highest risk
    var le10Dbm: SAP_Internal_RiskLevel = .unspecified

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  init() {}

  fileprivate var _transmission: SAP_Internal_RiskScoreParameters.TransmissionRiskParameters? = nil
  fileprivate var _duration: SAP_Internal_RiskScoreParameters.DurationRiskParameters? = nil
  fileprivate var _daysSinceLastExposure: SAP_Internal_RiskScoreParameters.DaysSinceLastExposureRiskParameters? = nil
  fileprivate var _attenuation: SAP_Internal_RiskScoreParameters.AttenuationRiskParameters? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "SAP.internal"

extension SAP_Internal_RiskScoreParameters: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RiskScoreParameters"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "transmission"),
    2: .standard(proto: "transmission_weight"),
    3: .same(proto: "duration"),
    4: .standard(proto: "duration_weight"),
    5: .standard(proto: "days_since_last_exposure"),
    6: .standard(proto: "days_weight"),
    7: .same(proto: "attenuation"),
    8: .standard(proto: "attenuation_weight"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularMessageField(value: &self._transmission)
      case 2: try decoder.decodeSingularDoubleField(value: &self.transmissionWeight)
      case 3: try decoder.decodeSingularMessageField(value: &self._duration)
      case 4: try decoder.decodeSingularDoubleField(value: &self.durationWeight)
      case 5: try decoder.decodeSingularMessageField(value: &self._daysSinceLastExposure)
      case 6: try decoder.decodeSingularDoubleField(value: &self.daysWeight)
      case 7: try decoder.decodeSingularMessageField(value: &self._attenuation)
      case 8: try decoder.decodeSingularDoubleField(value: &self.attenuationWeight)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._transmission {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if self.transmissionWeight != 0 {
      try visitor.visitSingularDoubleField(value: self.transmissionWeight, fieldNumber: 2)
    }
    if let v = self._duration {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    if self.durationWeight != 0 {
      try visitor.visitSingularDoubleField(value: self.durationWeight, fieldNumber: 4)
    }
    if let v = self._daysSinceLastExposure {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }
    if self.daysWeight != 0 {
      try visitor.visitSingularDoubleField(value: self.daysWeight, fieldNumber: 6)
    }
    if let v = self._attenuation {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    }
    if self.attenuationWeight != 0 {
      try visitor.visitSingularDoubleField(value: self.attenuationWeight, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_RiskScoreParameters, rhs: SAP_Internal_RiskScoreParameters) -> Bool {
    if lhs._transmission != rhs._transmission {return false}
    if lhs.transmissionWeight != rhs.transmissionWeight {return false}
    if lhs._duration != rhs._duration {return false}
    if lhs.durationWeight != rhs.durationWeight {return false}
    if lhs._daysSinceLastExposure != rhs._daysSinceLastExposure {return false}
    if lhs.daysWeight != rhs.daysWeight {return false}
    if lhs._attenuation != rhs._attenuation {return false}
    if lhs.attenuationWeight != rhs.attenuationWeight {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension SAP_Internal_RiskScoreParameters.TransmissionRiskParameters: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = SAP_Internal_RiskScoreParameters.protoMessageName + ".TransmissionRiskParameters"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "app_defined_1"),
    2: .standard(proto: "app_defined_2"),
    3: .standard(proto: "app_defined_3"),
    4: .standard(proto: "app_defined_4"),
    5: .standard(proto: "app_defined_5"),
    6: .standard(proto: "app_defined_6"),
    7: .standard(proto: "app_defined_7"),
    8: .standard(proto: "app_defined_8"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.appDefined1)
      case 2: try decoder.decodeSingularEnumField(value: &self.appDefined2)
      case 3: try decoder.decodeSingularEnumField(value: &self.appDefined3)
      case 4: try decoder.decodeSingularEnumField(value: &self.appDefined4)
      case 5: try decoder.decodeSingularEnumField(value: &self.appDefined5)
      case 6: try decoder.decodeSingularEnumField(value: &self.appDefined6)
      case 7: try decoder.decodeSingularEnumField(value: &self.appDefined7)
      case 8: try decoder.decodeSingularEnumField(value: &self.appDefined8)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.appDefined1 != .unspecified {
      try visitor.visitSingularEnumField(value: self.appDefined1, fieldNumber: 1)
    }
    if self.appDefined2 != .unspecified {
      try visitor.visitSingularEnumField(value: self.appDefined2, fieldNumber: 2)
    }
    if self.appDefined3 != .unspecified {
      try visitor.visitSingularEnumField(value: self.appDefined3, fieldNumber: 3)
    }
    if self.appDefined4 != .unspecified {
      try visitor.visitSingularEnumField(value: self.appDefined4, fieldNumber: 4)
    }
    if self.appDefined5 != .unspecified {
      try visitor.visitSingularEnumField(value: self.appDefined5, fieldNumber: 5)
    }
    if self.appDefined6 != .unspecified {
      try visitor.visitSingularEnumField(value: self.appDefined6, fieldNumber: 6)
    }
    if self.appDefined7 != .unspecified {
      try visitor.visitSingularEnumField(value: self.appDefined7, fieldNumber: 7)
    }
    if self.appDefined8 != .unspecified {
      try visitor.visitSingularEnumField(value: self.appDefined8, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_RiskScoreParameters.TransmissionRiskParameters, rhs: SAP_Internal_RiskScoreParameters.TransmissionRiskParameters) -> Bool {
    if lhs.appDefined1 != rhs.appDefined1 {return false}
    if lhs.appDefined2 != rhs.appDefined2 {return false}
    if lhs.appDefined3 != rhs.appDefined3 {return false}
    if lhs.appDefined4 != rhs.appDefined4 {return false}
    if lhs.appDefined5 != rhs.appDefined5 {return false}
    if lhs.appDefined6 != rhs.appDefined6 {return false}
    if lhs.appDefined7 != rhs.appDefined7 {return false}
    if lhs.appDefined8 != rhs.appDefined8 {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension SAP_Internal_RiskScoreParameters.DurationRiskParameters: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = SAP_Internal_RiskScoreParameters.protoMessageName + ".DurationRiskParameters"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "eq_0_min"),
    2: .standard(proto: "gt_0_le_5_min"),
    3: .standard(proto: "gt_5_le_10_min"),
    4: .standard(proto: "gt_10_le_15_min"),
    5: .standard(proto: "gt_15_le_20_min"),
    6: .standard(proto: "gt_20_le_25_min"),
    7: .standard(proto: "gt_25_le_30_min"),
    8: .standard(proto: "gt_30_min"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.eq0Min)
      case 2: try decoder.decodeSingularEnumField(value: &self.gt0Le5Min)
      case 3: try decoder.decodeSingularEnumField(value: &self.gt5Le10Min)
      case 4: try decoder.decodeSingularEnumField(value: &self.gt10Le15Min)
      case 5: try decoder.decodeSingularEnumField(value: &self.gt15Le20Min)
      case 6: try decoder.decodeSingularEnumField(value: &self.gt20Le25Min)
      case 7: try decoder.decodeSingularEnumField(value: &self.gt25Le30Min)
      case 8: try decoder.decodeSingularEnumField(value: &self.gt30Min)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.eq0Min != .unspecified {
      try visitor.visitSingularEnumField(value: self.eq0Min, fieldNumber: 1)
    }
    if self.gt0Le5Min != .unspecified {
      try visitor.visitSingularEnumField(value: self.gt0Le5Min, fieldNumber: 2)
    }
    if self.gt5Le10Min != .unspecified {
      try visitor.visitSingularEnumField(value: self.gt5Le10Min, fieldNumber: 3)
    }
    if self.gt10Le15Min != .unspecified {
      try visitor.visitSingularEnumField(value: self.gt10Le15Min, fieldNumber: 4)
    }
    if self.gt15Le20Min != .unspecified {
      try visitor.visitSingularEnumField(value: self.gt15Le20Min, fieldNumber: 5)
    }
    if self.gt20Le25Min != .unspecified {
      try visitor.visitSingularEnumField(value: self.gt20Le25Min, fieldNumber: 6)
    }
    if self.gt25Le30Min != .unspecified {
      try visitor.visitSingularEnumField(value: self.gt25Le30Min, fieldNumber: 7)
    }
    if self.gt30Min != .unspecified {
      try visitor.visitSingularEnumField(value: self.gt30Min, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_RiskScoreParameters.DurationRiskParameters, rhs: SAP_Internal_RiskScoreParameters.DurationRiskParameters) -> Bool {
    if lhs.eq0Min != rhs.eq0Min {return false}
    if lhs.gt0Le5Min != rhs.gt0Le5Min {return false}
    if lhs.gt5Le10Min != rhs.gt5Le10Min {return false}
    if lhs.gt10Le15Min != rhs.gt10Le15Min {return false}
    if lhs.gt15Le20Min != rhs.gt15Le20Min {return false}
    if lhs.gt20Le25Min != rhs.gt20Le25Min {return false}
    if lhs.gt25Le30Min != rhs.gt25Le30Min {return false}
    if lhs.gt30Min != rhs.gt30Min {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension SAP_Internal_RiskScoreParameters.DaysSinceLastExposureRiskParameters: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = SAP_Internal_RiskScoreParameters.protoMessageName + ".DaysSinceLastExposureRiskParameters"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "ge_14_days"),
    2: .standard(proto: "ge_12_lt_14_days"),
    3: .standard(proto: "ge_10_lt_12_days"),
    4: .standard(proto: "ge_8_lt_10_days"),
    5: .standard(proto: "ge_6_lt_8_days"),
    6: .standard(proto: "ge_4_lt_6_days"),
    7: .standard(proto: "ge_2_lt_4_days"),
    8: .standard(proto: "ge_0_lt_2_days"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.ge14Days)
      case 2: try decoder.decodeSingularEnumField(value: &self.ge12Lt14Days)
      case 3: try decoder.decodeSingularEnumField(value: &self.ge10Lt12Days)
      case 4: try decoder.decodeSingularEnumField(value: &self.ge8Lt10Days)
      case 5: try decoder.decodeSingularEnumField(value: &self.ge6Lt8Days)
      case 6: try decoder.decodeSingularEnumField(value: &self.ge4Lt6Days)
      case 7: try decoder.decodeSingularEnumField(value: &self.ge2Lt4Days)
      case 8: try decoder.decodeSingularEnumField(value: &self.ge0Lt2Days)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.ge14Days != .unspecified {
      try visitor.visitSingularEnumField(value: self.ge14Days, fieldNumber: 1)
    }
    if self.ge12Lt14Days != .unspecified {
      try visitor.visitSingularEnumField(value: self.ge12Lt14Days, fieldNumber: 2)
    }
    if self.ge10Lt12Days != .unspecified {
      try visitor.visitSingularEnumField(value: self.ge10Lt12Days, fieldNumber: 3)
    }
    if self.ge8Lt10Days != .unspecified {
      try visitor.visitSingularEnumField(value: self.ge8Lt10Days, fieldNumber: 4)
    }
    if self.ge6Lt8Days != .unspecified {
      try visitor.visitSingularEnumField(value: self.ge6Lt8Days, fieldNumber: 5)
    }
    if self.ge4Lt6Days != .unspecified {
      try visitor.visitSingularEnumField(value: self.ge4Lt6Days, fieldNumber: 6)
    }
    if self.ge2Lt4Days != .unspecified {
      try visitor.visitSingularEnumField(value: self.ge2Lt4Days, fieldNumber: 7)
    }
    if self.ge0Lt2Days != .unspecified {
      try visitor.visitSingularEnumField(value: self.ge0Lt2Days, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_RiskScoreParameters.DaysSinceLastExposureRiskParameters, rhs: SAP_Internal_RiskScoreParameters.DaysSinceLastExposureRiskParameters) -> Bool {
    if lhs.ge14Days != rhs.ge14Days {return false}
    if lhs.ge12Lt14Days != rhs.ge12Lt14Days {return false}
    if lhs.ge10Lt12Days != rhs.ge10Lt12Days {return false}
    if lhs.ge8Lt10Days != rhs.ge8Lt10Days {return false}
    if lhs.ge6Lt8Days != rhs.ge6Lt8Days {return false}
    if lhs.ge4Lt6Days != rhs.ge4Lt6Days {return false}
    if lhs.ge2Lt4Days != rhs.ge2Lt4Days {return false}
    if lhs.ge0Lt2Days != rhs.ge0Lt2Days {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension SAP_Internal_RiskScoreParameters.AttenuationRiskParameters: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = SAP_Internal_RiskScoreParameters.protoMessageName + ".AttenuationRiskParameters"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "gt_73_dbm"),
    2: .standard(proto: "gt_63_le_73_dbm"),
    3: .standard(proto: "gt_51_le_63_dbm"),
    4: .standard(proto: "gt_33_le_51_dbm"),
    5: .standard(proto: "gt_27_le_33_dbm"),
    6: .standard(proto: "gt_15_le_27_dbm"),
    7: .standard(proto: "gt_10_le_15_dbm"),
    8: .standard(proto: "le_10_dbm"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.gt73Dbm)
      case 2: try decoder.decodeSingularEnumField(value: &self.gt63Le73Dbm)
      case 3: try decoder.decodeSingularEnumField(value: &self.gt51Le63Dbm)
      case 4: try decoder.decodeSingularEnumField(value: &self.gt33Le51Dbm)
      case 5: try decoder.decodeSingularEnumField(value: &self.gt27Le33Dbm)
      case 6: try decoder.decodeSingularEnumField(value: &self.gt15Le27Dbm)
      case 7: try decoder.decodeSingularEnumField(value: &self.gt10Le15Dbm)
      case 8: try decoder.decodeSingularEnumField(value: &self.le10Dbm)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.gt73Dbm != .unspecified {
      try visitor.visitSingularEnumField(value: self.gt73Dbm, fieldNumber: 1)
    }
    if self.gt63Le73Dbm != .unspecified {
      try visitor.visitSingularEnumField(value: self.gt63Le73Dbm, fieldNumber: 2)
    }
    if self.gt51Le63Dbm != .unspecified {
      try visitor.visitSingularEnumField(value: self.gt51Le63Dbm, fieldNumber: 3)
    }
    if self.gt33Le51Dbm != .unspecified {
      try visitor.visitSingularEnumField(value: self.gt33Le51Dbm, fieldNumber: 4)
    }
    if self.gt27Le33Dbm != .unspecified {
      try visitor.visitSingularEnumField(value: self.gt27Le33Dbm, fieldNumber: 5)
    }
    if self.gt15Le27Dbm != .unspecified {
      try visitor.visitSingularEnumField(value: self.gt15Le27Dbm, fieldNumber: 6)
    }
    if self.gt10Le15Dbm != .unspecified {
      try visitor.visitSingularEnumField(value: self.gt10Le15Dbm, fieldNumber: 7)
    }
    if self.le10Dbm != .unspecified {
      try visitor.visitSingularEnumField(value: self.le10Dbm, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SAP_Internal_RiskScoreParameters.AttenuationRiskParameters, rhs: SAP_Internal_RiskScoreParameters.AttenuationRiskParameters) -> Bool {
    if lhs.gt73Dbm != rhs.gt73Dbm {return false}
    if lhs.gt63Le73Dbm != rhs.gt63Le73Dbm {return false}
    if lhs.gt51Le63Dbm != rhs.gt51Le63Dbm {return false}
    if lhs.gt33Le51Dbm != rhs.gt33Le51Dbm {return false}
    if lhs.gt27Le33Dbm != rhs.gt27Le33Dbm {return false}
    if lhs.gt15Le27Dbm != rhs.gt15Le27Dbm {return false}
    if lhs.gt10Le15Dbm != rhs.gt10Le15Dbm {return false}
    if lhs.le10Dbm != rhs.le10Dbm {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

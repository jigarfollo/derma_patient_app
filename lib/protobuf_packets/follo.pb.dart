///
//  Generated code. Do not modify.
//  source: follo.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class SendOTP extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SendOTP', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  SendOTP._() : super();
  factory SendOTP({
    $core.String? mobileNumber,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory SendOTP.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendOTP.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendOTP clone() => SendOTP()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendOTP copyWith(void Function(SendOTP) updates) => super.copyWith((message) => updates(message as SendOTP)) as SendOTP; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendOTP create() => SendOTP._();
  SendOTP createEmptyInstance() => create();
  static $pb.PbList<SendOTP> createRepeated() => $pb.PbList<SendOTP>();
  @$core.pragma('dart2js:noInline')
  static SendOTP getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendOTP>(create);
  static SendOTP? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mobileNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set mobileNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMobileNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearMobileNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get clinicId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clinicId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClinicId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClinicId() => clearField(2);
}

class SendOTPResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SendOTPResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'otpSent')
    ..hasRequiredFields = false
  ;

  SendOTPResponse._() : super();
  factory SendOTPResponse({
    $core.String? status,
    $core.String? mobileNumber,
    $core.bool? otpSent,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (otpSent != null) {
      _result.otpSent = otpSent;
    }
    return _result;
  }
  factory SendOTPResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendOTPResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendOTPResponse clone() => SendOTPResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendOTPResponse copyWith(void Function(SendOTPResponse) updates) => super.copyWith((message) => updates(message as SendOTPResponse)) as SendOTPResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendOTPResponse create() => SendOTPResponse._();
  SendOTPResponse createEmptyInstance() => create();
  static $pb.PbList<SendOTPResponse> createRepeated() => $pb.PbList<SendOTPResponse>();
  @$core.pragma('dart2js:noInline')
  static SendOTPResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendOTPResponse>(create);
  static SendOTPResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mobileNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set mobileNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMobileNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearMobileNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get otpSent => $_getBF(2);
  @$pb.TagNumber(3)
  set otpSent($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOtpSent() => $_has(2);
  @$pb.TagNumber(3)
  void clearOtpSent() => clearField(3);
}

class ResendOTP extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResendOTP', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'retryType')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  ResendOTP._() : super();
  factory ResendOTP({
    $core.String? mobileNumber,
    $core.String? retryType,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (retryType != null) {
      _result.retryType = retryType;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory ResendOTP.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResendOTP.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResendOTP clone() => ResendOTP()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResendOTP copyWith(void Function(ResendOTP) updates) => super.copyWith((message) => updates(message as ResendOTP)) as ResendOTP; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResendOTP create() => ResendOTP._();
  ResendOTP createEmptyInstance() => create();
  static $pb.PbList<ResendOTP> createRepeated() => $pb.PbList<ResendOTP>();
  @$core.pragma('dart2js:noInline')
  static ResendOTP getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResendOTP>(create);
  static ResendOTP? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mobileNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set mobileNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMobileNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearMobileNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get retryType => $_getSZ(1);
  @$pb.TagNumber(2)
  set retryType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRetryType() => $_has(1);
  @$pb.TagNumber(2)
  void clearRetryType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get clinicId => $_getSZ(2);
  @$pb.TagNumber(3)
  set clinicId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClinicId() => $_has(2);
  @$pb.TagNumber(3)
  void clearClinicId() => clearField(3);
}

class ResendOTPResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResendOTPResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'otpResent')
    ..hasRequiredFields = false
  ;

  ResendOTPResponse._() : super();
  factory ResendOTPResponse({
    $core.String? status,
    $core.String? mobileNumber,
    $core.bool? otpResent,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (otpResent != null) {
      _result.otpResent = otpResent;
    }
    return _result;
  }
  factory ResendOTPResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResendOTPResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResendOTPResponse clone() => ResendOTPResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResendOTPResponse copyWith(void Function(ResendOTPResponse) updates) => super.copyWith((message) => updates(message as ResendOTPResponse)) as ResendOTPResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResendOTPResponse create() => ResendOTPResponse._();
  ResendOTPResponse createEmptyInstance() => create();
  static $pb.PbList<ResendOTPResponse> createRepeated() => $pb.PbList<ResendOTPResponse>();
  @$core.pragma('dart2js:noInline')
  static ResendOTPResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResendOTPResponse>(create);
  static ResendOTPResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mobileNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set mobileNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMobileNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearMobileNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get otpResent => $_getBF(2);
  @$pb.TagNumber(3)
  set otpResent($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOtpResent() => $_has(2);
  @$pb.TagNumber(3)
  void clearOtpResent() => clearField(3);
}

class VerifyOTP extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyOTP', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userOtp', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  VerifyOTP._() : super();
  factory VerifyOTP({
    $core.String? mobileNumber,
    $core.int? userOtp,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (userOtp != null) {
      _result.userOtp = userOtp;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory VerifyOTP.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyOTP.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyOTP clone() => VerifyOTP()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyOTP copyWith(void Function(VerifyOTP) updates) => super.copyWith((message) => updates(message as VerifyOTP)) as VerifyOTP; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyOTP create() => VerifyOTP._();
  VerifyOTP createEmptyInstance() => create();
  static $pb.PbList<VerifyOTP> createRepeated() => $pb.PbList<VerifyOTP>();
  @$core.pragma('dart2js:noInline')
  static VerifyOTP getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyOTP>(create);
  static VerifyOTP? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mobileNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set mobileNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMobileNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearMobileNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userOtp => $_getIZ(1);
  @$pb.TagNumber(2)
  set userOtp($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserOtp() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserOtp() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get clinicId => $_getSZ(2);
  @$pb.TagNumber(3)
  set clinicId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClinicId() => $_has(2);
  @$pb.TagNumber(3)
  void clearClinicId() => clearField(3);
}

class VerifyOTPResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyOTPResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'otpVerified')
    ..hasRequiredFields = false
  ;

  VerifyOTPResponse._() : super();
  factory VerifyOTPResponse({
    $core.String? status,
    $core.String? mobileNumber,
    $core.bool? otpVerified,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (otpVerified != null) {
      _result.otpVerified = otpVerified;
    }
    return _result;
  }
  factory VerifyOTPResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyOTPResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyOTPResponse clone() => VerifyOTPResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyOTPResponse copyWith(void Function(VerifyOTPResponse) updates) => super.copyWith((message) => updates(message as VerifyOTPResponse)) as VerifyOTPResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyOTPResponse create() => VerifyOTPResponse._();
  VerifyOTPResponse createEmptyInstance() => create();
  static $pb.PbList<VerifyOTPResponse> createRepeated() => $pb.PbList<VerifyOTPResponse>();
  @$core.pragma('dart2js:noInline')
  static VerifyOTPResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyOTPResponse>(create);
  static VerifyOTPResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mobileNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set mobileNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMobileNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearMobileNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get otpVerified => $_getBF(2);
  @$pb.TagNumber(3)
  set otpVerified($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOtpVerified() => $_has(2);
  @$pb.TagNumber(3)
  void clearOtpVerified() => clearField(3);
}

class PatientPresent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PatientPresent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  PatientPresent._() : super();
  factory PatientPresent({
    $core.String? mobileNumber,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory PatientPresent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PatientPresent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PatientPresent clone() => PatientPresent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PatientPresent copyWith(void Function(PatientPresent) updates) => super.copyWith((message) => updates(message as PatientPresent)) as PatientPresent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatientPresent create() => PatientPresent._();
  PatientPresent createEmptyInstance() => create();
  static $pb.PbList<PatientPresent> createRepeated() => $pb.PbList<PatientPresent>();
  @$core.pragma('dart2js:noInline')
  static PatientPresent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PatientPresent>(create);
  static PatientPresent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mobileNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set mobileNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMobileNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearMobileNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get clinicId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clinicId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClinicId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClinicId() => clearField(2);
}

class PatientPresentResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PatientPresentResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userPresent')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userType')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userExistsOnApp')
    ..hasRequiredFields = false
  ;

  PatientPresentResponse._() : super();
  factory PatientPresentResponse({
    $core.String? status,
    $core.String? mobileNumber,
    $core.bool? userPresent,
    $core.String? userType,
    $core.bool? userExistsOnApp,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (userPresent != null) {
      _result.userPresent = userPresent;
    }
    if (userType != null) {
      _result.userType = userType;
    }
    if (userExistsOnApp != null) {
      _result.userExistsOnApp = userExistsOnApp;
    }
    return _result;
  }
  factory PatientPresentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PatientPresentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PatientPresentResponse clone() => PatientPresentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PatientPresentResponse copyWith(void Function(PatientPresentResponse) updates) => super.copyWith((message) => updates(message as PatientPresentResponse)) as PatientPresentResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatientPresentResponse create() => PatientPresentResponse._();
  PatientPresentResponse createEmptyInstance() => create();
  static $pb.PbList<PatientPresentResponse> createRepeated() => $pb.PbList<PatientPresentResponse>();
  @$core.pragma('dart2js:noInline')
  static PatientPresentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PatientPresentResponse>(create);
  static PatientPresentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mobileNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set mobileNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMobileNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearMobileNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get userPresent => $_getBF(2);
  @$pb.TagNumber(3)
  set userPresent($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserPresent() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserPresent() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userType => $_getSZ(3);
  @$pb.TagNumber(4)
  set userType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserType() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserType() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get userExistsOnApp => $_getBF(4);
  @$pb.TagNumber(5)
  set userExistsOnApp($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserExistsOnApp() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserExistsOnApp() => clearField(5);
}

class PatientAuthenticate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PatientAuthenticate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userPin', $pb.PbFieldType.O3)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userBiometric')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  PatientAuthenticate._() : super();
  factory PatientAuthenticate({
    $core.String? mobileNumber,
    $core.int? userPin,
    $core.bool? userBiometric,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (userPin != null) {
      _result.userPin = userPin;
    }
    if (userBiometric != null) {
      _result.userBiometric = userBiometric;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory PatientAuthenticate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PatientAuthenticate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PatientAuthenticate clone() => PatientAuthenticate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PatientAuthenticate copyWith(void Function(PatientAuthenticate) updates) => super.copyWith((message) => updates(message as PatientAuthenticate)) as PatientAuthenticate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatientAuthenticate create() => PatientAuthenticate._();
  PatientAuthenticate createEmptyInstance() => create();
  static $pb.PbList<PatientAuthenticate> createRepeated() => $pb.PbList<PatientAuthenticate>();
  @$core.pragma('dart2js:noInline')
  static PatientAuthenticate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PatientAuthenticate>(create);
  static PatientAuthenticate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mobileNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set mobileNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMobileNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearMobileNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userPin => $_getIZ(1);
  @$pb.TagNumber(2)
  set userPin($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserPin() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserPin() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get userBiometric => $_getBF(2);
  @$pb.TagNumber(3)
  set userBiometric($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserBiometric() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserBiometric() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get clinicId => $_getSZ(3);
  @$pb.TagNumber(4)
  set clinicId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasClinicId() => $_has(3);
  @$pb.TagNumber(4)
  void clearClinicId() => clearField(4);
}

class PatientAuthenticateResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PatientAuthenticateResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenticated')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userType')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signUpDetails')
    ..hasRequiredFields = false
  ;

  PatientAuthenticateResponse._() : super();
  factory PatientAuthenticateResponse({
    $core.String? status,
    $core.String? mobileNumber,
    $core.bool? authenticated,
    $core.String? userToken,
    $core.String? userType,
    $core.String? userId,
    $core.bool? signUpDetails,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (authenticated != null) {
      _result.authenticated = authenticated;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (userType != null) {
      _result.userType = userType;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (signUpDetails != null) {
      _result.signUpDetails = signUpDetails;
    }
    return _result;
  }
  factory PatientAuthenticateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PatientAuthenticateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PatientAuthenticateResponse clone() => PatientAuthenticateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PatientAuthenticateResponse copyWith(void Function(PatientAuthenticateResponse) updates) => super.copyWith((message) => updates(message as PatientAuthenticateResponse)) as PatientAuthenticateResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatientAuthenticateResponse create() => PatientAuthenticateResponse._();
  PatientAuthenticateResponse createEmptyInstance() => create();
  static $pb.PbList<PatientAuthenticateResponse> createRepeated() => $pb.PbList<PatientAuthenticateResponse>();
  @$core.pragma('dart2js:noInline')
  static PatientAuthenticateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PatientAuthenticateResponse>(create);
  static PatientAuthenticateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mobileNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set mobileNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMobileNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearMobileNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get authenticated => $_getBF(2);
  @$pb.TagNumber(3)
  set authenticated($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAuthenticated() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthenticated() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userToken => $_getSZ(3);
  @$pb.TagNumber(4)
  set userToken($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserToken() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserToken() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get userType => $_getSZ(4);
  @$pb.TagNumber(5)
  set userType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserType() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserType() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get userId => $_getSZ(5);
  @$pb.TagNumber(6)
  set userId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUserId() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserId() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get signUpDetails => $_getBF(6);
  @$pb.TagNumber(7)
  set signUpDetails($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSignUpDetails() => $_has(6);
  @$pb.TagNumber(7)
  void clearSignUpDetails() => clearField(7);
}

class Logout extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Logout', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  Logout._() : super();
  factory Logout({
    $core.String? userId,
    $core.String? userToken,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory Logout.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Logout.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Logout clone() => Logout()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Logout copyWith(void Function(Logout) updates) => super.copyWith((message) => updates(message as Logout)) as Logout; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Logout create() => Logout._();
  Logout createEmptyInstance() => create();
  static $pb.PbList<Logout> createRepeated() => $pb.PbList<Logout>();
  @$core.pragma('dart2js:noInline')
  static Logout getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Logout>(create);
  static Logout? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get clinicId => $_getSZ(2);
  @$pb.TagNumber(3)
  set clinicId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClinicId() => $_has(2);
  @$pb.TagNumber(3)
  void clearClinicId() => clearField(3);
}

class LogoutResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LogoutResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'loggedOut')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  LogoutResponse._() : super();
  factory LogoutResponse({
    $core.String? status,
    $core.bool? loggedOut,
    $core.String? userId,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (loggedOut != null) {
      _result.loggedOut = loggedOut;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory LogoutResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogoutResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogoutResponse clone() => LogoutResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogoutResponse copyWith(void Function(LogoutResponse) updates) => super.copyWith((message) => updates(message as LogoutResponse)) as LogoutResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LogoutResponse create() => LogoutResponse._();
  LogoutResponse createEmptyInstance() => create();
  static $pb.PbList<LogoutResponse> createRepeated() => $pb.PbList<LogoutResponse>();
  @$core.pragma('dart2js:noInline')
  static LogoutResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogoutResponse>(create);
  static LogoutResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get loggedOut => $_getBF(1);
  @$pb.TagNumber(2)
  set loggedOut($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLoggedOut() => $_has(1);
  @$pb.TagNumber(2)
  void clearLoggedOut() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);
}

class SetPin extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetPin', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userOtp', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userPin', $pb.PbFieldType.O3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  SetPin._() : super();
  factory SetPin({
    $core.String? mobileNumber,
    $core.int? userOtp,
    $core.int? userPin,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (userOtp != null) {
      _result.userOtp = userOtp;
    }
    if (userPin != null) {
      _result.userPin = userPin;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory SetPin.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetPin.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetPin clone() => SetPin()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetPin copyWith(void Function(SetPin) updates) => super.copyWith((message) => updates(message as SetPin)) as SetPin; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetPin create() => SetPin._();
  SetPin createEmptyInstance() => create();
  static $pb.PbList<SetPin> createRepeated() => $pb.PbList<SetPin>();
  @$core.pragma('dart2js:noInline')
  static SetPin getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetPin>(create);
  static SetPin? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mobileNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set mobileNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMobileNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearMobileNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userOtp => $_getIZ(1);
  @$pb.TagNumber(2)
  set userOtp($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserOtp() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserOtp() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get userPin => $_getIZ(2);
  @$pb.TagNumber(3)
  set userPin($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserPin() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserPin() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get clinicId => $_getSZ(3);
  @$pb.TagNumber(4)
  set clinicId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasClinicId() => $_has(3);
  @$pb.TagNumber(4)
  void clearClinicId() => clearField(4);
}

class SetPinResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetPinResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pinSet')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  SetPinResponse._() : super();
  factory SetPinResponse({
    $core.String? status,
    $core.String? mobileNumber,
    $core.bool? pinSet,
    $core.String? userToken,
    $core.String? userId,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (pinSet != null) {
      _result.pinSet = pinSet;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory SetPinResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetPinResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetPinResponse clone() => SetPinResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetPinResponse copyWith(void Function(SetPinResponse) updates) => super.copyWith((message) => updates(message as SetPinResponse)) as SetPinResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetPinResponse create() => SetPinResponse._();
  SetPinResponse createEmptyInstance() => create();
  static $pb.PbList<SetPinResponse> createRepeated() => $pb.PbList<SetPinResponse>();
  @$core.pragma('dart2js:noInline')
  static SetPinResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetPinResponse>(create);
  static SetPinResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mobileNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set mobileNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMobileNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearMobileNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get pinSet => $_getBF(2);
  @$pb.TagNumber(3)
  set pinSet($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPinSet() => $_has(2);
  @$pb.TagNumber(3)
  void clearPinSet() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userToken => $_getSZ(3);
  @$pb.TagNumber(4)
  set userToken($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserToken() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserToken() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get userId => $_getSZ(4);
  @$pb.TagNumber(5)
  set userId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserId() => clearField(5);
}

class RefreshToken extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RefreshToken', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  RefreshToken._() : super();
  factory RefreshToken({
    $core.String? userToken,
    $core.String? userId,
  }) {
    final _result = create();
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory RefreshToken.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshToken.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshToken clone() => RefreshToken()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshToken copyWith(void Function(RefreshToken) updates) => super.copyWith((message) => updates(message as RefreshToken)) as RefreshToken; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshToken create() => RefreshToken._();
  RefreshToken createEmptyInstance() => create();
  static $pb.PbList<RefreshToken> createRepeated() => $pb.PbList<RefreshToken>();
  @$core.pragma('dart2js:noInline')
  static RefreshToken getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshToken>(create);
  static RefreshToken? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set userToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

class RefreshTokenResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RefreshTokenResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenRefreshed')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..hasRequiredFields = false
  ;

  RefreshTokenResponse._() : super();
  factory RefreshTokenResponse({
    $core.String? status,
    $core.bool? tokenRefreshed,
    $core.String? userToken,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (tokenRefreshed != null) {
      _result.tokenRefreshed = tokenRefreshed;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    return _result;
  }
  factory RefreshTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshTokenResponse clone() => RefreshTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshTokenResponse copyWith(void Function(RefreshTokenResponse) updates) => super.copyWith((message) => updates(message as RefreshTokenResponse)) as RefreshTokenResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshTokenResponse create() => RefreshTokenResponse._();
  RefreshTokenResponse createEmptyInstance() => create();
  static $pb.PbList<RefreshTokenResponse> createRepeated() => $pb.PbList<RefreshTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static RefreshTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshTokenResponse>(create);
  static RefreshTokenResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get tokenRefreshed => $_getBF(1);
  @$pb.TagNumber(2)
  set tokenRefreshed($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTokenRefreshed() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenRefreshed() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set userToken($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserToken() => clearField(3);
}

class Media extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Media', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mediaType')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileName')
    ..hasRequiredFields = false
  ;

  Media._() : super();
  factory Media({
    $core.String? url,
    $core.String? mediaType,
    $core.String? fileName,
  }) {
    final _result = create();
    if (url != null) {
      _result.url = url;
    }
    if (mediaType != null) {
      _result.mediaType = mediaType;
    }
    if (fileName != null) {
      _result.fileName = fileName;
    }
    return _result;
  }
  factory Media.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Media.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Media clone() => Media()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Media copyWith(void Function(Media) updates) => super.copyWith((message) => updates(message as Media)) as Media; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Media create() => Media._();
  Media createEmptyInstance() => create();
  static $pb.PbList<Media> createRepeated() => $pb.PbList<Media>();
  @$core.pragma('dart2js:noInline')
  static Media getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Media>(create);
  static Media? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mediaType => $_getSZ(1);
  @$pb.TagNumber(2)
  set mediaType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMediaType() => $_has(1);
  @$pb.TagNumber(2)
  void clearMediaType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fileName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fileName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFileName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileName() => clearField(3);
}

class PatientSignUp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PatientSignUp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateOfBirth')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'age', $pb.PbFieldType.O3)
    ..aOM<Media>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'profilePicture', subBuilder: Media.create)
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..hasRequiredFields = false
  ;

  PatientSignUp._() : super();
  factory PatientSignUp({
    $core.String? userId,
    $core.String? userToken,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? mobileNumber,
    $fixnum.Int64? dateOfBirth,
    $core.String? gender,
    $core.String? role,
    $core.int? age,
    Media? profilePicture,
    $core.String? clinicId,
    $core.String? email,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (dateOfBirth != null) {
      _result.dateOfBirth = dateOfBirth;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    if (role != null) {
      _result.role = role;
    }
    if (age != null) {
      _result.age = age;
    }
    if (profilePicture != null) {
      _result.profilePicture = profilePicture;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    if (email != null) {
      _result.email = email;
    }
    return _result;
  }
  factory PatientSignUp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PatientSignUp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PatientSignUp clone() => PatientSignUp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PatientSignUp copyWith(void Function(PatientSignUp) updates) => super.copyWith((message) => updates(message as PatientSignUp)) as PatientSignUp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatientSignUp create() => PatientSignUp._();
  PatientSignUp createEmptyInstance() => create();
  static $pb.PbList<PatientSignUp> createRepeated() => $pb.PbList<PatientSignUp>();
  @$core.pragma('dart2js:noInline')
  static PatientSignUp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PatientSignUp>(create);
  static PatientSignUp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get firstName => $_getSZ(2);
  @$pb.TagNumber(3)
  set firstName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFirstName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastName => $_getSZ(3);
  @$pb.TagNumber(4)
  set lastName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastName() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get mobileNumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set mobileNumber($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMobileNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearMobileNumber() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get dateOfBirth => $_getI64(5);
  @$pb.TagNumber(6)
  set dateOfBirth($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDateOfBirth() => $_has(5);
  @$pb.TagNumber(6)
  void clearDateOfBirth() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get gender => $_getSZ(6);
  @$pb.TagNumber(7)
  set gender($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasGender() => $_has(6);
  @$pb.TagNumber(7)
  void clearGender() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get role => $_getSZ(7);
  @$pb.TagNumber(8)
  set role($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRole() => $_has(7);
  @$pb.TagNumber(8)
  void clearRole() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get age => $_getIZ(8);
  @$pb.TagNumber(9)
  set age($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAge() => $_has(8);
  @$pb.TagNumber(9)
  void clearAge() => clearField(9);

  @$pb.TagNumber(10)
  Media get profilePicture => $_getN(9);
  @$pb.TagNumber(10)
  set profilePicture(Media v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasProfilePicture() => $_has(9);
  @$pb.TagNumber(10)
  void clearProfilePicture() => clearField(10);
  @$pb.TagNumber(10)
  Media ensureProfilePicture() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get clinicId => $_getSZ(10);
  @$pb.TagNumber(11)
  set clinicId($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasClinicId() => $_has(10);
  @$pb.TagNumber(11)
  void clearClinicId() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get email => $_getSZ(11);
  @$pb.TagNumber(12)
  set email($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasEmail() => $_has(11);
  @$pb.TagNumber(12)
  void clearEmail() => clearField(12);
}

class PatientSignUpResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PatientSignUpResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signUpSuccess')
    ..hasRequiredFields = false
  ;

  PatientSignUpResponse._() : super();
  factory PatientSignUpResponse({
    $core.String? status,
    $core.bool? signUpSuccess,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (signUpSuccess != null) {
      _result.signUpSuccess = signUpSuccess;
    }
    return _result;
  }
  factory PatientSignUpResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PatientSignUpResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PatientSignUpResponse clone() => PatientSignUpResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PatientSignUpResponse copyWith(void Function(PatientSignUpResponse) updates) => super.copyWith((message) => updates(message as PatientSignUpResponse)) as PatientSignUpResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatientSignUpResponse create() => PatientSignUpResponse._();
  PatientSignUpResponse createEmptyInstance() => create();
  static $pb.PbList<PatientSignUpResponse> createRepeated() => $pb.PbList<PatientSignUpResponse>();
  @$core.pragma('dart2js:noInline')
  static PatientSignUpResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PatientSignUpResponse>(create);
  static PatientSignUpResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get signUpSuccess => $_getBF(1);
  @$pb.TagNumber(2)
  set signUpSuccess($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignUpSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignUpSuccess() => clearField(2);
}

class PatientHistory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PatientHistory', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'diseaseName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'date')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'caregiverId')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdByCurrentDoctor')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  PatientHistory._() : super();
  factory PatientHistory({
    $core.int? folloUpId,
    $core.String? diseaseName,
    $core.String? date,
    $core.String? caregiverId,
    $core.bool? createdByCurrentDoctor,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (folloUpId != null) {
      _result.folloUpId = folloUpId;
    }
    if (diseaseName != null) {
      _result.diseaseName = diseaseName;
    }
    if (date != null) {
      _result.date = date;
    }
    if (caregiverId != null) {
      _result.caregiverId = caregiverId;
    }
    if (createdByCurrentDoctor != null) {
      _result.createdByCurrentDoctor = createdByCurrentDoctor;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory PatientHistory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PatientHistory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PatientHistory clone() => PatientHistory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PatientHistory copyWith(void Function(PatientHistory) updates) => super.copyWith((message) => updates(message as PatientHistory)) as PatientHistory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatientHistory create() => PatientHistory._();
  PatientHistory createEmptyInstance() => create();
  static $pb.PbList<PatientHistory> createRepeated() => $pb.PbList<PatientHistory>();
  @$core.pragma('dart2js:noInline')
  static PatientHistory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PatientHistory>(create);
  static PatientHistory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get folloUpId => $_getIZ(0);
  @$pb.TagNumber(1)
  set folloUpId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFolloUpId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFolloUpId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get diseaseName => $_getSZ(1);
  @$pb.TagNumber(2)
  set diseaseName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDiseaseName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDiseaseName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get date => $_getSZ(2);
  @$pb.TagNumber(3)
  set date($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDate() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get caregiverId => $_getSZ(3);
  @$pb.TagNumber(4)
  set caregiverId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCaregiverId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCaregiverId() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get createdByCurrentDoctor => $_getBF(4);
  @$pb.TagNumber(5)
  set createdByCurrentDoctor($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedByCurrentDoctor() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedByCurrentDoctor() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get clinicId => $_getSZ(5);
  @$pb.TagNumber(6)
  set clinicId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasClinicId() => $_has(5);
  @$pb.TagNumber(6)
  void clearClinicId() => clearField(6);
}

class Patient extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Patient', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'age', $pb.PbFieldType.O3)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender')
    ..pc<PatientHistory>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'history', $pb.PbFieldType.PM, subBuilder: PatientHistory.create)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..aInt64(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateOfBirth')
    ..aOM<Media>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'profilePicture', subBuilder: Media.create)
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientProfileId')
    ..hasRequiredFields = false
  ;

  Patient._() : super();
  factory Patient({
    $core.String? patientId,
    $core.String? mobileNumber,
    $core.String? firstName,
    $core.String? lastName,
    $core.int? age,
    $core.String? gender,
    $core.Iterable<PatientHistory>? history,
    $core.String? clinicId,
    $fixnum.Int64? dateOfBirth,
    Media? profilePicture,
    $core.String? email,
    $core.String? patientProfileId,
  }) {
    final _result = create();
    if (patientId != null) {
      _result.patientId = patientId;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    if (age != null) {
      _result.age = age;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    if (history != null) {
      _result.history.addAll(history);
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    if (dateOfBirth != null) {
      _result.dateOfBirth = dateOfBirth;
    }
    if (profilePicture != null) {
      _result.profilePicture = profilePicture;
    }
    if (email != null) {
      _result.email = email;
    }
    if (patientProfileId != null) {
      _result.patientProfileId = patientProfileId;
    }
    return _result;
  }
  factory Patient.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Patient.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Patient clone() => Patient()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Patient copyWith(void Function(Patient) updates) => super.copyWith((message) => updates(message as Patient)) as Patient; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Patient create() => Patient._();
  Patient createEmptyInstance() => create();
  static $pb.PbList<Patient> createRepeated() => $pb.PbList<Patient>();
  @$core.pragma('dart2js:noInline')
  static Patient getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Patient>(create);
  static Patient? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get patientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set patientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPatientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPatientId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mobileNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set mobileNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMobileNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearMobileNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get firstName => $_getSZ(2);
  @$pb.TagNumber(3)
  set firstName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFirstName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastName => $_getSZ(3);
  @$pb.TagNumber(4)
  set lastName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastName() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastName() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get age => $_getIZ(4);
  @$pb.TagNumber(5)
  set age($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAge() => $_has(4);
  @$pb.TagNumber(5)
  void clearAge() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get gender => $_getSZ(5);
  @$pb.TagNumber(6)
  set gender($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasGender() => $_has(5);
  @$pb.TagNumber(6)
  void clearGender() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<PatientHistory> get history => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get clinicId => $_getSZ(7);
  @$pb.TagNumber(8)
  set clinicId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasClinicId() => $_has(7);
  @$pb.TagNumber(8)
  void clearClinicId() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get dateOfBirth => $_getI64(8);
  @$pb.TagNumber(9)
  set dateOfBirth($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDateOfBirth() => $_has(8);
  @$pb.TagNumber(9)
  void clearDateOfBirth() => clearField(9);

  @$pb.TagNumber(10)
  Media get profilePicture => $_getN(9);
  @$pb.TagNumber(10)
  set profilePicture(Media v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasProfilePicture() => $_has(9);
  @$pb.TagNumber(10)
  void clearProfilePicture() => clearField(10);
  @$pb.TagNumber(10)
  Media ensureProfilePicture() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get email => $_getSZ(10);
  @$pb.TagNumber(11)
  set email($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasEmail() => $_has(10);
  @$pb.TagNumber(11)
  void clearEmail() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get patientProfileId => $_getSZ(11);
  @$pb.TagNumber(12)
  set patientProfileId($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasPatientProfileId() => $_has(11);
  @$pb.TagNumber(12)
  void clearPatientProfileId() => clearField(12);
}

class FetchPatient extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchPatient', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientProfileId')
    ..hasRequiredFields = false
  ;

  FetchPatient._() : super();
  factory FetchPatient({
    $core.String? userId,
    $core.String? userToken,
    $core.String? mobileNumber,
    $core.String? clinicId,
    $core.String? patientProfileId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    if (patientProfileId != null) {
      _result.patientProfileId = patientProfileId;
    }
    return _result;
  }
  factory FetchPatient.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPatient.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPatient clone() => FetchPatient()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPatient copyWith(void Function(FetchPatient) updates) => super.copyWith((message) => updates(message as FetchPatient)) as FetchPatient; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchPatient create() => FetchPatient._();
  FetchPatient createEmptyInstance() => create();
  static $pb.PbList<FetchPatient> createRepeated() => $pb.PbList<FetchPatient>();
  @$core.pragma('dart2js:noInline')
  static FetchPatient getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPatient>(create);
  static FetchPatient? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mobileNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set mobileNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMobileNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearMobileNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get clinicId => $_getSZ(3);
  @$pb.TagNumber(4)
  set clinicId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasClinicId() => $_has(3);
  @$pb.TagNumber(4)
  void clearClinicId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get patientProfileId => $_getSZ(4);
  @$pb.TagNumber(5)
  set patientProfileId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPatientProfileId() => $_has(4);
  @$pb.TagNumber(5)
  void clearPatientProfileId() => clearField(5);
}

class FetchPatientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchPatientResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOM<Patient>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientdata', subBuilder: Patient.create)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientExists')
    ..hasRequiredFields = false
  ;

  FetchPatientResponse._() : super();
  factory FetchPatientResponse({
    $core.String? status,
    Patient? patientdata,
    $core.bool? patientExists,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (patientdata != null) {
      _result.patientdata = patientdata;
    }
    if (patientExists != null) {
      _result.patientExists = patientExists;
    }
    return _result;
  }
  factory FetchPatientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPatientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPatientResponse clone() => FetchPatientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPatientResponse copyWith(void Function(FetchPatientResponse) updates) => super.copyWith((message) => updates(message as FetchPatientResponse)) as FetchPatientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchPatientResponse create() => FetchPatientResponse._();
  FetchPatientResponse createEmptyInstance() => create();
  static $pb.PbList<FetchPatientResponse> createRepeated() => $pb.PbList<FetchPatientResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchPatientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPatientResponse>(create);
  static FetchPatientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  Patient get patientdata => $_getN(1);
  @$pb.TagNumber(2)
  set patientdata(Patient v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPatientdata() => $_has(1);
  @$pb.TagNumber(2)
  void clearPatientdata() => clearField(2);
  @$pb.TagNumber(2)
  Patient ensurePatientdata() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get patientExists => $_getBF(2);
  @$pb.TagNumber(3)
  set patientExists($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPatientExists() => $_has(2);
  @$pb.TagNumber(3)
  void clearPatientExists() => clearField(3);
}

class InitialSubscription extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InitialSubscription', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subscribed')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userSubscriptionSetting')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pushToken')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  InitialSubscription._() : super();
  factory InitialSubscription({
    $core.String? userId,
    $core.String? userToken,
    $core.String? playerId,
    $core.String? deviceId,
    $core.bool? subscribed,
    $core.bool? userSubscriptionSetting,
    $core.String? pushToken,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (subscribed != null) {
      _result.subscribed = subscribed;
    }
    if (userSubscriptionSetting != null) {
      _result.userSubscriptionSetting = userSubscriptionSetting;
    }
    if (pushToken != null) {
      _result.pushToken = pushToken;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory InitialSubscription.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InitialSubscription.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InitialSubscription clone() => InitialSubscription()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InitialSubscription copyWith(void Function(InitialSubscription) updates) => super.copyWith((message) => updates(message as InitialSubscription)) as InitialSubscription; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InitialSubscription create() => InitialSubscription._();
  InitialSubscription createEmptyInstance() => create();
  static $pb.PbList<InitialSubscription> createRepeated() => $pb.PbList<InitialSubscription>();
  @$core.pragma('dart2js:noInline')
  static InitialSubscription getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InitialSubscription>(create);
  static InitialSubscription? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get playerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set playerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlayerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlayerId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get deviceId => $_getSZ(3);
  @$pb.TagNumber(4)
  set deviceId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDeviceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceId() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get subscribed => $_getBF(4);
  @$pb.TagNumber(5)
  set subscribed($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSubscribed() => $_has(4);
  @$pb.TagNumber(5)
  void clearSubscribed() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get userSubscriptionSetting => $_getBF(5);
  @$pb.TagNumber(6)
  set userSubscriptionSetting($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUserSubscriptionSetting() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserSubscriptionSetting() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get pushToken => $_getSZ(6);
  @$pb.TagNumber(7)
  set pushToken($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPushToken() => $_has(6);
  @$pb.TagNumber(7)
  void clearPushToken() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get clinicId => $_getSZ(7);
  @$pb.TagNumber(8)
  set clinicId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasClinicId() => $_has(7);
  @$pb.TagNumber(8)
  void clearClinicId() => clearField(8);
}

class InitialSubscriptionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InitialSubscriptionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subscribed')
    ..hasRequiredFields = false
  ;

  InitialSubscriptionResponse._() : super();
  factory InitialSubscriptionResponse({
    $core.String? status,
    $core.bool? subscribed,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (subscribed != null) {
      _result.subscribed = subscribed;
    }
    return _result;
  }
  factory InitialSubscriptionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InitialSubscriptionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InitialSubscriptionResponse clone() => InitialSubscriptionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InitialSubscriptionResponse copyWith(void Function(InitialSubscriptionResponse) updates) => super.copyWith((message) => updates(message as InitialSubscriptionResponse)) as InitialSubscriptionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InitialSubscriptionResponse create() => InitialSubscriptionResponse._();
  InitialSubscriptionResponse createEmptyInstance() => create();
  static $pb.PbList<InitialSubscriptionResponse> createRepeated() => $pb.PbList<InitialSubscriptionResponse>();
  @$core.pragma('dart2js:noInline')
  static InitialSubscriptionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InitialSubscriptionResponse>(create);
  static InitialSubscriptionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get subscribed => $_getBF(1);
  @$pb.TagNumber(2)
  set subscribed($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubscribed() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubscribed() => clearField(2);
}

class UpdateNotification extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateNotification', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subscribed')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientCriticalAlert')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientMessageChat')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientId')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  UpdateNotification._() : super();
  factory UpdateNotification({
    $core.String? userId,
    $core.String? userToken,
    $core.bool? subscribed,
    $core.String? playerId,
    $core.bool? patientCriticalAlert,
    $core.bool? patientMessageChat,
    $core.String? patientId,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (subscribed != null) {
      _result.subscribed = subscribed;
    }
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (patientCriticalAlert != null) {
      _result.patientCriticalAlert = patientCriticalAlert;
    }
    if (patientMessageChat != null) {
      _result.patientMessageChat = patientMessageChat;
    }
    if (patientId != null) {
      _result.patientId = patientId;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory UpdateNotification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateNotification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateNotification clone() => UpdateNotification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateNotification copyWith(void Function(UpdateNotification) updates) => super.copyWith((message) => updates(message as UpdateNotification)) as UpdateNotification; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateNotification create() => UpdateNotification._();
  UpdateNotification createEmptyInstance() => create();
  static $pb.PbList<UpdateNotification> createRepeated() => $pb.PbList<UpdateNotification>();
  @$core.pragma('dart2js:noInline')
  static UpdateNotification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateNotification>(create);
  static UpdateNotification? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get subscribed => $_getBF(2);
  @$pb.TagNumber(3)
  set subscribed($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSubscribed() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubscribed() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get playerId => $_getSZ(3);
  @$pb.TagNumber(4)
  set playerId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPlayerId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlayerId() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get patientCriticalAlert => $_getBF(4);
  @$pb.TagNumber(5)
  set patientCriticalAlert($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPatientCriticalAlert() => $_has(4);
  @$pb.TagNumber(5)
  void clearPatientCriticalAlert() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get patientMessageChat => $_getBF(5);
  @$pb.TagNumber(6)
  set patientMessageChat($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPatientMessageChat() => $_has(5);
  @$pb.TagNumber(6)
  void clearPatientMessageChat() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get patientId => $_getSZ(6);
  @$pb.TagNumber(7)
  set patientId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPatientId() => $_has(6);
  @$pb.TagNumber(7)
  void clearPatientId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get clinicId => $_getSZ(7);
  @$pb.TagNumber(8)
  set clinicId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasClinicId() => $_has(7);
  @$pb.TagNumber(8)
  void clearClinicId() => clearField(8);
}

class UpdateNotificationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateNotificationResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updated')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientCriticalAlert')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientMessageChat')
    ..hasRequiredFields = false
  ;

  UpdateNotificationResponse._() : super();
  factory UpdateNotificationResponse({
    $core.String? patientId,
    $core.String? playerId,
    $core.String? status,
    $core.bool? updated,
    $core.bool? patientCriticalAlert,
    $core.bool? patientMessageChat,
  }) {
    final _result = create();
    if (patientId != null) {
      _result.patientId = patientId;
    }
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (status != null) {
      _result.status = status;
    }
    if (updated != null) {
      _result.updated = updated;
    }
    if (patientCriticalAlert != null) {
      _result.patientCriticalAlert = patientCriticalAlert;
    }
    if (patientMessageChat != null) {
      _result.patientMessageChat = patientMessageChat;
    }
    return _result;
  }
  factory UpdateNotificationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateNotificationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateNotificationResponse clone() => UpdateNotificationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateNotificationResponse copyWith(void Function(UpdateNotificationResponse) updates) => super.copyWith((message) => updates(message as UpdateNotificationResponse)) as UpdateNotificationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateNotificationResponse create() => UpdateNotificationResponse._();
  UpdateNotificationResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateNotificationResponse> createRepeated() => $pb.PbList<UpdateNotificationResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateNotificationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateNotificationResponse>(create);
  static UpdateNotificationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get patientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set patientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPatientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPatientId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get playerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set playerId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlayerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayerId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get status => $_getSZ(2);
  @$pb.TagNumber(3)
  set status($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get updated => $_getBF(3);
  @$pb.TagNumber(4)
  set updated($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUpdated() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdated() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get patientCriticalAlert => $_getBF(4);
  @$pb.TagNumber(5)
  set patientCriticalAlert($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPatientCriticalAlert() => $_has(4);
  @$pb.TagNumber(5)
  void clearPatientCriticalAlert() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get patientMessageChat => $_getBF(5);
  @$pb.TagNumber(6)
  set patientMessageChat($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPatientMessageChat() => $_has(5);
  @$pb.TagNumber(6)
  void clearPatientMessageChat() => clearField(6);
}

class CurrentNotificationStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CurrentNotificationStatus', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  CurrentNotificationStatus._() : super();
  factory CurrentNotificationStatus({
    $core.String? userId,
    $core.String? userToken,
    $core.String? playerId,
    $core.String? patientId,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (patientId != null) {
      _result.patientId = patientId;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory CurrentNotificationStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurrentNotificationStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurrentNotificationStatus clone() => CurrentNotificationStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurrentNotificationStatus copyWith(void Function(CurrentNotificationStatus) updates) => super.copyWith((message) => updates(message as CurrentNotificationStatus)) as CurrentNotificationStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CurrentNotificationStatus create() => CurrentNotificationStatus._();
  CurrentNotificationStatus createEmptyInstance() => create();
  static $pb.PbList<CurrentNotificationStatus> createRepeated() => $pb.PbList<CurrentNotificationStatus>();
  @$core.pragma('dart2js:noInline')
  static CurrentNotificationStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurrentNotificationStatus>(create);
  static CurrentNotificationStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get playerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set playerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlayerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlayerId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get patientId => $_getSZ(3);
  @$pb.TagNumber(4)
  set patientId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPatientId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPatientId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get clinicId => $_getSZ(4);
  @$pb.TagNumber(5)
  set clinicId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasClinicId() => $_has(4);
  @$pb.TagNumber(5)
  void clearClinicId() => clearField(5);
}

class CurrentNotificationStatusResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CurrentNotificationStatusResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subscribed')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientCriticalAlert')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientMessageChat')
    ..hasRequiredFields = false
  ;

  CurrentNotificationStatusResponse._() : super();
  factory CurrentNotificationStatusResponse({
    $core.String? status,
    $core.bool? subscribed,
    $core.bool? patientCriticalAlert,
    $core.bool? patientMessageChat,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (subscribed != null) {
      _result.subscribed = subscribed;
    }
    if (patientCriticalAlert != null) {
      _result.patientCriticalAlert = patientCriticalAlert;
    }
    if (patientMessageChat != null) {
      _result.patientMessageChat = patientMessageChat;
    }
    return _result;
  }
  factory CurrentNotificationStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurrentNotificationStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurrentNotificationStatusResponse clone() => CurrentNotificationStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurrentNotificationStatusResponse copyWith(void Function(CurrentNotificationStatusResponse) updates) => super.copyWith((message) => updates(message as CurrentNotificationStatusResponse)) as CurrentNotificationStatusResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CurrentNotificationStatusResponse create() => CurrentNotificationStatusResponse._();
  CurrentNotificationStatusResponse createEmptyInstance() => create();
  static $pb.PbList<CurrentNotificationStatusResponse> createRepeated() => $pb.PbList<CurrentNotificationStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static CurrentNotificationStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurrentNotificationStatusResponse>(create);
  static CurrentNotificationStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get subscribed => $_getBF(1);
  @$pb.TagNumber(2)
  set subscribed($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubscribed() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubscribed() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get patientCriticalAlert => $_getBF(2);
  @$pb.TagNumber(3)
  set patientCriticalAlert($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPatientCriticalAlert() => $_has(2);
  @$pb.TagNumber(3)
  void clearPatientCriticalAlert() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get patientMessageChat => $_getBF(3);
  @$pb.TagNumber(4)
  set patientMessageChat($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPatientMessageChat() => $_has(3);
  @$pb.TagNumber(4)
  void clearPatientMessageChat() => clearField(4);
}

class DoctorInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoctorInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpId', $pb.PbFieldType.O3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  DoctorInfo._() : super();
  factory DoctorInfo({
    $core.String? userToken,
    $core.String? userId,
    $core.int? folloUpId,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (folloUpId != null) {
      _result.folloUpId = folloUpId;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory DoctorInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DoctorInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DoctorInfo clone() => DoctorInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DoctorInfo copyWith(void Function(DoctorInfo) updates) => super.copyWith((message) => updates(message as DoctorInfo)) as DoctorInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoctorInfo create() => DoctorInfo._();
  DoctorInfo createEmptyInstance() => create();
  static $pb.PbList<DoctorInfo> createRepeated() => $pb.PbList<DoctorInfo>();
  @$core.pragma('dart2js:noInline')
  static DoctorInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoctorInfo>(create);
  static DoctorInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set userToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get folloUpId => $_getIZ(2);
  @$pb.TagNumber(3)
  set folloUpId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFolloUpId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFolloUpId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get clinicId => $_getSZ(3);
  @$pb.TagNumber(4)
  set clinicId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasClinicId() => $_has(3);
  @$pb.TagNumber(4)
  void clearClinicId() => clearField(4);
}

class Caregiver extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Caregiver', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userType')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role')
    ..hasRequiredFields = false
  ;

  Caregiver._() : super();
  factory Caregiver({
    $core.String? userId,
    $core.String? name,
    $core.String? userType,
    $core.String? role,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (userType != null) {
      _result.userType = userType;
    }
    if (role != null) {
      _result.role = role;
    }
    return _result;
  }
  factory Caregiver.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Caregiver.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Caregiver clone() => Caregiver()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Caregiver copyWith(void Function(Caregiver) updates) => super.copyWith((message) => updates(message as Caregiver)) as Caregiver; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Caregiver create() => Caregiver._();
  Caregiver createEmptyInstance() => create();
  static $pb.PbList<Caregiver> createRepeated() => $pb.PbList<Caregiver>();
  @$core.pragma('dart2js:noInline')
  static Caregiver getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Caregiver>(create);
  static Caregiver? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userType => $_getSZ(2);
  @$pb.TagNumber(3)
  set userType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserType() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get role => $_getSZ(3);
  @$pb.TagNumber(4)
  set role($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearRole() => clearField(4);
}

class CaregiverSpeciality extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CaregiverSpeciality', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'specialityId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  CaregiverSpeciality._() : super();
  factory CaregiverSpeciality({
    $core.String? specialityId,
    $core.String? name,
  }) {
    final _result = create();
    if (specialityId != null) {
      _result.specialityId = specialityId;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory CaregiverSpeciality.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CaregiverSpeciality.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CaregiverSpeciality clone() => CaregiverSpeciality()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CaregiverSpeciality copyWith(void Function(CaregiverSpeciality) updates) => super.copyWith((message) => updates(message as CaregiverSpeciality)) as CaregiverSpeciality; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CaregiverSpeciality create() => CaregiverSpeciality._();
  CaregiverSpeciality createEmptyInstance() => create();
  static $pb.PbList<CaregiverSpeciality> createRepeated() => $pb.PbList<CaregiverSpeciality>();
  @$core.pragma('dart2js:noInline')
  static CaregiverSpeciality getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CaregiverSpeciality>(create);
  static CaregiverSpeciality? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get specialityId => $_getSZ(0);
  @$pb.TagNumber(1)
  set specialityId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSpecialityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSpecialityId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class Language extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Language', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'languageId')
    ..hasRequiredFields = false
  ;

  Language._() : super();
  factory Language({
    $core.String? name,
    $core.String? languageId,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (languageId != null) {
      _result.languageId = languageId;
    }
    return _result;
  }
  factory Language.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Language.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Language clone() => Language()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Language copyWith(void Function(Language) updates) => super.copyWith((message) => updates(message as Language)) as Language; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Language create() => Language._();
  Language createEmptyInstance() => create();
  static $pb.PbList<Language> createRepeated() => $pb.PbList<Language>();
  @$core.pragma('dart2js:noInline')
  static Language getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Language>(create);
  static Language? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get languageId => $_getSZ(1);
  @$pb.TagNumber(2)
  set languageId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLanguageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLanguageId() => clearField(2);
}

class DoctorInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoctorInfoResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<Media>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'profilePicture', subBuilder: Media.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'licenseNumber')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'experience', $pb.PbFieldType.O3)
    ..pc<CaregiverSpeciality>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'specialities', $pb.PbFieldType.PM, subBuilder: CaregiverSpeciality.create)
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'about')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'qualifications')
    ..pc<Language>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'languages', $pb.PbFieldType.PM, subBuilder: Language.create)
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  DoctorInfoResponse._() : super();
  factory DoctorInfoResponse({
    $core.String? status,
    $core.String? email,
    $core.String? mobileNumber,
    $core.String? name,
    Media? profilePicture,
    $core.String? licenseNumber,
    $core.int? experience,
    $core.Iterable<CaregiverSpeciality>? specialities,
    $core.String? userId,
    $core.String? about,
    $core.String? qualifications,
    $core.Iterable<Language>? languages,
    $core.String? address,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (email != null) {
      _result.email = email;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (name != null) {
      _result.name = name;
    }
    if (profilePicture != null) {
      _result.profilePicture = profilePicture;
    }
    if (licenseNumber != null) {
      _result.licenseNumber = licenseNumber;
    }
    if (experience != null) {
      _result.experience = experience;
    }
    if (specialities != null) {
      _result.specialities.addAll(specialities);
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (about != null) {
      _result.about = about;
    }
    if (qualifications != null) {
      _result.qualifications = qualifications;
    }
    if (languages != null) {
      _result.languages.addAll(languages);
    }
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory DoctorInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DoctorInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DoctorInfoResponse clone() => DoctorInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DoctorInfoResponse copyWith(void Function(DoctorInfoResponse) updates) => super.copyWith((message) => updates(message as DoctorInfoResponse)) as DoctorInfoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoctorInfoResponse create() => DoctorInfoResponse._();
  DoctorInfoResponse createEmptyInstance() => create();
  static $pb.PbList<DoctorInfoResponse> createRepeated() => $pb.PbList<DoctorInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static DoctorInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoctorInfoResponse>(create);
  static DoctorInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mobileNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set mobileNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMobileNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearMobileNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  Media get profilePicture => $_getN(4);
  @$pb.TagNumber(5)
  set profilePicture(Media v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasProfilePicture() => $_has(4);
  @$pb.TagNumber(5)
  void clearProfilePicture() => clearField(5);
  @$pb.TagNumber(5)
  Media ensureProfilePicture() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get licenseNumber => $_getSZ(5);
  @$pb.TagNumber(6)
  set licenseNumber($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLicenseNumber() => $_has(5);
  @$pb.TagNumber(6)
  void clearLicenseNumber() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get experience => $_getIZ(6);
  @$pb.TagNumber(7)
  set experience($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasExperience() => $_has(6);
  @$pb.TagNumber(7)
  void clearExperience() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<CaregiverSpeciality> get specialities => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get userId => $_getSZ(8);
  @$pb.TagNumber(9)
  set userId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasUserId() => $_has(8);
  @$pb.TagNumber(9)
  void clearUserId() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get about => $_getSZ(9);
  @$pb.TagNumber(10)
  set about($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAbout() => $_has(9);
  @$pb.TagNumber(10)
  void clearAbout() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get qualifications => $_getSZ(10);
  @$pb.TagNumber(11)
  set qualifications($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasQualifications() => $_has(10);
  @$pb.TagNumber(11)
  void clearQualifications() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<Language> get languages => $_getList(11);

  @$pb.TagNumber(13)
  $core.String get address => $_getSZ(12);
  @$pb.TagNumber(13)
  set address($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasAddress() => $_has(12);
  @$pb.TagNumber(13)
  void clearAddress() => clearField(13);
}

class ClinicInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ClinicInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  ClinicInfo._() : super();
  factory ClinicInfo({
    $core.String? userToken,
    $core.String? userId,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory ClinicInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClinicInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClinicInfo clone() => ClinicInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClinicInfo copyWith(void Function(ClinicInfo) updates) => super.copyWith((message) => updates(message as ClinicInfo)) as ClinicInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClinicInfo create() => ClinicInfo._();
  ClinicInfo createEmptyInstance() => create();
  static $pb.PbList<ClinicInfo> createRepeated() => $pb.PbList<ClinicInfo>();
  @$core.pragma('dart2js:noInline')
  static ClinicInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClinicInfo>(create);
  static ClinicInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set userToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get clinicId => $_getSZ(2);
  @$pb.TagNumber(3)
  set clinicId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClinicId() => $_has(2);
  @$pb.TagNumber(3)
  void clearClinicId() => clearField(3);
}

class Department extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Department', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'departmentId')
    ..hasRequiredFields = false
  ;

  Department._() : super();
  factory Department({
    $core.String? name,
    $core.String? departmentId,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (departmentId != null) {
      _result.departmentId = departmentId;
    }
    return _result;
  }
  factory Department.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Department.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Department clone() => Department()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Department copyWith(void Function(Department) updates) => super.copyWith((message) => updates(message as Department)) as Department; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Department create() => Department._();
  Department createEmptyInstance() => create();
  static $pb.PbList<Department> createRepeated() => $pb.PbList<Department>();
  @$core.pragma('dart2js:noInline')
  static Department getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Department>(create);
  static Department? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get departmentId => $_getSZ(1);
  @$pb.TagNumber(2)
  set departmentId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDepartmentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDepartmentId() => clearField(2);
}

class ClinicInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ClinicInfoResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<Media>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'photo', subBuilder: Media.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'about')
    ..pc<Department>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'departments', $pb.PbFieldType.PM, subBuilder: Department.create)
    ..hasRequiredFields = false
  ;

  ClinicInfoResponse._() : super();
  factory ClinicInfoResponse({
    $core.String? status,
    $core.String? clinicId,
    $core.String? name,
    Media? photo,
    $core.String? address,
    $core.String? mobileNumber,
    $core.String? about,
    $core.Iterable<Department>? departments,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (photo != null) {
      _result.photo = photo;
    }
    if (address != null) {
      _result.address = address;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (about != null) {
      _result.about = about;
    }
    if (departments != null) {
      _result.departments.addAll(departments);
    }
    return _result;
  }
  factory ClinicInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClinicInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClinicInfoResponse clone() => ClinicInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClinicInfoResponse copyWith(void Function(ClinicInfoResponse) updates) => super.copyWith((message) => updates(message as ClinicInfoResponse)) as ClinicInfoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClinicInfoResponse create() => ClinicInfoResponse._();
  ClinicInfoResponse createEmptyInstance() => create();
  static $pb.PbList<ClinicInfoResponse> createRepeated() => $pb.PbList<ClinicInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static ClinicInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClinicInfoResponse>(create);
  static ClinicInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get clinicId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clinicId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClinicId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClinicId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  Media get photo => $_getN(3);
  @$pb.TagNumber(4)
  set photo(Media v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPhoto() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhoto() => clearField(4);
  @$pb.TagNumber(4)
  Media ensurePhoto() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get address => $_getSZ(4);
  @$pb.TagNumber(5)
  set address($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAddress() => $_has(4);
  @$pb.TagNumber(5)
  void clearAddress() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get mobileNumber => $_getSZ(5);
  @$pb.TagNumber(6)
  set mobileNumber($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMobileNumber() => $_has(5);
  @$pb.TagNumber(6)
  void clearMobileNumber() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get about => $_getSZ(6);
  @$pb.TagNumber(7)
  set about($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAbout() => $_has(6);
  @$pb.TagNumber(7)
  void clearAbout() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<Department> get departments => $_getList(7);
}

class ConversationMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConversationMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mediaPresent')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'platform')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..pc<Media>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'media', $pb.PbFieldType.PM, subBuilder: Media.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trafficType')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp')
    ..hasRequiredFields = false
  ;

  ConversationMessage._() : super();
  factory ConversationMessage({
    $core.bool? mediaPresent,
    $core.String? platform,
    $core.String? text,
    $core.Iterable<Media>? media,
    $core.String? trafficType,
    $fixnum.Int64? timestamp,
  }) {
    final _result = create();
    if (mediaPresent != null) {
      _result.mediaPresent = mediaPresent;
    }
    if (platform != null) {
      _result.platform = platform;
    }
    if (text != null) {
      _result.text = text;
    }
    if (media != null) {
      _result.media.addAll(media);
    }
    if (trafficType != null) {
      _result.trafficType = trafficType;
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    return _result;
  }
  factory ConversationMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConversationMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConversationMessage clone() => ConversationMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConversationMessage copyWith(void Function(ConversationMessage) updates) => super.copyWith((message) => updates(message as ConversationMessage)) as ConversationMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConversationMessage create() => ConversationMessage._();
  ConversationMessage createEmptyInstance() => create();
  static $pb.PbList<ConversationMessage> createRepeated() => $pb.PbList<ConversationMessage>();
  @$core.pragma('dart2js:noInline')
  static ConversationMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConversationMessage>(create);
  static ConversationMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get mediaPresent => $_getBF(0);
  @$pb.TagNumber(1)
  set mediaPresent($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMediaPresent() => $_has(0);
  @$pb.TagNumber(1)
  void clearMediaPresent() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get platform => $_getSZ(1);
  @$pb.TagNumber(2)
  set platform($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlatform() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlatform() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(2);
  @$pb.TagNumber(3)
  set text($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);
  @$pb.TagNumber(3)
  void clearText() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<Media> get media => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get trafficType => $_getSZ(4);
  @$pb.TagNumber(5)
  set trafficType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTrafficType() => $_has(4);
  @$pb.TagNumber(5)
  void clearTrafficType() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get timestamp => $_getI64(5);
  @$pb.TagNumber(6)
  set timestamp($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTimestamp() => $_has(5);
  @$pb.TagNumber(6)
  void clearTimestamp() => clearField(6);
}

class Conversation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Conversation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'conversationId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpStartTimestamp')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latestActivityTimestamp')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpStatus')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'activeAlert')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attendedByCaregiverName')
    ..pc<Media>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientAttachments', $pb.PbFieldType.PM, subBuilder: Media.create)
    ..pc<ConversationMessage>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'conversationMessages', $pb.PbFieldType.PM, subBuilder: ConversationMessage.create)
    ..aInt64(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastRetryTimestamp')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'retryAttempts', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Conversation._() : super();
  factory Conversation({
    $core.String? conversationId,
    $fixnum.Int64? folloUpStartTimestamp,
    $fixnum.Int64? latestActivityTimestamp,
    $core.String? folloUpStatus,
    $core.String? activeAlert,
    $core.String? attendedByCaregiverName,
    $core.Iterable<Media>? patientAttachments,
    $core.Iterable<ConversationMessage>? conversationMessages,
    $fixnum.Int64? lastRetryTimestamp,
    $core.int? retryAttempts,
  }) {
    final _result = create();
    if (conversationId != null) {
      _result.conversationId = conversationId;
    }
    if (folloUpStartTimestamp != null) {
      _result.folloUpStartTimestamp = folloUpStartTimestamp;
    }
    if (latestActivityTimestamp != null) {
      _result.latestActivityTimestamp = latestActivityTimestamp;
    }
    if (folloUpStatus != null) {
      _result.folloUpStatus = folloUpStatus;
    }
    if (activeAlert != null) {
      _result.activeAlert = activeAlert;
    }
    if (attendedByCaregiverName != null) {
      _result.attendedByCaregiverName = attendedByCaregiverName;
    }
    if (patientAttachments != null) {
      _result.patientAttachments.addAll(patientAttachments);
    }
    if (conversationMessages != null) {
      _result.conversationMessages.addAll(conversationMessages);
    }
    if (lastRetryTimestamp != null) {
      _result.lastRetryTimestamp = lastRetryTimestamp;
    }
    if (retryAttempts != null) {
      _result.retryAttempts = retryAttempts;
    }
    return _result;
  }
  factory Conversation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Conversation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Conversation clone() => Conversation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Conversation copyWith(void Function(Conversation) updates) => super.copyWith((message) => updates(message as Conversation)) as Conversation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Conversation create() => Conversation._();
  Conversation createEmptyInstance() => create();
  static $pb.PbList<Conversation> createRepeated() => $pb.PbList<Conversation>();
  @$core.pragma('dart2js:noInline')
  static Conversation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Conversation>(create);
  static Conversation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get conversationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set conversationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasConversationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConversationId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get folloUpStartTimestamp => $_getI64(1);
  @$pb.TagNumber(2)
  set folloUpStartTimestamp($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFolloUpStartTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearFolloUpStartTimestamp() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get latestActivityTimestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set latestActivityTimestamp($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLatestActivityTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatestActivityTimestamp() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get folloUpStatus => $_getSZ(3);
  @$pb.TagNumber(4)
  set folloUpStatus($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFolloUpStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearFolloUpStatus() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get activeAlert => $_getSZ(4);
  @$pb.TagNumber(5)
  set activeAlert($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasActiveAlert() => $_has(4);
  @$pb.TagNumber(5)
  void clearActiveAlert() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get attendedByCaregiverName => $_getSZ(5);
  @$pb.TagNumber(6)
  set attendedByCaregiverName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAttendedByCaregiverName() => $_has(5);
  @$pb.TagNumber(6)
  void clearAttendedByCaregiverName() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<Media> get patientAttachments => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<ConversationMessage> get conversationMessages => $_getList(7);

  @$pb.TagNumber(9)
  $fixnum.Int64 get lastRetryTimestamp => $_getI64(8);
  @$pb.TagNumber(9)
  set lastRetryTimestamp($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLastRetryTimestamp() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastRetryTimestamp() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get retryAttempts => $_getIZ(9);
  @$pb.TagNumber(10)
  set retryAttempts($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasRetryAttempts() => $_has(9);
  @$pb.TagNumber(10)
  void clearRetryAttempts() => clearField(10);
}

class FolloUp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FolloUp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'diseaseId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'diseaseName')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpRegistrationTimestamp')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'caregiverName')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'caregiverOnline')
    ..pc<Conversation>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'conversations', $pb.PbFieldType.PM, subBuilder: Conversation.create)
    ..hasRequiredFields = false
  ;

  FolloUp._() : super();
  factory FolloUp({
    $core.int? folloUpId,
    $core.String? diseaseId,
    $core.String? diseaseName,
    $fixnum.Int64? folloUpRegistrationTimestamp,
    $core.String? caregiverName,
    $core.bool? caregiverOnline,
    $core.Iterable<Conversation>? conversations,
  }) {
    final _result = create();
    if (folloUpId != null) {
      _result.folloUpId = folloUpId;
    }
    if (diseaseId != null) {
      _result.diseaseId = diseaseId;
    }
    if (diseaseName != null) {
      _result.diseaseName = diseaseName;
    }
    if (folloUpRegistrationTimestamp != null) {
      _result.folloUpRegistrationTimestamp = folloUpRegistrationTimestamp;
    }
    if (caregiverName != null) {
      _result.caregiverName = caregiverName;
    }
    if (caregiverOnline != null) {
      _result.caregiverOnline = caregiverOnline;
    }
    if (conversations != null) {
      _result.conversations.addAll(conversations);
    }
    return _result;
  }
  factory FolloUp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FolloUp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FolloUp clone() => FolloUp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FolloUp copyWith(void Function(FolloUp) updates) => super.copyWith((message) => updates(message as FolloUp)) as FolloUp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FolloUp create() => FolloUp._();
  FolloUp createEmptyInstance() => create();
  static $pb.PbList<FolloUp> createRepeated() => $pb.PbList<FolloUp>();
  @$core.pragma('dart2js:noInline')
  static FolloUp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FolloUp>(create);
  static FolloUp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get folloUpId => $_getIZ(0);
  @$pb.TagNumber(1)
  set folloUpId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFolloUpId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFolloUpId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get diseaseId => $_getSZ(1);
  @$pb.TagNumber(2)
  set diseaseId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDiseaseId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDiseaseId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get diseaseName => $_getSZ(2);
  @$pb.TagNumber(3)
  set diseaseName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDiseaseName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDiseaseName() => clearField(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get folloUpRegistrationTimestamp => $_getI64(3);
  @$pb.TagNumber(5)
  set folloUpRegistrationTimestamp($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasFolloUpRegistrationTimestamp() => $_has(3);
  @$pb.TagNumber(5)
  void clearFolloUpRegistrationTimestamp() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get caregiverName => $_getSZ(4);
  @$pb.TagNumber(6)
  set caregiverName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasCaregiverName() => $_has(4);
  @$pb.TagNumber(6)
  void clearCaregiverName() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get caregiverOnline => $_getBF(5);
  @$pb.TagNumber(7)
  set caregiverOnline($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasCaregiverOnline() => $_has(5);
  @$pb.TagNumber(7)
  void clearCaregiverOnline() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<Conversation> get conversations => $_getList(6);
}

class NewFollo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewFollo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'conversationId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'diseaseId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'diseaseName')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpRegistrationTimestamp')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'caregiverName')
    ..aInt64(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpStartTimestamp')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpStatus')
    ..hasRequiredFields = false
  ;

  NewFollo._() : super();
  factory NewFollo({
    $core.int? folloUpId,
    $core.String? conversationId,
    $core.String? diseaseId,
    $core.String? diseaseName,
    $fixnum.Int64? folloUpRegistrationTimestamp,
    $core.String? caregiverName,
    $fixnum.Int64? folloUpStartTimestamp,
    $core.String? folloUpStatus,
  }) {
    final _result = create();
    if (folloUpId != null) {
      _result.folloUpId = folloUpId;
    }
    if (conversationId != null) {
      _result.conversationId = conversationId;
    }
    if (diseaseId != null) {
      _result.diseaseId = diseaseId;
    }
    if (diseaseName != null) {
      _result.diseaseName = diseaseName;
    }
    if (folloUpRegistrationTimestamp != null) {
      _result.folloUpRegistrationTimestamp = folloUpRegistrationTimestamp;
    }
    if (caregiverName != null) {
      _result.caregiverName = caregiverName;
    }
    if (folloUpStartTimestamp != null) {
      _result.folloUpStartTimestamp = folloUpStartTimestamp;
    }
    if (folloUpStatus != null) {
      _result.folloUpStatus = folloUpStatus;
    }
    return _result;
  }
  factory NewFollo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewFollo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewFollo clone() => NewFollo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewFollo copyWith(void Function(NewFollo) updates) => super.copyWith((message) => updates(message as NewFollo)) as NewFollo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewFollo create() => NewFollo._();
  NewFollo createEmptyInstance() => create();
  static $pb.PbList<NewFollo> createRepeated() => $pb.PbList<NewFollo>();
  @$core.pragma('dart2js:noInline')
  static NewFollo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewFollo>(create);
  static NewFollo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get folloUpId => $_getIZ(0);
  @$pb.TagNumber(1)
  set folloUpId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFolloUpId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFolloUpId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get conversationId => $_getSZ(1);
  @$pb.TagNumber(2)
  set conversationId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasConversationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearConversationId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get diseaseId => $_getSZ(2);
  @$pb.TagNumber(3)
  set diseaseId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDiseaseId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDiseaseId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get diseaseName => $_getSZ(3);
  @$pb.TagNumber(4)
  set diseaseName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDiseaseName() => $_has(3);
  @$pb.TagNumber(4)
  void clearDiseaseName() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get folloUpRegistrationTimestamp => $_getI64(4);
  @$pb.TagNumber(5)
  set folloUpRegistrationTimestamp($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFolloUpRegistrationTimestamp() => $_has(4);
  @$pb.TagNumber(5)
  void clearFolloUpRegistrationTimestamp() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get caregiverName => $_getSZ(5);
  @$pb.TagNumber(6)
  set caregiverName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCaregiverName() => $_has(5);
  @$pb.TagNumber(6)
  void clearCaregiverName() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get folloUpStartTimestamp => $_getI64(6);
  @$pb.TagNumber(7)
  set folloUpStartTimestamp($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasFolloUpStartTimestamp() => $_has(6);
  @$pb.TagNumber(7)
  void clearFolloUpStartTimestamp() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get folloUpStatus => $_getSZ(7);
  @$pb.TagNumber(8)
  set folloUpStatus($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFolloUpStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearFolloUpStatus() => clearField(8);
}

class FolloUpList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FolloUpList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterByCaregiverId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'caregiverId')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTimestamp')
    ..aInt64(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endTimestamp')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterByTimestamp')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterByPatientProfileId')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientProfileId')
    ..hasRequiredFields = false
  ;

  FolloUpList._() : super();
  factory FolloUpList({
    $core.String? userId,
    $core.String? userToken,
    $core.String? clinicId,
    $core.bool? filterByCaregiverId,
    $core.String? caregiverId,
    $fixnum.Int64? startTimestamp,
    $fixnum.Int64? endTimestamp,
    $core.bool? filterByTimestamp,
    $core.bool? filterByPatientProfileId,
    $core.String? patientProfileId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    if (filterByCaregiverId != null) {
      _result.filterByCaregiverId = filterByCaregiverId;
    }
    if (caregiverId != null) {
      _result.caregiverId = caregiverId;
    }
    if (startTimestamp != null) {
      _result.startTimestamp = startTimestamp;
    }
    if (endTimestamp != null) {
      _result.endTimestamp = endTimestamp;
    }
    if (filterByTimestamp != null) {
      _result.filterByTimestamp = filterByTimestamp;
    }
    if (filterByPatientProfileId != null) {
      _result.filterByPatientProfileId = filterByPatientProfileId;
    }
    if (patientProfileId != null) {
      _result.patientProfileId = patientProfileId;
    }
    return _result;
  }
  factory FolloUpList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FolloUpList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FolloUpList clone() => FolloUpList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FolloUpList copyWith(void Function(FolloUpList) updates) => super.copyWith((message) => updates(message as FolloUpList)) as FolloUpList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FolloUpList create() => FolloUpList._();
  FolloUpList createEmptyInstance() => create();
  static $pb.PbList<FolloUpList> createRepeated() => $pb.PbList<FolloUpList>();
  @$core.pragma('dart2js:noInline')
  static FolloUpList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FolloUpList>(create);
  static FolloUpList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get clinicId => $_getSZ(2);
  @$pb.TagNumber(3)
  set clinicId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClinicId() => $_has(2);
  @$pb.TagNumber(3)
  void clearClinicId() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get filterByCaregiverId => $_getBF(3);
  @$pb.TagNumber(4)
  set filterByCaregiverId($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFilterByCaregiverId() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilterByCaregiverId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get caregiverId => $_getSZ(4);
  @$pb.TagNumber(5)
  set caregiverId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCaregiverId() => $_has(4);
  @$pb.TagNumber(5)
  void clearCaregiverId() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get startTimestamp => $_getI64(5);
  @$pb.TagNumber(6)
  set startTimestamp($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStartTimestamp() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartTimestamp() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get endTimestamp => $_getI64(6);
  @$pb.TagNumber(7)
  set endTimestamp($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasEndTimestamp() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndTimestamp() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get filterByTimestamp => $_getBF(7);
  @$pb.TagNumber(8)
  set filterByTimestamp($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFilterByTimestamp() => $_has(7);
  @$pb.TagNumber(8)
  void clearFilterByTimestamp() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get filterByPatientProfileId => $_getBF(8);
  @$pb.TagNumber(9)
  set filterByPatientProfileId($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasFilterByPatientProfileId() => $_has(8);
  @$pb.TagNumber(9)
  void clearFilterByPatientProfileId() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get patientProfileId => $_getSZ(9);
  @$pb.TagNumber(10)
  set patientProfileId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPatientProfileId() => $_has(9);
  @$pb.TagNumber(10)
  void clearPatientProfileId() => clearField(10);
}

class FolloData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FolloData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpStatus')
    ..pc<NewFollo>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpsList', $pb.PbFieldType.PM, subBuilder: NewFollo.create)
    ..hasRequiredFields = false
  ;

  FolloData._() : super();
  factory FolloData({
    $core.String? folloUpStatus,
    $core.Iterable<NewFollo>? folloUpsList,
  }) {
    final _result = create();
    if (folloUpStatus != null) {
      _result.folloUpStatus = folloUpStatus;
    }
    if (folloUpsList != null) {
      _result.folloUpsList.addAll(folloUpsList);
    }
    return _result;
  }
  factory FolloData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FolloData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FolloData clone() => FolloData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FolloData copyWith(void Function(FolloData) updates) => super.copyWith((message) => updates(message as FolloData)) as FolloData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FolloData create() => FolloData._();
  FolloData createEmptyInstance() => create();
  static $pb.PbList<FolloData> createRepeated() => $pb.PbList<FolloData>();
  @$core.pragma('dart2js:noInline')
  static FolloData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FolloData>(create);
  static FolloData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get folloUpStatus => $_getSZ(0);
  @$pb.TagNumber(1)
  set folloUpStatus($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFolloUpStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearFolloUpStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<NewFollo> get folloUpsList => $_getList(1);
}

class FolloUpListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FolloUpListResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..pc<FolloData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloList', $pb.PbFieldType.PM, subBuilder: FolloData.create)
    ..hasRequiredFields = false
  ;

  FolloUpListResponse._() : super();
  factory FolloUpListResponse({
    $core.String? status,
    $core.Iterable<FolloData>? folloList,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (folloList != null) {
      _result.folloList.addAll(folloList);
    }
    return _result;
  }
  factory FolloUpListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FolloUpListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FolloUpListResponse clone() => FolloUpListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FolloUpListResponse copyWith(void Function(FolloUpListResponse) updates) => super.copyWith((message) => updates(message as FolloUpListResponse)) as FolloUpListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FolloUpListResponse create() => FolloUpListResponse._();
  FolloUpListResponse createEmptyInstance() => create();
  static $pb.PbList<FolloUpListResponse> createRepeated() => $pb.PbList<FolloUpListResponse>();
  @$core.pragma('dart2js:noInline')
  static FolloUpListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FolloUpListResponse>(create);
  static FolloUpListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<FolloData> get folloList => $_getList(1);
}

class AppStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AppStatus', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appInBackground')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  AppStatus._() : super();
  factory AppStatus({
    $core.String? userId,
    $core.String? userToken,
    $core.bool? appInBackground,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (appInBackground != null) {
      _result.appInBackground = appInBackground;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory AppStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppStatus clone() => AppStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppStatus copyWith(void Function(AppStatus) updates) => super.copyWith((message) => updates(message as AppStatus)) as AppStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppStatus create() => AppStatus._();
  AppStatus createEmptyInstance() => create();
  static $pb.PbList<AppStatus> createRepeated() => $pb.PbList<AppStatus>();
  @$core.pragma('dart2js:noInline')
  static AppStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppStatus>(create);
  static AppStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get appInBackground => $_getBF(2);
  @$pb.TagNumber(3)
  set appInBackground($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAppInBackground() => $_has(2);
  @$pb.TagNumber(3)
  void clearAppInBackground() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get clinicId => $_getSZ(3);
  @$pb.TagNumber(4)
  set clinicId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasClinicId() => $_has(3);
  @$pb.TagNumber(4)
  void clearClinicId() => clearField(4);
}

class AppStatusResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AppStatusResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..hasRequiredFields = false
  ;

  AppStatusResponse._() : super();
  factory AppStatusResponse({
    $core.String? status,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory AppStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppStatusResponse clone() => AppStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppStatusResponse copyWith(void Function(AppStatusResponse) updates) => super.copyWith((message) => updates(message as AppStatusResponse)) as AppStatusResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppStatusResponse create() => AppStatusResponse._();
  AppStatusResponse createEmptyInstance() => create();
  static $pb.PbList<AppStatusResponse> createRepeated() => $pb.PbList<AppStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static AppStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppStatusResponse>(create);
  static AppStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class AppUninstall extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AppUninstall', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appUninstalled')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  AppUninstall._() : super();
  factory AppUninstall({
    $core.String? userId,
    $core.String? userToken,
    $core.bool? appUninstalled,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (appUninstalled != null) {
      _result.appUninstalled = appUninstalled;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory AppUninstall.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppUninstall.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppUninstall clone() => AppUninstall()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppUninstall copyWith(void Function(AppUninstall) updates) => super.copyWith((message) => updates(message as AppUninstall)) as AppUninstall; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppUninstall create() => AppUninstall._();
  AppUninstall createEmptyInstance() => create();
  static $pb.PbList<AppUninstall> createRepeated() => $pb.PbList<AppUninstall>();
  @$core.pragma('dart2js:noInline')
  static AppUninstall getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppUninstall>(create);
  static AppUninstall? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get appUninstalled => $_getBF(2);
  @$pb.TagNumber(3)
  set appUninstalled($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAppUninstalled() => $_has(2);
  @$pb.TagNumber(3)
  void clearAppUninstalled() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get clinicId => $_getSZ(3);
  @$pb.TagNumber(4)
  set clinicId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasClinicId() => $_has(3);
  @$pb.TagNumber(4)
  void clearClinicId() => clearField(4);
}

class AppUninstallResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AppUninstallResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..hasRequiredFields = false
  ;

  AppUninstallResponse._() : super();
  factory AppUninstallResponse({
    $core.String? status,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory AppUninstallResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppUninstallResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppUninstallResponse clone() => AppUninstallResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppUninstallResponse copyWith(void Function(AppUninstallResponse) updates) => super.copyWith((message) => updates(message as AppUninstallResponse)) as AppUninstallResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppUninstallResponse create() => AppUninstallResponse._();
  AppUninstallResponse createEmptyInstance() => create();
  static $pb.PbList<AppUninstallResponse> createRepeated() => $pb.PbList<AppUninstallResponse>();
  @$core.pragma('dart2js:noInline')
  static AppUninstallResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppUninstallResponse>(create);
  static AppUninstallResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class FolloUpStats extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FolloUpStats', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTimestamp')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endTimestamp')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterByTimestamp')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterByPatientProfileId')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientProfileId')
    ..hasRequiredFields = false
  ;

  FolloUpStats._() : super();
  factory FolloUpStats({
    $core.String? userId,
    $core.String? userToken,
    $fixnum.Int64? startTimestamp,
    $fixnum.Int64? endTimestamp,
    $core.String? clinicId,
    $core.bool? filterByTimestamp,
    $core.bool? filterByPatientProfileId,
    $core.String? patientProfileId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (startTimestamp != null) {
      _result.startTimestamp = startTimestamp;
    }
    if (endTimestamp != null) {
      _result.endTimestamp = endTimestamp;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    if (filterByTimestamp != null) {
      _result.filterByTimestamp = filterByTimestamp;
    }
    if (filterByPatientProfileId != null) {
      _result.filterByPatientProfileId = filterByPatientProfileId;
    }
    if (patientProfileId != null) {
      _result.patientProfileId = patientProfileId;
    }
    return _result;
  }
  factory FolloUpStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FolloUpStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FolloUpStats clone() => FolloUpStats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FolloUpStats copyWith(void Function(FolloUpStats) updates) => super.copyWith((message) => updates(message as FolloUpStats)) as FolloUpStats; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FolloUpStats create() => FolloUpStats._();
  FolloUpStats createEmptyInstance() => create();
  static $pb.PbList<FolloUpStats> createRepeated() => $pb.PbList<FolloUpStats>();
  @$core.pragma('dart2js:noInline')
  static FolloUpStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FolloUpStats>(create);
  static FolloUpStats? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get startTimestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set startTimestamp($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStartTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartTimestamp() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get endTimestamp => $_getI64(3);
  @$pb.TagNumber(4)
  set endTimestamp($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEndTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndTimestamp() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get clinicId => $_getSZ(4);
  @$pb.TagNumber(5)
  set clinicId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasClinicId() => $_has(4);
  @$pb.TagNumber(5)
  void clearClinicId() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get filterByTimestamp => $_getBF(5);
  @$pb.TagNumber(6)
  set filterByTimestamp($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFilterByTimestamp() => $_has(5);
  @$pb.TagNumber(6)
  void clearFilterByTimestamp() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get filterByPatientProfileId => $_getBF(6);
  @$pb.TagNumber(7)
  set filterByPatientProfileId($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasFilterByPatientProfileId() => $_has(6);
  @$pb.TagNumber(7)
  void clearFilterByPatientProfileId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get patientProfileId => $_getSZ(7);
  @$pb.TagNumber(8)
  set patientProfileId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPatientProfileId() => $_has(7);
  @$pb.TagNumber(8)
  void clearPatientProfileId() => clearField(8);
}

class StatusCount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StatusCount', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'total')
    ..hasRequiredFields = false
  ;

  StatusCount._() : super();
  factory StatusCount({
    $core.String? id,
    $core.String? total,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (total != null) {
      _result.total = total;
    }
    return _result;
  }
  factory StatusCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StatusCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StatusCount clone() => StatusCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StatusCount copyWith(void Function(StatusCount) updates) => super.copyWith((message) => updates(message as StatusCount)) as StatusCount; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StatusCount create() => StatusCount._();
  StatusCount createEmptyInstance() => create();
  static $pb.PbList<StatusCount> createRepeated() => $pb.PbList<StatusCount>();
  @$core.pragma('dart2js:noInline')
  static StatusCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StatusCount>(create);
  static StatusCount? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get total => $_getSZ(1);
  @$pb.TagNumber(2)
  set total($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);
}

class DrInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DrInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<Media>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'profilePicture', subBuilder: Media.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'qualifications')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'licenseNumber')
    ..pc<CaregiverSpeciality>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'specialities', $pb.PbFieldType.PM, subBuilder: CaregiverSpeciality.create)
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'experience', $pb.PbFieldType.O3)
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'about')
    ..pc<Language>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'languages', $pb.PbFieldType.PM, subBuilder: Language.create)
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  DrInfo._() : super();
  factory DrInfo({
    $core.String? userId,
    Media? profilePicture,
    $core.String? name,
    $core.String? qualifications,
    $core.String? mobileNumber,
    $core.String? licenseNumber,
    $core.Iterable<CaregiverSpeciality>? specialities,
    $core.int? experience,
    $core.String? email,
    $core.String? about,
    $core.Iterable<Language>? languages,
    $core.String? address,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (profilePicture != null) {
      _result.profilePicture = profilePicture;
    }
    if (name != null) {
      _result.name = name;
    }
    if (qualifications != null) {
      _result.qualifications = qualifications;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (licenseNumber != null) {
      _result.licenseNumber = licenseNumber;
    }
    if (specialities != null) {
      _result.specialities.addAll(specialities);
    }
    if (experience != null) {
      _result.experience = experience;
    }
    if (email != null) {
      _result.email = email;
    }
    if (about != null) {
      _result.about = about;
    }
    if (languages != null) {
      _result.languages.addAll(languages);
    }
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory DrInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DrInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DrInfo clone() => DrInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DrInfo copyWith(void Function(DrInfo) updates) => super.copyWith((message) => updates(message as DrInfo)) as DrInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DrInfo create() => DrInfo._();
  DrInfo createEmptyInstance() => create();
  static $pb.PbList<DrInfo> createRepeated() => $pb.PbList<DrInfo>();
  @$core.pragma('dart2js:noInline')
  static DrInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DrInfo>(create);
  static DrInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  Media get profilePicture => $_getN(1);
  @$pb.TagNumber(2)
  set profilePicture(Media v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProfilePicture() => $_has(1);
  @$pb.TagNumber(2)
  void clearProfilePicture() => clearField(2);
  @$pb.TagNumber(2)
  Media ensureProfilePicture() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get qualifications => $_getSZ(3);
  @$pb.TagNumber(4)
  set qualifications($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasQualifications() => $_has(3);
  @$pb.TagNumber(4)
  void clearQualifications() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get mobileNumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set mobileNumber($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMobileNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearMobileNumber() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get licenseNumber => $_getSZ(5);
  @$pb.TagNumber(6)
  set licenseNumber($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLicenseNumber() => $_has(5);
  @$pb.TagNumber(6)
  void clearLicenseNumber() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<CaregiverSpeciality> get specialities => $_getList(6);

  @$pb.TagNumber(8)
  $core.int get experience => $_getIZ(7);
  @$pb.TagNumber(8)
  set experience($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasExperience() => $_has(7);
  @$pb.TagNumber(8)
  void clearExperience() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get email => $_getSZ(8);
  @$pb.TagNumber(9)
  set email($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasEmail() => $_has(8);
  @$pb.TagNumber(9)
  void clearEmail() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get about => $_getSZ(9);
  @$pb.TagNumber(10)
  set about($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAbout() => $_has(9);
  @$pb.TagNumber(10)
  void clearAbout() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<Language> get languages => $_getList(10);

  @$pb.TagNumber(12)
  $core.String get address => $_getSZ(11);
  @$pb.TagNumber(12)
  set address($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasAddress() => $_has(11);
  @$pb.TagNumber(12)
  void clearAddress() => clearField(12);
}

class StatsByCaregiver extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StatsByCaregiver', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'caregiverId')
    ..pc<StatusCount>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.PM, subBuilder: StatusCount.create)
    ..aOM<DrInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'doctorInfo', subBuilder: DrInfo.create)
    ..hasRequiredFields = false
  ;

  StatsByCaregiver._() : super();
  factory StatsByCaregiver({
    $core.String? name,
    $core.String? caregiverId,
    $core.Iterable<StatusCount>? data,
    DrInfo? doctorInfo,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (caregiverId != null) {
      _result.caregiverId = caregiverId;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    if (doctorInfo != null) {
      _result.doctorInfo = doctorInfo;
    }
    return _result;
  }
  factory StatsByCaregiver.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StatsByCaregiver.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StatsByCaregiver clone() => StatsByCaregiver()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StatsByCaregiver copyWith(void Function(StatsByCaregiver) updates) => super.copyWith((message) => updates(message as StatsByCaregiver)) as StatsByCaregiver; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StatsByCaregiver create() => StatsByCaregiver._();
  StatsByCaregiver createEmptyInstance() => create();
  static $pb.PbList<StatsByCaregiver> createRepeated() => $pb.PbList<StatsByCaregiver>();
  @$core.pragma('dart2js:noInline')
  static StatsByCaregiver getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StatsByCaregiver>(create);
  static StatsByCaregiver? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get caregiverId => $_getSZ(1);
  @$pb.TagNumber(2)
  set caregiverId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCaregiverId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCaregiverId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<StatusCount> get data => $_getList(2);

  @$pb.TagNumber(4)
  DrInfo get doctorInfo => $_getN(3);
  @$pb.TagNumber(4)
  set doctorInfo(DrInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDoctorInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearDoctorInfo() => clearField(4);
  @$pb.TagNumber(4)
  DrInfo ensureDoctorInfo() => $_ensure(3);
}

class FolloUpStatsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FolloUpStatsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..pc<StatsByCaregiver>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statsByCaregiver', $pb.PbFieldType.PM, subBuilder: StatsByCaregiver.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientProfileId')
    ..hasRequiredFields = false
  ;

  FolloUpStatsResponse._() : super();
  factory FolloUpStatsResponse({
    $core.String? status,
    $core.Iterable<StatsByCaregiver>? statsByCaregiver,
    $core.String? patientProfileId,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (statsByCaregiver != null) {
      _result.statsByCaregiver.addAll(statsByCaregiver);
    }
    if (patientProfileId != null) {
      _result.patientProfileId = patientProfileId;
    }
    return _result;
  }
  factory FolloUpStatsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FolloUpStatsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FolloUpStatsResponse clone() => FolloUpStatsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FolloUpStatsResponse copyWith(void Function(FolloUpStatsResponse) updates) => super.copyWith((message) => updates(message as FolloUpStatsResponse)) as FolloUpStatsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FolloUpStatsResponse create() => FolloUpStatsResponse._();
  FolloUpStatsResponse createEmptyInstance() => create();
  static $pb.PbList<FolloUpStatsResponse> createRepeated() => $pb.PbList<FolloUpStatsResponse>();
  @$core.pragma('dart2js:noInline')
  static FolloUpStatsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FolloUpStatsResponse>(create);
  static FolloUpStatsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<StatsByCaregiver> get statsByCaregiver => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get patientProfileId => $_getSZ(2);
  @$pb.TagNumber(3)
  set patientProfileId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPatientProfileId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPatientProfileId() => clearField(3);
}

class IncomingPatientappMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IncomingPatientappMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'responseText')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageId')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpId')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mediaPresent')
    ..pc<Media>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'media', $pb.PbFieldType.PM, subBuilder: Media.create)
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trafficType')
    ..aInt64(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'platform')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageStatus')
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextNodeId')
    ..aOM<ResponseOptions>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'responseOption', subBuilder: ResponseOptions.create)
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentNodeId')
    ..hasRequiredFields = false
  ;

  IncomingPatientappMessage._() : super();
  factory IncomingPatientappMessage({
    $core.String? userId,
    $core.String? userToken,
    $core.String? mobileNumber,
    $core.String? responseText,
    $core.String? messageId,
    $core.String? folloUpId,
    $core.bool? mediaPresent,
    $core.Iterable<Media>? media,
    $core.String? trafficType,
    $fixnum.Int64? timestamp,
    $core.String? platform,
    $core.String? provider,
    $core.String? messageStatus,
    $core.String? nextNodeId,
    ResponseOptions? responseOption,
    $core.String? currentNodeId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (responseText != null) {
      _result.responseText = responseText;
    }
    if (messageId != null) {
      _result.messageId = messageId;
    }
    if (folloUpId != null) {
      _result.folloUpId = folloUpId;
    }
    if (mediaPresent != null) {
      _result.mediaPresent = mediaPresent;
    }
    if (media != null) {
      _result.media.addAll(media);
    }
    if (trafficType != null) {
      _result.trafficType = trafficType;
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    if (platform != null) {
      _result.platform = platform;
    }
    if (provider != null) {
      _result.provider = provider;
    }
    if (messageStatus != null) {
      _result.messageStatus = messageStatus;
    }
    if (nextNodeId != null) {
      _result.nextNodeId = nextNodeId;
    }
    if (responseOption != null) {
      _result.responseOption = responseOption;
    }
    if (currentNodeId != null) {
      _result.currentNodeId = currentNodeId;
    }
    return _result;
  }
  factory IncomingPatientappMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IncomingPatientappMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IncomingPatientappMessage clone() => IncomingPatientappMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IncomingPatientappMessage copyWith(void Function(IncomingPatientappMessage) updates) => super.copyWith((message) => updates(message as IncomingPatientappMessage)) as IncomingPatientappMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IncomingPatientappMessage create() => IncomingPatientappMessage._();
  IncomingPatientappMessage createEmptyInstance() => create();
  static $pb.PbList<IncomingPatientappMessage> createRepeated() => $pb.PbList<IncomingPatientappMessage>();
  @$core.pragma('dart2js:noInline')
  static IncomingPatientappMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IncomingPatientappMessage>(create);
  static IncomingPatientappMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mobileNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set mobileNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMobileNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearMobileNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get responseText => $_getSZ(3);
  @$pb.TagNumber(4)
  set responseText($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasResponseText() => $_has(3);
  @$pb.TagNumber(4)
  void clearResponseText() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get messageId => $_getSZ(4);
  @$pb.TagNumber(5)
  set messageId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMessageId() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessageId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get folloUpId => $_getSZ(5);
  @$pb.TagNumber(6)
  set folloUpId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFolloUpId() => $_has(5);
  @$pb.TagNumber(6)
  void clearFolloUpId() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get mediaPresent => $_getBF(6);
  @$pb.TagNumber(7)
  set mediaPresent($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMediaPresent() => $_has(6);
  @$pb.TagNumber(7)
  void clearMediaPresent() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<Media> get media => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get trafficType => $_getSZ(8);
  @$pb.TagNumber(9)
  set trafficType($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTrafficType() => $_has(8);
  @$pb.TagNumber(9)
  void clearTrafficType() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get timestamp => $_getI64(9);
  @$pb.TagNumber(10)
  set timestamp($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTimestamp() => $_has(9);
  @$pb.TagNumber(10)
  void clearTimestamp() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get platform => $_getSZ(10);
  @$pb.TagNumber(11)
  set platform($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasPlatform() => $_has(10);
  @$pb.TagNumber(11)
  void clearPlatform() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get provider => $_getSZ(11);
  @$pb.TagNumber(12)
  set provider($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasProvider() => $_has(11);
  @$pb.TagNumber(12)
  void clearProvider() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get messageStatus => $_getSZ(12);
  @$pb.TagNumber(13)
  set messageStatus($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasMessageStatus() => $_has(12);
  @$pb.TagNumber(13)
  void clearMessageStatus() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get nextNodeId => $_getSZ(13);
  @$pb.TagNumber(14)
  set nextNodeId($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasNextNodeId() => $_has(13);
  @$pb.TagNumber(14)
  void clearNextNodeId() => clearField(14);

  @$pb.TagNumber(15)
  ResponseOptions get responseOption => $_getN(14);
  @$pb.TagNumber(15)
  set responseOption(ResponseOptions v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasResponseOption() => $_has(14);
  @$pb.TagNumber(15)
  void clearResponseOption() => clearField(15);
  @$pb.TagNumber(15)
  ResponseOptions ensureResponseOption() => $_ensure(14);

  @$pb.TagNumber(16)
  $core.String get currentNodeId => $_getSZ(15);
  @$pb.TagNumber(16)
  set currentNodeId($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasCurrentNodeId() => $_has(15);
  @$pb.TagNumber(16)
  void clearCurrentNodeId() => clearField(16);
}

class IncomingPatientappMessageResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IncomingPatientappMessageResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'processed')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextMessageId')
    ..pPS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'emergencyOptions')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'emergencyType')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'call')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..aOM<PatientappChatMessage>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextChatMessage', subBuilder: PatientappChatMessage.create)
    ..hasRequiredFields = false
  ;

  IncomingPatientappMessageResponse._() : super();
  factory IncomingPatientappMessageResponse({
    $core.String? status,
    $core.bool? processed,
    $core.String? nextMessageId,
    $core.Iterable<$core.String>? emergencyOptions,
    $core.bool? emergencyType,
    $core.bool? call,
    $core.bool? url,
    PatientappChatMessage? nextChatMessage,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (processed != null) {
      _result.processed = processed;
    }
    if (nextMessageId != null) {
      _result.nextMessageId = nextMessageId;
    }
    if (emergencyOptions != null) {
      _result.emergencyOptions.addAll(emergencyOptions);
    }
    if (emergencyType != null) {
      _result.emergencyType = emergencyType;
    }
    if (call != null) {
      _result.call = call;
    }
    if (url != null) {
      _result.url = url;
    }
    if (nextChatMessage != null) {
      _result.nextChatMessage = nextChatMessage;
    }
    return _result;
  }
  factory IncomingPatientappMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IncomingPatientappMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IncomingPatientappMessageResponse clone() => IncomingPatientappMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IncomingPatientappMessageResponse copyWith(void Function(IncomingPatientappMessageResponse) updates) => super.copyWith((message) => updates(message as IncomingPatientappMessageResponse)) as IncomingPatientappMessageResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IncomingPatientappMessageResponse create() => IncomingPatientappMessageResponse._();
  IncomingPatientappMessageResponse createEmptyInstance() => create();
  static $pb.PbList<IncomingPatientappMessageResponse> createRepeated() => $pb.PbList<IncomingPatientappMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static IncomingPatientappMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IncomingPatientappMessageResponse>(create);
  static IncomingPatientappMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get processed => $_getBF(1);
  @$pb.TagNumber(2)
  set processed($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProcessed() => $_has(1);
  @$pb.TagNumber(2)
  void clearProcessed() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nextMessageId => $_getSZ(2);
  @$pb.TagNumber(3)
  set nextMessageId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNextMessageId() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextMessageId() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get emergencyOptions => $_getList(3);

  @$pb.TagNumber(5)
  $core.bool get emergencyType => $_getBF(4);
  @$pb.TagNumber(5)
  set emergencyType($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEmergencyType() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmergencyType() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get call => $_getBF(5);
  @$pb.TagNumber(6)
  set call($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCall() => $_has(5);
  @$pb.TagNumber(6)
  void clearCall() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get url => $_getBF(6);
  @$pb.TagNumber(7)
  set url($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearUrl() => clearField(7);

  @$pb.TagNumber(8)
  PatientappChatMessage get nextChatMessage => $_getN(7);
  @$pb.TagNumber(8)
  set nextChatMessage(PatientappChatMessage v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasNextChatMessage() => $_has(7);
  @$pb.TagNumber(8)
  void clearNextChatMessage() => clearField(8);
  @$pb.TagNumber(8)
  PatientappChatMessage ensureNextChatMessage() => $_ensure(7);
}

class ResponseOptions extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseOptions', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextNode')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'alert')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'summary')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isSelected')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'responseText')
    ..hasRequiredFields = false
  ;

  ResponseOptions._() : super();
  factory ResponseOptions({
    $core.String? nextNode,
    $core.String? alert,
    $core.String? summary,
    $core.bool? isSelected,
    $core.String? responseText,
  }) {
    final _result = create();
    if (nextNode != null) {
      _result.nextNode = nextNode;
    }
    if (alert != null) {
      _result.alert = alert;
    }
    if (summary != null) {
      _result.summary = summary;
    }
    if (isSelected != null) {
      _result.isSelected = isSelected;
    }
    if (responseText != null) {
      _result.responseText = responseText;
    }
    return _result;
  }
  factory ResponseOptions.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseOptions.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseOptions clone() => ResponseOptions()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseOptions copyWith(void Function(ResponseOptions) updates) => super.copyWith((message) => updates(message as ResponseOptions)) as ResponseOptions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseOptions create() => ResponseOptions._();
  ResponseOptions createEmptyInstance() => create();
  static $pb.PbList<ResponseOptions> createRepeated() => $pb.PbList<ResponseOptions>();
  @$core.pragma('dart2js:noInline')
  static ResponseOptions getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseOptions>(create);
  static ResponseOptions? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nextNode => $_getSZ(0);
  @$pb.TagNumber(1)
  set nextNode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNextNode() => $_has(0);
  @$pb.TagNumber(1)
  void clearNextNode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get alert => $_getSZ(1);
  @$pb.TagNumber(2)
  set alert($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAlert() => $_has(1);
  @$pb.TagNumber(2)
  void clearAlert() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get summary => $_getSZ(2);
  @$pb.TagNumber(3)
  set summary($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSummary() => $_has(2);
  @$pb.TagNumber(3)
  void clearSummary() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isSelected => $_getBF(3);
  @$pb.TagNumber(4)
  set isSelected($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsSelected() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsSelected() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get responseText => $_getSZ(4);
  @$pb.TagNumber(5)
  set responseText($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasResponseText() => $_has(4);
  @$pb.TagNumber(5)
  void clearResponseText() => clearField(5);
}

class PatientappChatMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PatientappChatMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mediaPresent')
    ..pc<Media>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'media', $pb.PbFieldType.PM, subBuilder: Media.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageId')
    ..pc<ResponseOptions>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'responseOptions', $pb.PbFieldType.PM, subBuilder: ResponseOptions.create)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trafficType')
    ..aInt64(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'platform')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageStatus')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextNodeId')
    ..pPS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextNodeIds')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'responseType')
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentNodeId')
    ..hasRequiredFields = false
  ;

  PatientappChatMessage._() : super();
  factory PatientappChatMessage({
    $core.String? mobileNumber,
    $core.String? userId,
    $core.String? text,
    $core.bool? mediaPresent,
    $core.Iterable<Media>? media,
    $core.String? messageId,
    $core.Iterable<ResponseOptions>? responseOptions,
    $core.String? trafficType,
    $fixnum.Int64? timestamp,
    $core.String? platform,
    $core.String? provider,
    $core.String? messageStatus,
    $core.String? nextNodeId,
    $core.Iterable<$core.String>? nextNodeIds,
    $core.String? responseType,
    $core.String? currentNodeId,
  }) {
    final _result = create();
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (text != null) {
      _result.text = text;
    }
    if (mediaPresent != null) {
      _result.mediaPresent = mediaPresent;
    }
    if (media != null) {
      _result.media.addAll(media);
    }
    if (messageId != null) {
      _result.messageId = messageId;
    }
    if (responseOptions != null) {
      _result.responseOptions.addAll(responseOptions);
    }
    if (trafficType != null) {
      _result.trafficType = trafficType;
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    if (platform != null) {
      _result.platform = platform;
    }
    if (provider != null) {
      _result.provider = provider;
    }
    if (messageStatus != null) {
      _result.messageStatus = messageStatus;
    }
    if (nextNodeId != null) {
      _result.nextNodeId = nextNodeId;
    }
    if (nextNodeIds != null) {
      _result.nextNodeIds.addAll(nextNodeIds);
    }
    if (responseType != null) {
      _result.responseType = responseType;
    }
    if (currentNodeId != null) {
      _result.currentNodeId = currentNodeId;
    }
    return _result;
  }
  factory PatientappChatMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PatientappChatMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PatientappChatMessage clone() => PatientappChatMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PatientappChatMessage copyWith(void Function(PatientappChatMessage) updates) => super.copyWith((message) => updates(message as PatientappChatMessage)) as PatientappChatMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatientappChatMessage create() => PatientappChatMessage._();
  PatientappChatMessage createEmptyInstance() => create();
  static $pb.PbList<PatientappChatMessage> createRepeated() => $pb.PbList<PatientappChatMessage>();
  @$core.pragma('dart2js:noInline')
  static PatientappChatMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PatientappChatMessage>(create);
  static PatientappChatMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mobileNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set mobileNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMobileNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearMobileNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(2);
  @$pb.TagNumber(3)
  set text($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);
  @$pb.TagNumber(3)
  void clearText() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get mediaPresent => $_getBF(3);
  @$pb.TagNumber(4)
  set mediaPresent($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMediaPresent() => $_has(3);
  @$pb.TagNumber(4)
  void clearMediaPresent() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<Media> get media => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get messageId => $_getSZ(5);
  @$pb.TagNumber(6)
  set messageId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMessageId() => $_has(5);
  @$pb.TagNumber(6)
  void clearMessageId() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<ResponseOptions> get responseOptions => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get trafficType => $_getSZ(7);
  @$pb.TagNumber(8)
  set trafficType($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTrafficType() => $_has(7);
  @$pb.TagNumber(8)
  void clearTrafficType() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get timestamp => $_getI64(8);
  @$pb.TagNumber(9)
  set timestamp($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTimestamp() => $_has(8);
  @$pb.TagNumber(9)
  void clearTimestamp() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get platform => $_getSZ(9);
  @$pb.TagNumber(10)
  set platform($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPlatform() => $_has(9);
  @$pb.TagNumber(10)
  void clearPlatform() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get provider => $_getSZ(10);
  @$pb.TagNumber(11)
  set provider($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasProvider() => $_has(10);
  @$pb.TagNumber(11)
  void clearProvider() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get messageStatus => $_getSZ(11);
  @$pb.TagNumber(12)
  set messageStatus($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasMessageStatus() => $_has(11);
  @$pb.TagNumber(12)
  void clearMessageStatus() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get nextNodeId => $_getSZ(12);
  @$pb.TagNumber(13)
  set nextNodeId($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasNextNodeId() => $_has(12);
  @$pb.TagNumber(13)
  void clearNextNodeId() => clearField(13);

  @$pb.TagNumber(14)
  $core.List<$core.String> get nextNodeIds => $_getList(13);

  @$pb.TagNumber(15)
  $core.String get responseType => $_getSZ(14);
  @$pb.TagNumber(15)
  set responseType($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasResponseType() => $_has(14);
  @$pb.TagNumber(15)
  void clearResponseType() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get currentNodeId => $_getSZ(15);
  @$pb.TagNumber(16)
  set currentNodeId($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasCurrentNodeId() => $_has(15);
  @$pb.TagNumber(16)
  void clearCurrentNodeId() => clearField(16);
}

class FetchPatientappMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchPatientappMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentNodeId')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageId')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'platform')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  FetchPatientappMessage._() : super();
  factory FetchPatientappMessage({
    $core.String? userId,
    $core.String? userToken,
    $core.String? mobileNumber,
    $core.String? folloUpId,
    $core.String? currentNodeId,
    $core.String? messageId,
    $core.String? platform,
    $core.String? provider,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (folloUpId != null) {
      _result.folloUpId = folloUpId;
    }
    if (currentNodeId != null) {
      _result.currentNodeId = currentNodeId;
    }
    if (messageId != null) {
      _result.messageId = messageId;
    }
    if (platform != null) {
      _result.platform = platform;
    }
    if (provider != null) {
      _result.provider = provider;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory FetchPatientappMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPatientappMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPatientappMessage clone() => FetchPatientappMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPatientappMessage copyWith(void Function(FetchPatientappMessage) updates) => super.copyWith((message) => updates(message as FetchPatientappMessage)) as FetchPatientappMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchPatientappMessage create() => FetchPatientappMessage._();
  FetchPatientappMessage createEmptyInstance() => create();
  static $pb.PbList<FetchPatientappMessage> createRepeated() => $pb.PbList<FetchPatientappMessage>();
  @$core.pragma('dart2js:noInline')
  static FetchPatientappMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPatientappMessage>(create);
  static FetchPatientappMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mobileNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set mobileNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMobileNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearMobileNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get folloUpId => $_getSZ(3);
  @$pb.TagNumber(4)
  set folloUpId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFolloUpId() => $_has(3);
  @$pb.TagNumber(4)
  void clearFolloUpId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get currentNodeId => $_getSZ(4);
  @$pb.TagNumber(5)
  set currentNodeId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCurrentNodeId() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrentNodeId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get messageId => $_getSZ(5);
  @$pb.TagNumber(6)
  set messageId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMessageId() => $_has(5);
  @$pb.TagNumber(6)
  void clearMessageId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get platform => $_getSZ(6);
  @$pb.TagNumber(7)
  set platform($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPlatform() => $_has(6);
  @$pb.TagNumber(7)
  void clearPlatform() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get provider => $_getSZ(7);
  @$pb.TagNumber(8)
  set provider($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasProvider() => $_has(7);
  @$pb.TagNumber(8)
  void clearProvider() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get clinicId => $_getSZ(8);
  @$pb.TagNumber(9)
  set clinicId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasClinicId() => $_has(8);
  @$pb.TagNumber(9)
  void clearClinicId() => clearField(9);
}

class FetchPatientappMessageResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchPatientappMessageResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fetched')
    ..aOM<PatientappChatMessage>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fetchedMessage', subBuilder: PatientappChatMessage.create)
    ..hasRequiredFields = false
  ;

  FetchPatientappMessageResponse._() : super();
  factory FetchPatientappMessageResponse({
    $core.String? status,
    $core.bool? fetched,
    PatientappChatMessage? fetchedMessage,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (fetched != null) {
      _result.fetched = fetched;
    }
    if (fetchedMessage != null) {
      _result.fetchedMessage = fetchedMessage;
    }
    return _result;
  }
  factory FetchPatientappMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPatientappMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPatientappMessageResponse clone() => FetchPatientappMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPatientappMessageResponse copyWith(void Function(FetchPatientappMessageResponse) updates) => super.copyWith((message) => updates(message as FetchPatientappMessageResponse)) as FetchPatientappMessageResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchPatientappMessageResponse create() => FetchPatientappMessageResponse._();
  FetchPatientappMessageResponse createEmptyInstance() => create();
  static $pb.PbList<FetchPatientappMessageResponse> createRepeated() => $pb.PbList<FetchPatientappMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchPatientappMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPatientappMessageResponse>(create);
  static FetchPatientappMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get fetched => $_getBF(1);
  @$pb.TagNumber(2)
  set fetched($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFetched() => $_has(1);
  @$pb.TagNumber(2)
  void clearFetched() => clearField(2);

  @$pb.TagNumber(3)
  PatientappChatMessage get fetchedMessage => $_getN(2);
  @$pb.TagNumber(3)
  set fetchedMessage(PatientappChatMessage v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFetchedMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearFetchedMessage() => clearField(3);
  @$pb.TagNumber(3)
  PatientappChatMessage ensureFetchedMessage() => $_ensure(2);
}

class FetchPatientappConversation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchPatientappConversation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  FetchPatientappConversation._() : super();
  factory FetchPatientappConversation({
    $core.String? userId,
    $core.String? userToken,
    $core.String? mobileNumber,
    $core.String? folloUpId,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (folloUpId != null) {
      _result.folloUpId = folloUpId;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory FetchPatientappConversation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPatientappConversation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPatientappConversation clone() => FetchPatientappConversation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPatientappConversation copyWith(void Function(FetchPatientappConversation) updates) => super.copyWith((message) => updates(message as FetchPatientappConversation)) as FetchPatientappConversation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchPatientappConversation create() => FetchPatientappConversation._();
  FetchPatientappConversation createEmptyInstance() => create();
  static $pb.PbList<FetchPatientappConversation> createRepeated() => $pb.PbList<FetchPatientappConversation>();
  @$core.pragma('dart2js:noInline')
  static FetchPatientappConversation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPatientappConversation>(create);
  static FetchPatientappConversation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mobileNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set mobileNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMobileNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearMobileNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get folloUpId => $_getSZ(3);
  @$pb.TagNumber(4)
  set folloUpId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFolloUpId() => $_has(3);
  @$pb.TagNumber(4)
  void clearFolloUpId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get clinicId => $_getSZ(4);
  @$pb.TagNumber(5)
  set clinicId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasClinicId() => $_has(4);
  @$pb.TagNumber(5)
  void clearClinicId() => clearField(5);
}

class FetchPatientappConversationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchPatientappConversationResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fetched')
    ..pc<PatientappChatMessage>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'conversationMessages', $pb.PbFieldType.PM, subBuilder: PatientappChatMessage.create)
    ..hasRequiredFields = false
  ;

  FetchPatientappConversationResponse._() : super();
  factory FetchPatientappConversationResponse({
    $core.String? status,
    $core.bool? fetched,
    $core.Iterable<PatientappChatMessage>? conversationMessages,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (fetched != null) {
      _result.fetched = fetched;
    }
    if (conversationMessages != null) {
      _result.conversationMessages.addAll(conversationMessages);
    }
    return _result;
  }
  factory FetchPatientappConversationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPatientappConversationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPatientappConversationResponse clone() => FetchPatientappConversationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPatientappConversationResponse copyWith(void Function(FetchPatientappConversationResponse) updates) => super.copyWith((message) => updates(message as FetchPatientappConversationResponse)) as FetchPatientappConversationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchPatientappConversationResponse create() => FetchPatientappConversationResponse._();
  FetchPatientappConversationResponse createEmptyInstance() => create();
  static $pb.PbList<FetchPatientappConversationResponse> createRepeated() => $pb.PbList<FetchPatientappConversationResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchPatientappConversationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPatientappConversationResponse>(create);
  static FetchPatientappConversationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get fetched => $_getBF(1);
  @$pb.TagNumber(2)
  set fetched($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFetched() => $_has(1);
  @$pb.TagNumber(2)
  void clearFetched() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<PatientappChatMessage> get conversationMessages => $_getList(2);
}

class PanicButton extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PanicButton', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  PanicButton._() : super();
  factory PanicButton({
    $core.String? userToken,
    $core.String? userId,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory PanicButton.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PanicButton.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PanicButton clone() => PanicButton()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PanicButton copyWith(void Function(PanicButton) updates) => super.copyWith((message) => updates(message as PanicButton)) as PanicButton; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PanicButton create() => PanicButton._();
  PanicButton createEmptyInstance() => create();
  static $pb.PbList<PanicButton> createRepeated() => $pb.PbList<PanicButton>();
  @$core.pragma('dart2js:noInline')
  static PanicButton getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PanicButton>(create);
  static PanicButton? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set userToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get clinicId => $_getSZ(2);
  @$pb.TagNumber(3)
  set clinicId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClinicId() => $_has(2);
  @$pb.TagNumber(3)
  void clearClinicId() => clearField(3);
}

class PanicButtonResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PanicButtonResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'emergencyContact')
    ..hasRequiredFields = false
  ;

  PanicButtonResponse._() : super();
  factory PanicButtonResponse({
    $core.String? status,
    $core.String? emergencyContact,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (emergencyContact != null) {
      _result.emergencyContact = emergencyContact;
    }
    return _result;
  }
  factory PanicButtonResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PanicButtonResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PanicButtonResponse clone() => PanicButtonResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PanicButtonResponse copyWith(void Function(PanicButtonResponse) updates) => super.copyWith((message) => updates(message as PanicButtonResponse)) as PanicButtonResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PanicButtonResponse create() => PanicButtonResponse._();
  PanicButtonResponse createEmptyInstance() => create();
  static $pb.PbList<PanicButtonResponse> createRepeated() => $pb.PbList<PanicButtonResponse>();
  @$core.pragma('dart2js:noInline')
  static PanicButtonResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PanicButtonResponse>(create);
  static PanicButtonResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get emergencyContact => $_getSZ(1);
  @$pb.TagNumber(2)
  set emergencyContact($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmergencyContact() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmergencyContact() => clearField(2);
}

class Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..hasRequiredFields = false
  ;

  Content._() : super();
  factory Content({
    $core.String? type,
    $core.Iterable<$core.String>? data,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Content clone() => Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Content copyWith(void Function(Content) updates) => super.copyWith((message) => updates(message as Content)) as Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Content create() => Content._();
  Content createEmptyInstance() => create();
  static $pb.PbList<Content> createRepeated() => $pb.PbList<Content>();
  @$core.pragma('dart2js:noInline')
  static Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Content>(create);
  static Content? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get data => $_getList(1);
}

class TCandPP extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TCandPP', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'platform')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  TCandPP._() : super();
  factory TCandPP({
    $core.String? platform,
    $core.String? name,
  }) {
    final _result = create();
    if (platform != null) {
      _result.platform = platform;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory TCandPP.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TCandPP.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TCandPP clone() => TCandPP()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TCandPP copyWith(void Function(TCandPP) updates) => super.copyWith((message) => updates(message as TCandPP)) as TCandPP; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TCandPP create() => TCandPP._();
  TCandPP createEmptyInstance() => create();
  static $pb.PbList<TCandPP> createRepeated() => $pb.PbList<TCandPP>();
  @$core.pragma('dart2js:noInline')
  static TCandPP getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TCandPP>(create);
  static TCandPP? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get platform => $_getSZ(0);
  @$pb.TagNumber(1)
  set platform($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlatform() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlatform() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class TCandPPResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TCandPPResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..hasRequiredFields = false
  ;

  TCandPPResponse._() : super();
  factory TCandPPResponse({
    $core.String? status,
    $core.String? name,
    $core.String? url,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (name != null) {
      _result.name = name;
    }
    if (url != null) {
      _result.url = url;
    }
    return _result;
  }
  factory TCandPPResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TCandPPResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TCandPPResponse clone() => TCandPPResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TCandPPResponse copyWith(void Function(TCandPPResponse) updates) => super.copyWith((message) => updates(message as TCandPPResponse)) as TCandPPResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TCandPPResponse create() => TCandPPResponse._();
  TCandPPResponse createEmptyInstance() => create();
  static $pb.PbList<TCandPPResponse> createRepeated() => $pb.PbList<TCandPPResponse>();
  @$core.pragma('dart2js:noInline')
  static TCandPPResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TCandPPResponse>(create);
  static TCandPPResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);
}

class HelpMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HelpMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'platformName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buttonId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contentType')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buttonName')
    ..hasRequiredFields = false
  ;

  HelpMessage._() : super();
  factory HelpMessage({
    $core.String? userId,
    $core.String? userToken,
    $core.String? platformName,
    $core.String? buttonId,
    $core.String? contentType,
    $core.String? buttonName,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (platformName != null) {
      _result.platformName = platformName;
    }
    if (buttonId != null) {
      _result.buttonId = buttonId;
    }
    if (contentType != null) {
      _result.contentType = contentType;
    }
    if (buttonName != null) {
      _result.buttonName = buttonName;
    }
    return _result;
  }
  factory HelpMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HelpMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HelpMessage clone() => HelpMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HelpMessage copyWith(void Function(HelpMessage) updates) => super.copyWith((message) => updates(message as HelpMessage)) as HelpMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HelpMessage create() => HelpMessage._();
  HelpMessage createEmptyInstance() => create();
  static $pb.PbList<HelpMessage> createRepeated() => $pb.PbList<HelpMessage>();
  @$core.pragma('dart2js:noInline')
  static HelpMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HelpMessage>(create);
  static HelpMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get platformName => $_getSZ(2);
  @$pb.TagNumber(3)
  set platformName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlatformName() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlatformName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get buttonId => $_getSZ(3);
  @$pb.TagNumber(4)
  set buttonId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasButtonId() => $_has(3);
  @$pb.TagNumber(4)
  void clearButtonId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get contentType => $_getSZ(4);
  @$pb.TagNumber(5)
  set contentType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasContentType() => $_has(4);
  @$pb.TagNumber(5)
  void clearContentType() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get buttonName => $_getSZ(5);
  @$pb.TagNumber(6)
  set buttonName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasButtonName() => $_has(5);
  @$pb.TagNumber(6)
  void clearButtonName() => clearField(6);
}

class HelpMessageReponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HelpMessageReponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'helpMessageFetched')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..hasRequiredFields = false
  ;

  HelpMessageReponse._() : super();
  factory HelpMessageReponse({
    $core.String? status,
    $core.bool? helpMessageFetched,
    $core.String? content,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (helpMessageFetched != null) {
      _result.helpMessageFetched = helpMessageFetched;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory HelpMessageReponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HelpMessageReponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HelpMessageReponse clone() => HelpMessageReponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HelpMessageReponse copyWith(void Function(HelpMessageReponse) updates) => super.copyWith((message) => updates(message as HelpMessageReponse)) as HelpMessageReponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HelpMessageReponse create() => HelpMessageReponse._();
  HelpMessageReponse createEmptyInstance() => create();
  static $pb.PbList<HelpMessageReponse> createRepeated() => $pb.PbList<HelpMessageReponse>();
  @$core.pragma('dart2js:noInline')
  static HelpMessageReponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HelpMessageReponse>(create);
  static HelpMessageReponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get helpMessageFetched => $_getBF(1);
  @$pb.TagNumber(2)
  set helpMessageFetched($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHelpMessageFetched() => $_has(1);
  @$pb.TagNumber(2)
  void clearHelpMessageFetched() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);
}

class EmergencyInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EmergencyInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'caregiverName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'caregiverId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'responseText')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpId')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lattitude', $pb.PbFieldType.OD)
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logitude', $pb.PbFieldType.OD)
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..aOB(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dataPresent')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  EmergencyInfo._() : super();
  factory EmergencyInfo({
    $core.String? userId,
    $core.String? userToken,
    $core.String? caregiverName,
    $core.String? caregiverId,
    $core.String? responseText,
    $core.String? folloUpId,
    $core.double? lattitude,
    $core.double? logitude,
    $core.String? address,
    $core.bool? dataPresent,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (caregiverName != null) {
      _result.caregiverName = caregiverName;
    }
    if (caregiverId != null) {
      _result.caregiverId = caregiverId;
    }
    if (responseText != null) {
      _result.responseText = responseText;
    }
    if (folloUpId != null) {
      _result.folloUpId = folloUpId;
    }
    if (lattitude != null) {
      _result.lattitude = lattitude;
    }
    if (logitude != null) {
      _result.logitude = logitude;
    }
    if (address != null) {
      _result.address = address;
    }
    if (dataPresent != null) {
      _result.dataPresent = dataPresent;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory EmergencyInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmergencyInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmergencyInfo clone() => EmergencyInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmergencyInfo copyWith(void Function(EmergencyInfo) updates) => super.copyWith((message) => updates(message as EmergencyInfo)) as EmergencyInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmergencyInfo create() => EmergencyInfo._();
  EmergencyInfo createEmptyInstance() => create();
  static $pb.PbList<EmergencyInfo> createRepeated() => $pb.PbList<EmergencyInfo>();
  @$core.pragma('dart2js:noInline')
  static EmergencyInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmergencyInfo>(create);
  static EmergencyInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get caregiverName => $_getSZ(2);
  @$pb.TagNumber(3)
  set caregiverName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCaregiverName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCaregiverName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get caregiverId => $_getSZ(3);
  @$pb.TagNumber(4)
  set caregiverId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCaregiverId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCaregiverId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get responseText => $_getSZ(4);
  @$pb.TagNumber(5)
  set responseText($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasResponseText() => $_has(4);
  @$pb.TagNumber(5)
  void clearResponseText() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get folloUpId => $_getSZ(5);
  @$pb.TagNumber(6)
  set folloUpId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFolloUpId() => $_has(5);
  @$pb.TagNumber(6)
  void clearFolloUpId() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get lattitude => $_getN(6);
  @$pb.TagNumber(7)
  set lattitude($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLattitude() => $_has(6);
  @$pb.TagNumber(7)
  void clearLattitude() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get logitude => $_getN(7);
  @$pb.TagNumber(8)
  set logitude($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLogitude() => $_has(7);
  @$pb.TagNumber(8)
  void clearLogitude() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get address => $_getSZ(8);
  @$pb.TagNumber(9)
  set address($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAddress() => $_has(8);
  @$pb.TagNumber(9)
  void clearAddress() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get dataPresent => $_getBF(9);
  @$pb.TagNumber(10)
  set dataPresent($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDataPresent() => $_has(9);
  @$pb.TagNumber(10)
  void clearDataPresent() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get clinicId => $_getSZ(10);
  @$pb.TagNumber(11)
  set clinicId($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasClinicId() => $_has(10);
  @$pb.TagNumber(11)
  void clearClinicId() => clearField(11);
}

class EmergencyInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EmergencyInfoResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'emergencyMobileNumber')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bookingUrl')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dataSaved')
    ..hasRequiredFields = false
  ;

  EmergencyInfoResponse._() : super();
  factory EmergencyInfoResponse({
    $core.String? status,
    $core.String? emergencyMobileNumber,
    $core.String? bookingUrl,
    $core.bool? dataSaved,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (emergencyMobileNumber != null) {
      _result.emergencyMobileNumber = emergencyMobileNumber;
    }
    if (bookingUrl != null) {
      _result.bookingUrl = bookingUrl;
    }
    if (dataSaved != null) {
      _result.dataSaved = dataSaved;
    }
    return _result;
  }
  factory EmergencyInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmergencyInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmergencyInfoResponse clone() => EmergencyInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmergencyInfoResponse copyWith(void Function(EmergencyInfoResponse) updates) => super.copyWith((message) => updates(message as EmergencyInfoResponse)) as EmergencyInfoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmergencyInfoResponse create() => EmergencyInfoResponse._();
  EmergencyInfoResponse createEmptyInstance() => create();
  static $pb.PbList<EmergencyInfoResponse> createRepeated() => $pb.PbList<EmergencyInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static EmergencyInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmergencyInfoResponse>(create);
  static EmergencyInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get emergencyMobileNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set emergencyMobileNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmergencyMobileNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmergencyMobileNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get bookingUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set bookingUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBookingUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearBookingUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get dataSaved => $_getBF(3);
  @$pb.TagNumber(4)
  set dataSaved($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDataSaved() => $_has(3);
  @$pb.TagNumber(4)
  void clearDataSaved() => clearField(4);
}

class CheckPatientappConversation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CheckPatientappConversation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpId')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numberOfMessages', $pb.PbFieldType.O3)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  CheckPatientappConversation._() : super();
  factory CheckPatientappConversation({
    $core.String? userId,
    $core.String? userToken,
    $core.String? mobileNumber,
    $core.String? folloUpId,
    $core.int? numberOfMessages,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (folloUpId != null) {
      _result.folloUpId = folloUpId;
    }
    if (numberOfMessages != null) {
      _result.numberOfMessages = numberOfMessages;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory CheckPatientappConversation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckPatientappConversation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckPatientappConversation clone() => CheckPatientappConversation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckPatientappConversation copyWith(void Function(CheckPatientappConversation) updates) => super.copyWith((message) => updates(message as CheckPatientappConversation)) as CheckPatientappConversation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckPatientappConversation create() => CheckPatientappConversation._();
  CheckPatientappConversation createEmptyInstance() => create();
  static $pb.PbList<CheckPatientappConversation> createRepeated() => $pb.PbList<CheckPatientappConversation>();
  @$core.pragma('dart2js:noInline')
  static CheckPatientappConversation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckPatientappConversation>(create);
  static CheckPatientappConversation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mobileNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set mobileNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMobileNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearMobileNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get folloUpId => $_getSZ(3);
  @$pb.TagNumber(4)
  set folloUpId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFolloUpId() => $_has(3);
  @$pb.TagNumber(4)
  void clearFolloUpId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get numberOfMessages => $_getIZ(4);
  @$pb.TagNumber(5)
  set numberOfMessages($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNumberOfMessages() => $_has(4);
  @$pb.TagNumber(5)
  void clearNumberOfMessages() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get clinicId => $_getSZ(5);
  @$pb.TagNumber(6)
  set clinicId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasClinicId() => $_has(5);
  @$pb.TagNumber(6)
  void clearClinicId() => clearField(6);
}

class CheckPatientappConversationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CheckPatientappConversationResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changed')
    ..pc<PatientappChatMessage>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'conversationMessages', $pb.PbFieldType.PM, subBuilder: PatientappChatMessage.create)
    ..hasRequiredFields = false
  ;

  CheckPatientappConversationResponse._() : super();
  factory CheckPatientappConversationResponse({
    $core.String? status,
    $core.bool? changed,
    $core.Iterable<PatientappChatMessage>? conversationMessages,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (changed != null) {
      _result.changed = changed;
    }
    if (conversationMessages != null) {
      _result.conversationMessages.addAll(conversationMessages);
    }
    return _result;
  }
  factory CheckPatientappConversationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckPatientappConversationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckPatientappConversationResponse clone() => CheckPatientappConversationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckPatientappConversationResponse copyWith(void Function(CheckPatientappConversationResponse) updates) => super.copyWith((message) => updates(message as CheckPatientappConversationResponse)) as CheckPatientappConversationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckPatientappConversationResponse create() => CheckPatientappConversationResponse._();
  CheckPatientappConversationResponse createEmptyInstance() => create();
  static $pb.PbList<CheckPatientappConversationResponse> createRepeated() => $pb.PbList<CheckPatientappConversationResponse>();
  @$core.pragma('dart2js:noInline')
  static CheckPatientappConversationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckPatientappConversationResponse>(create);
  static CheckPatientappConversationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get changed => $_getBF(1);
  @$pb.TagNumber(2)
  set changed($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChanged() => $_has(1);
  @$pb.TagNumber(2)
  void clearChanged() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<PatientappChatMessage> get conversationMessages => $_getList(2);
}

class Version extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Version', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'versionNumber')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  Version._() : super();
  factory Version({
    $core.String? userId,
    $core.String? userToken,
    $core.String? versionNumber,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (versionNumber != null) {
      _result.versionNumber = versionNumber;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory Version.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Version.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Version clone() => Version()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Version copyWith(void Function(Version) updates) => super.copyWith((message) => updates(message as Version)) as Version; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Version create() => Version._();
  Version createEmptyInstance() => create();
  static $pb.PbList<Version> createRepeated() => $pb.PbList<Version>();
  @$core.pragma('dart2js:noInline')
  static Version getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Version>(create);
  static Version? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get versionNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set versionNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVersionNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersionNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get clinicId => $_getSZ(3);
  @$pb.TagNumber(4)
  set clinicId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasClinicId() => $_has(3);
  @$pb.TagNumber(4)
  void clearClinicId() => clearField(4);
}

class VersionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VersionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'versionMatch')
    ..hasRequiredFields = false
  ;

  VersionResponse._() : super();
  factory VersionResponse({
    $core.String? status,
    $core.bool? versionMatch,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (versionMatch != null) {
      _result.versionMatch = versionMatch;
    }
    return _result;
  }
  factory VersionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VersionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VersionResponse clone() => VersionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VersionResponse copyWith(void Function(VersionResponse) updates) => super.copyWith((message) => updates(message as VersionResponse)) as VersionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VersionResponse create() => VersionResponse._();
  VersionResponse createEmptyInstance() => create();
  static $pb.PbList<VersionResponse> createRepeated() => $pb.PbList<VersionResponse>();
  @$core.pragma('dart2js:noInline')
  static VersionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VersionResponse>(create);
  static VersionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get versionMatch => $_getBF(1);
  @$pb.TagNumber(2)
  set versionMatch($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersionMatch() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersionMatch() => clearField(2);
}

class EditProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EditProfile', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateOfBirth')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'age', $pb.PbFieldType.O3)
    ..aOM<Media>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'profilePicture', subBuilder: Media.create)
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientProfileId')
    ..hasRequiredFields = false
  ;

  EditProfile._() : super();
  factory EditProfile({
    $core.String? userId,
    $core.String? userToken,
    $core.String? firstName,
    $core.String? lastName,
    $fixnum.Int64? dateOfBirth,
    $core.String? gender,
    $core.String? role,
    $core.int? age,
    Media? profilePicture,
    $core.String? clinicId,
    $core.String? email,
    $core.String? patientProfileId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    if (dateOfBirth != null) {
      _result.dateOfBirth = dateOfBirth;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    if (role != null) {
      _result.role = role;
    }
    if (age != null) {
      _result.age = age;
    }
    if (profilePicture != null) {
      _result.profilePicture = profilePicture;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    if (email != null) {
      _result.email = email;
    }
    if (patientProfileId != null) {
      _result.patientProfileId = patientProfileId;
    }
    return _result;
  }
  factory EditProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditProfile clone() => EditProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditProfile copyWith(void Function(EditProfile) updates) => super.copyWith((message) => updates(message as EditProfile)) as EditProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EditProfile create() => EditProfile._();
  EditProfile createEmptyInstance() => create();
  static $pb.PbList<EditProfile> createRepeated() => $pb.PbList<EditProfile>();
  @$core.pragma('dart2js:noInline')
  static EditProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditProfile>(create);
  static EditProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get firstName => $_getSZ(2);
  @$pb.TagNumber(3)
  set firstName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFirstName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastName => $_getSZ(3);
  @$pb.TagNumber(4)
  set lastName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastName() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastName() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get dateOfBirth => $_getI64(4);
  @$pb.TagNumber(5)
  set dateOfBirth($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDateOfBirth() => $_has(4);
  @$pb.TagNumber(5)
  void clearDateOfBirth() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get gender => $_getSZ(5);
  @$pb.TagNumber(6)
  set gender($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasGender() => $_has(5);
  @$pb.TagNumber(6)
  void clearGender() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get role => $_getSZ(6);
  @$pb.TagNumber(7)
  set role($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRole() => $_has(6);
  @$pb.TagNumber(7)
  void clearRole() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get age => $_getIZ(7);
  @$pb.TagNumber(8)
  set age($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAge() => $_has(7);
  @$pb.TagNumber(8)
  void clearAge() => clearField(8);

  @$pb.TagNumber(9)
  Media get profilePicture => $_getN(8);
  @$pb.TagNumber(9)
  set profilePicture(Media v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasProfilePicture() => $_has(8);
  @$pb.TagNumber(9)
  void clearProfilePicture() => clearField(9);
  @$pb.TagNumber(9)
  Media ensureProfilePicture() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get clinicId => $_getSZ(9);
  @$pb.TagNumber(10)
  set clinicId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasClinicId() => $_has(9);
  @$pb.TagNumber(10)
  void clearClinicId() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get email => $_getSZ(10);
  @$pb.TagNumber(11)
  set email($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasEmail() => $_has(10);
  @$pb.TagNumber(11)
  void clearEmail() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get patientProfileId => $_getSZ(11);
  @$pb.TagNumber(12)
  set patientProfileId($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasPatientProfileId() => $_has(11);
  @$pb.TagNumber(12)
  void clearPatientProfileId() => clearField(12);
}

class EditProfileResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EditProfileResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'profileUpdated')
    ..aOM<Patient>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientdata', subBuilder: Patient.create)
    ..hasRequiredFields = false
  ;

  EditProfileResponse._() : super();
  factory EditProfileResponse({
    $core.String? status,
    $core.bool? profileUpdated,
    Patient? patientdata,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (profileUpdated != null) {
      _result.profileUpdated = profileUpdated;
    }
    if (patientdata != null) {
      _result.patientdata = patientdata;
    }
    return _result;
  }
  factory EditProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditProfileResponse clone() => EditProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditProfileResponse copyWith(void Function(EditProfileResponse) updates) => super.copyWith((message) => updates(message as EditProfileResponse)) as EditProfileResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EditProfileResponse create() => EditProfileResponse._();
  EditProfileResponse createEmptyInstance() => create();
  static $pb.PbList<EditProfileResponse> createRepeated() => $pb.PbList<EditProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static EditProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditProfileResponse>(create);
  static EditProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get profileUpdated => $_getBF(1);
  @$pb.TagNumber(2)
  set profileUpdated($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProfileUpdated() => $_has(1);
  @$pb.TagNumber(2)
  void clearProfileUpdated() => clearField(2);

  @$pb.TagNumber(3)
  Patient get patientdata => $_getN(2);
  @$pb.TagNumber(3)
  set patientdata(Patient v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPatientdata() => $_has(2);
  @$pb.TagNumber(3)
  void clearPatientdata() => clearField(3);
  @$pb.TagNumber(3)
  Patient ensurePatientdata() => $_ensure(2);
}

class PatientDelete extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PatientDelete', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userPin', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  PatientDelete._() : super();
  factory PatientDelete({
    $core.String? userId,
    $core.String? userToken,
    $core.String? mobileNumber,
    $core.String? clinicId,
    $core.int? userPin,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    if (userPin != null) {
      _result.userPin = userPin;
    }
    return _result;
  }
  factory PatientDelete.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PatientDelete.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PatientDelete clone() => PatientDelete()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PatientDelete copyWith(void Function(PatientDelete) updates) => super.copyWith((message) => updates(message as PatientDelete)) as PatientDelete; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatientDelete create() => PatientDelete._();
  PatientDelete createEmptyInstance() => create();
  static $pb.PbList<PatientDelete> createRepeated() => $pb.PbList<PatientDelete>();
  @$core.pragma('dart2js:noInline')
  static PatientDelete getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PatientDelete>(create);
  static PatientDelete? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mobileNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set mobileNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMobileNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearMobileNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get clinicId => $_getSZ(3);
  @$pb.TagNumber(4)
  set clinicId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasClinicId() => $_has(3);
  @$pb.TagNumber(4)
  void clearClinicId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get userPin => $_getIZ(4);
  @$pb.TagNumber(5)
  set userPin($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserPin() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserPin() => clearField(5);
}

class PatientDeleteResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PatientDeleteResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userDeleted')
    ..hasRequiredFields = false
  ;

  PatientDeleteResponse._() : super();
  factory PatientDeleteResponse({
    $core.String? status,
    $core.bool? userDeleted,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (userDeleted != null) {
      _result.userDeleted = userDeleted;
    }
    return _result;
  }
  factory PatientDeleteResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PatientDeleteResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PatientDeleteResponse clone() => PatientDeleteResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PatientDeleteResponse copyWith(void Function(PatientDeleteResponse) updates) => super.copyWith((message) => updates(message as PatientDeleteResponse)) as PatientDeleteResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatientDeleteResponse create() => PatientDeleteResponse._();
  PatientDeleteResponse createEmptyInstance() => create();
  static $pb.PbList<PatientDeleteResponse> createRepeated() => $pb.PbList<PatientDeleteResponse>();
  @$core.pragma('dart2js:noInline')
  static PatientDeleteResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PatientDeleteResponse>(create);
  static PatientDeleteResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get userDeleted => $_getBF(1);
  @$pb.TagNumber(2)
  set userDeleted($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserDeleted() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserDeleted() => clearField(2);
}

class AddPatientProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddPatientProfile', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'age', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  AddPatientProfile._() : super();
  factory AddPatientProfile({
    $core.String? userId,
    $core.String? userToken,
    $core.String? mobileNumber,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? gender,
    $core.int? age,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    if (age != null) {
      _result.age = age;
    }
    return _result;
  }
  factory AddPatientProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddPatientProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddPatientProfile clone() => AddPatientProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddPatientProfile copyWith(void Function(AddPatientProfile) updates) => super.copyWith((message) => updates(message as AddPatientProfile)) as AddPatientProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddPatientProfile create() => AddPatientProfile._();
  AddPatientProfile createEmptyInstance() => create();
  static $pb.PbList<AddPatientProfile> createRepeated() => $pb.PbList<AddPatientProfile>();
  @$core.pragma('dart2js:noInline')
  static AddPatientProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddPatientProfile>(create);
  static AddPatientProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mobileNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set mobileNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMobileNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearMobileNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get firstName => $_getSZ(3);
  @$pb.TagNumber(4)
  set firstName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFirstName() => $_has(3);
  @$pb.TagNumber(4)
  void clearFirstName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get lastName => $_getSZ(4);
  @$pb.TagNumber(5)
  set lastName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastName() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get gender => $_getSZ(5);
  @$pb.TagNumber(6)
  set gender($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasGender() => $_has(5);
  @$pb.TagNumber(6)
  void clearGender() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get age => $_getIZ(6);
  @$pb.TagNumber(7)
  set age($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAge() => $_has(6);
  @$pb.TagNumber(7)
  void clearAge() => clearField(7);
}

class PatientTuple extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PatientTuple', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientProfileId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'age', $pb.PbFieldType.O3)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender')
    ..pc<PatientHistory>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'history', $pb.PbFieldType.PM, subBuilder: PatientHistory.create)
    ..hasRequiredFields = false
  ;

  PatientTuple._() : super();
  factory PatientTuple({
    $core.String? patientId,
    $core.String? patientProfileId,
    $core.String? mobileNumber,
    $core.String? firstName,
    $core.String? lastName,
    $core.int? age,
    $core.String? gender,
    $core.Iterable<PatientHistory>? history,
  }) {
    final _result = create();
    if (patientId != null) {
      _result.patientId = patientId;
    }
    if (patientProfileId != null) {
      _result.patientProfileId = patientProfileId;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    if (age != null) {
      _result.age = age;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    if (history != null) {
      _result.history.addAll(history);
    }
    return _result;
  }
  factory PatientTuple.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PatientTuple.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PatientTuple clone() => PatientTuple()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PatientTuple copyWith(void Function(PatientTuple) updates) => super.copyWith((message) => updates(message as PatientTuple)) as PatientTuple; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatientTuple create() => PatientTuple._();
  PatientTuple createEmptyInstance() => create();
  static $pb.PbList<PatientTuple> createRepeated() => $pb.PbList<PatientTuple>();
  @$core.pragma('dart2js:noInline')
  static PatientTuple getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PatientTuple>(create);
  static PatientTuple? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get patientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set patientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPatientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPatientId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get patientProfileId => $_getSZ(1);
  @$pb.TagNumber(2)
  set patientProfileId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPatientProfileId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPatientProfileId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mobileNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set mobileNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMobileNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearMobileNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get firstName => $_getSZ(3);
  @$pb.TagNumber(4)
  set firstName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFirstName() => $_has(3);
  @$pb.TagNumber(4)
  void clearFirstName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get lastName => $_getSZ(4);
  @$pb.TagNumber(5)
  set lastName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastName() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastName() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get age => $_getIZ(5);
  @$pb.TagNumber(6)
  set age($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAge() => $_has(5);
  @$pb.TagNumber(6)
  void clearAge() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get gender => $_getSZ(6);
  @$pb.TagNumber(7)
  set gender($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasGender() => $_has(6);
  @$pb.TagNumber(7)
  void clearGender() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<PatientHistory> get history => $_getList(7);
}

class AddPatientProfileResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddPatientProfileResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientProfileAdded')
    ..aOM<PatientTuple>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patient', subBuilder: PatientTuple.create)
    ..hasRequiredFields = false
  ;

  AddPatientProfileResponse._() : super();
  factory AddPatientProfileResponse({
    $core.String? status,
    $core.bool? patientProfileAdded,
    PatientTuple? patient,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (patientProfileAdded != null) {
      _result.patientProfileAdded = patientProfileAdded;
    }
    if (patient != null) {
      _result.patient = patient;
    }
    return _result;
  }
  factory AddPatientProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddPatientProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddPatientProfileResponse clone() => AddPatientProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddPatientProfileResponse copyWith(void Function(AddPatientProfileResponse) updates) => super.copyWith((message) => updates(message as AddPatientProfileResponse)) as AddPatientProfileResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddPatientProfileResponse create() => AddPatientProfileResponse._();
  AddPatientProfileResponse createEmptyInstance() => create();
  static $pb.PbList<AddPatientProfileResponse> createRepeated() => $pb.PbList<AddPatientProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static AddPatientProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddPatientProfileResponse>(create);
  static AddPatientProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get patientProfileAdded => $_getBF(1);
  @$pb.TagNumber(2)
  set patientProfileAdded($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPatientProfileAdded() => $_has(1);
  @$pb.TagNumber(2)
  void clearPatientProfileAdded() => clearField(2);

  @$pb.TagNumber(3)
  PatientTuple get patient => $_getN(2);
  @$pb.TagNumber(3)
  set patient(PatientTuple v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPatient() => $_has(2);
  @$pb.TagNumber(3)
  void clearPatient() => clearField(3);
  @$pb.TagNumber(3)
  PatientTuple ensurePatient() => $_ensure(2);
}

class MultiplePatient extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MultiplePatient', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientProfileId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'age', $pb.PbFieldType.O3)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender')
    ..hasRequiredFields = false
  ;

  MultiplePatient._() : super();
  factory MultiplePatient({
    $core.String? patientId,
    $core.String? patientProfileId,
    $core.String? mobileNumber,
    $core.String? firstName,
    $core.String? lastName,
    $core.int? age,
    $core.String? gender,
  }) {
    final _result = create();
    if (patientId != null) {
      _result.patientId = patientId;
    }
    if (patientProfileId != null) {
      _result.patientProfileId = patientProfileId;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    if (age != null) {
      _result.age = age;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    return _result;
  }
  factory MultiplePatient.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MultiplePatient.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MultiplePatient clone() => MultiplePatient()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MultiplePatient copyWith(void Function(MultiplePatient) updates) => super.copyWith((message) => updates(message as MultiplePatient)) as MultiplePatient; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MultiplePatient create() => MultiplePatient._();
  MultiplePatient createEmptyInstance() => create();
  static $pb.PbList<MultiplePatient> createRepeated() => $pb.PbList<MultiplePatient>();
  @$core.pragma('dart2js:noInline')
  static MultiplePatient getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MultiplePatient>(create);
  static MultiplePatient? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get patientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set patientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPatientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPatientId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get patientProfileId => $_getSZ(1);
  @$pb.TagNumber(2)
  set patientProfileId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPatientProfileId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPatientProfileId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mobileNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set mobileNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMobileNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearMobileNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get firstName => $_getSZ(3);
  @$pb.TagNumber(4)
  set firstName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFirstName() => $_has(3);
  @$pb.TagNumber(4)
  void clearFirstName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get lastName => $_getSZ(4);
  @$pb.TagNumber(5)
  set lastName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastName() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastName() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get age => $_getIZ(5);
  @$pb.TagNumber(6)
  set age($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAge() => $_has(5);
  @$pb.TagNumber(6)
  void clearAge() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get gender => $_getSZ(6);
  @$pb.TagNumber(7)
  set gender($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasGender() => $_has(6);
  @$pb.TagNumber(7)
  void clearGender() => clearField(7);
}

class FetchMultiplePatient extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchMultiplePatient', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..hasRequiredFields = false
  ;

  FetchMultiplePatient._() : super();
  factory FetchMultiplePatient({
    $core.String? userId,
    $core.String? userToken,
    $core.String? mobileNumber,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    return _result;
  }
  factory FetchMultiplePatient.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchMultiplePatient.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchMultiplePatient clone() => FetchMultiplePatient()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchMultiplePatient copyWith(void Function(FetchMultiplePatient) updates) => super.copyWith((message) => updates(message as FetchMultiplePatient)) as FetchMultiplePatient; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchMultiplePatient create() => FetchMultiplePatient._();
  FetchMultiplePatient createEmptyInstance() => create();
  static $pb.PbList<FetchMultiplePatient> createRepeated() => $pb.PbList<FetchMultiplePatient>();
  @$core.pragma('dart2js:noInline')
  static FetchMultiplePatient getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchMultiplePatient>(create);
  static FetchMultiplePatient? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mobileNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set mobileNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMobileNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearMobileNumber() => clearField(3);
}

class FetchMultiplePatientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchMultiplePatientResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..pc<MultiplePatient>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientdata', $pb.PbFieldType.PM, subBuilder: MultiplePatient.create)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientExists')
    ..hasRequiredFields = false
  ;

  FetchMultiplePatientResponse._() : super();
  factory FetchMultiplePatientResponse({
    $core.String? status,
    $core.Iterable<MultiplePatient>? patientdata,
    $core.bool? patientExists,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (patientdata != null) {
      _result.patientdata.addAll(patientdata);
    }
    if (patientExists != null) {
      _result.patientExists = patientExists;
    }
    return _result;
  }
  factory FetchMultiplePatientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchMultiplePatientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchMultiplePatientResponse clone() => FetchMultiplePatientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchMultiplePatientResponse copyWith(void Function(FetchMultiplePatientResponse) updates) => super.copyWith((message) => updates(message as FetchMultiplePatientResponse)) as FetchMultiplePatientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchMultiplePatientResponse create() => FetchMultiplePatientResponse._();
  FetchMultiplePatientResponse createEmptyInstance() => create();
  static $pb.PbList<FetchMultiplePatientResponse> createRepeated() => $pb.PbList<FetchMultiplePatientResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchMultiplePatientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchMultiplePatientResponse>(create);
  static FetchMultiplePatientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<MultiplePatient> get patientdata => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get patientExists => $_getBF(2);
  @$pb.TagNumber(3)
  set patientExists($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPatientExists() => $_has(2);
  @$pb.TagNumber(3)
  void clearPatientExists() => clearField(3);
}

class Answer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Answer', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'answer')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'summary')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'alert')
    ..hasRequiredFields = false
  ;

  Answer._() : super();
  factory Answer({
    $core.String? answer,
    $core.String? summary,
    $core.String? alert,
  }) {
    final _result = create();
    if (answer != null) {
      _result.answer = answer;
    }
    if (summary != null) {
      _result.summary = summary;
    }
    if (alert != null) {
      _result.alert = alert;
    }
    return _result;
  }
  factory Answer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Answer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Answer clone() => Answer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Answer copyWith(void Function(Answer) updates) => super.copyWith((message) => updates(message as Answer)) as Answer; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Answer create() => Answer._();
  Answer createEmptyInstance() => create();
  static $pb.PbList<Answer> createRepeated() => $pb.PbList<Answer>();
  @$core.pragma('dart2js:noInline')
  static Answer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Answer>(create);
  static Answer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get answer => $_getSZ(0);
  @$pb.TagNumber(1)
  set answer($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAnswer() => $_has(0);
  @$pb.TagNumber(1)
  void clearAnswer() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get summary => $_getSZ(1);
  @$pb.TagNumber(2)
  set summary($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSummary() => $_has(1);
  @$pb.TagNumber(2)
  void clearSummary() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get alert => $_getSZ(2);
  @$pb.TagNumber(3)
  set alert($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAlert() => $_has(2);
  @$pb.TagNumber(3)
  void clearAlert() => clearField(3);
}

class NewQuestion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewQuestion', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'questionType')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'question')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'answerType')
    ..pc<Answer>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'answers', $pb.PbFieldType.PM, subBuilder: Answer.create)
    ..hasRequiredFields = false
  ;

  NewQuestion._() : super();
  factory NewQuestion({
    $core.String? questionType,
    $core.String? question,
    $core.String? answerType,
    $core.Iterable<Answer>? answers,
  }) {
    final _result = create();
    if (questionType != null) {
      _result.questionType = questionType;
    }
    if (question != null) {
      _result.question = question;
    }
    if (answerType != null) {
      _result.answerType = answerType;
    }
    if (answers != null) {
      _result.answers.addAll(answers);
    }
    return _result;
  }
  factory NewQuestion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewQuestion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewQuestion clone() => NewQuestion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewQuestion copyWith(void Function(NewQuestion) updates) => super.copyWith((message) => updates(message as NewQuestion)) as NewQuestion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewQuestion create() => NewQuestion._();
  NewQuestion createEmptyInstance() => create();
  static $pb.PbList<NewQuestion> createRepeated() => $pb.PbList<NewQuestion>();
  @$core.pragma('dart2js:noInline')
  static NewQuestion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewQuestion>(create);
  static NewQuestion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get questionType => $_getSZ(0);
  @$pb.TagNumber(1)
  set questionType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuestionType() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestionType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get question => $_getSZ(1);
  @$pb.TagNumber(2)
  set question($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQuestion() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuestion() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get answerType => $_getSZ(2);
  @$pb.TagNumber(3)
  set answerType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAnswerType() => $_has(2);
  @$pb.TagNumber(3)
  void clearAnswerType() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<Answer> get answers => $_getList(3);
}

class Comorbidity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Comorbidity', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comorbidityId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  Comorbidity._() : super();
  factory Comorbidity({
    $core.String? comorbidityId,
    $core.String? name,
  }) {
    final _result = create();
    if (comorbidityId != null) {
      _result.comorbidityId = comorbidityId;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory Comorbidity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Comorbidity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Comorbidity clone() => Comorbidity()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Comorbidity copyWith(void Function(Comorbidity) updates) => super.copyWith((message) => updates(message as Comorbidity)) as Comorbidity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Comorbidity create() => Comorbidity._();
  Comorbidity createEmptyInstance() => create();
  static $pb.PbList<Comorbidity> createRepeated() => $pb.PbList<Comorbidity>();
  @$core.pragma('dart2js:noInline')
  static Comorbidity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Comorbidity>(create);
  static Comorbidity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get comorbidityId => $_getSZ(0);
  @$pb.TagNumber(1)
  set comorbidityId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasComorbidityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearComorbidityId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class UndiagnosisCreateFolloUp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UndiagnosisCreateFolloUp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'careTeamId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'age', $pb.PbFieldType.O3)
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'diseaseId')
    ..aInt64(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpStartTimestamp')
    ..aOB(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'recurring')
    ..a<$core.int>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numberOfDays', $pb.PbFieldType.O3)
    ..a<$core.int>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'repeatFrequency', $pb.PbFieldType.O3)
    ..a<$core.int>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dailyFrequency', $pb.PbFieldType.O3)
    ..pc<Comorbidity>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comorbidities', $pb.PbFieldType.PM, subBuilder: Comorbidity.create)
    ..pc<NewQuestion>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'additionalQuestions', $pb.PbFieldType.PM, subBuilder: NewQuestion.create)
    ..aOB(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'containsLabTests')
    ..aOS(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..pc<Media>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attachments', $pb.PbFieldType.PM, subBuilder: Media.create)
    ..aOB(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selectOneFollo')
    ..aOB(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scheduleAppointment')
    ..aInt64(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appointmentDate')
    ..aInt64(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secondFolloUpStartTimestamp')
    ..aOS(25, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'preferredCommunicationLanguage')
    ..aOS(26, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientProfileId')
    ..hasRequiredFields = false
  ;

  UndiagnosisCreateFolloUp._() : super();
  factory UndiagnosisCreateFolloUp({
    $core.String? userToken,
    $core.String? userId,
    $core.String? clinicId,
    $core.String? careTeamId,
    $core.String? mobileNumber,
    $core.String? firstName,
    $core.String? lastName,
    $core.int? age,
    $core.String? gender,
    $core.String? diseaseId,
    $fixnum.Int64? folloUpStartTimestamp,
    $core.bool? recurring,
    $core.int? numberOfDays,
    $core.int? repeatFrequency,
    $core.int? dailyFrequency,
    $core.Iterable<Comorbidity>? comorbidities,
    $core.Iterable<NewQuestion>? additionalQuestions,
    $core.bool? containsLabTests,
    $core.String? notes,
    $core.Iterable<Media>? attachments,
    $core.bool? selectOneFollo,
    $core.bool? scheduleAppointment,
    $fixnum.Int64? appointmentDate,
    $fixnum.Int64? secondFolloUpStartTimestamp,
    $core.String? preferredCommunicationLanguage,
    $core.String? patientProfileId,
  }) {
    final _result = create();
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    if (careTeamId != null) {
      _result.careTeamId = careTeamId;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    if (age != null) {
      _result.age = age;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    if (diseaseId != null) {
      _result.diseaseId = diseaseId;
    }
    if (folloUpStartTimestamp != null) {
      _result.folloUpStartTimestamp = folloUpStartTimestamp;
    }
    if (recurring != null) {
      _result.recurring = recurring;
    }
    if (numberOfDays != null) {
      _result.numberOfDays = numberOfDays;
    }
    if (repeatFrequency != null) {
      _result.repeatFrequency = repeatFrequency;
    }
    if (dailyFrequency != null) {
      _result.dailyFrequency = dailyFrequency;
    }
    if (comorbidities != null) {
      _result.comorbidities.addAll(comorbidities);
    }
    if (additionalQuestions != null) {
      _result.additionalQuestions.addAll(additionalQuestions);
    }
    if (containsLabTests != null) {
      _result.containsLabTests = containsLabTests;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    if (attachments != null) {
      _result.attachments.addAll(attachments);
    }
    if (selectOneFollo != null) {
      _result.selectOneFollo = selectOneFollo;
    }
    if (scheduleAppointment != null) {
      _result.scheduleAppointment = scheduleAppointment;
    }
    if (appointmentDate != null) {
      _result.appointmentDate = appointmentDate;
    }
    if (secondFolloUpStartTimestamp != null) {
      _result.secondFolloUpStartTimestamp = secondFolloUpStartTimestamp;
    }
    if (preferredCommunicationLanguage != null) {
      _result.preferredCommunicationLanguage = preferredCommunicationLanguage;
    }
    if (patientProfileId != null) {
      _result.patientProfileId = patientProfileId;
    }
    return _result;
  }
  factory UndiagnosisCreateFolloUp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UndiagnosisCreateFolloUp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UndiagnosisCreateFolloUp clone() => UndiagnosisCreateFolloUp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UndiagnosisCreateFolloUp copyWith(void Function(UndiagnosisCreateFolloUp) updates) => super.copyWith((message) => updates(message as UndiagnosisCreateFolloUp)) as UndiagnosisCreateFolloUp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UndiagnosisCreateFolloUp create() => UndiagnosisCreateFolloUp._();
  UndiagnosisCreateFolloUp createEmptyInstance() => create();
  static $pb.PbList<UndiagnosisCreateFolloUp> createRepeated() => $pb.PbList<UndiagnosisCreateFolloUp>();
  @$core.pragma('dart2js:noInline')
  static UndiagnosisCreateFolloUp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UndiagnosisCreateFolloUp>(create);
  static UndiagnosisCreateFolloUp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set userToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get clinicId => $_getSZ(2);
  @$pb.TagNumber(3)
  set clinicId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClinicId() => $_has(2);
  @$pb.TagNumber(3)
  void clearClinicId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get careTeamId => $_getSZ(3);
  @$pb.TagNumber(4)
  set careTeamId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCareTeamId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCareTeamId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get mobileNumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set mobileNumber($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMobileNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearMobileNumber() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get firstName => $_getSZ(5);
  @$pb.TagNumber(6)
  set firstName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFirstName() => $_has(5);
  @$pb.TagNumber(6)
  void clearFirstName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get lastName => $_getSZ(6);
  @$pb.TagNumber(7)
  set lastName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLastName() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastName() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get age => $_getIZ(7);
  @$pb.TagNumber(8)
  set age($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAge() => $_has(7);
  @$pb.TagNumber(8)
  void clearAge() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get gender => $_getSZ(8);
  @$pb.TagNumber(9)
  set gender($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasGender() => $_has(8);
  @$pb.TagNumber(9)
  void clearGender() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get diseaseId => $_getSZ(9);
  @$pb.TagNumber(10)
  set diseaseId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDiseaseId() => $_has(9);
  @$pb.TagNumber(10)
  void clearDiseaseId() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get folloUpStartTimestamp => $_getI64(10);
  @$pb.TagNumber(11)
  set folloUpStartTimestamp($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasFolloUpStartTimestamp() => $_has(10);
  @$pb.TagNumber(11)
  void clearFolloUpStartTimestamp() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get recurring => $_getBF(11);
  @$pb.TagNumber(12)
  set recurring($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasRecurring() => $_has(11);
  @$pb.TagNumber(12)
  void clearRecurring() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get numberOfDays => $_getIZ(12);
  @$pb.TagNumber(13)
  set numberOfDays($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasNumberOfDays() => $_has(12);
  @$pb.TagNumber(13)
  void clearNumberOfDays() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get repeatFrequency => $_getIZ(13);
  @$pb.TagNumber(14)
  set repeatFrequency($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasRepeatFrequency() => $_has(13);
  @$pb.TagNumber(14)
  void clearRepeatFrequency() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get dailyFrequency => $_getIZ(14);
  @$pb.TagNumber(15)
  set dailyFrequency($core.int v) { $_setSignedInt32(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasDailyFrequency() => $_has(14);
  @$pb.TagNumber(15)
  void clearDailyFrequency() => clearField(15);

  @$pb.TagNumber(16)
  $core.List<Comorbidity> get comorbidities => $_getList(15);

  @$pb.TagNumber(17)
  $core.List<NewQuestion> get additionalQuestions => $_getList(16);

  @$pb.TagNumber(18)
  $core.bool get containsLabTests => $_getBF(17);
  @$pb.TagNumber(18)
  set containsLabTests($core.bool v) { $_setBool(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasContainsLabTests() => $_has(17);
  @$pb.TagNumber(18)
  void clearContainsLabTests() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get notes => $_getSZ(18);
  @$pb.TagNumber(19)
  set notes($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasNotes() => $_has(18);
  @$pb.TagNumber(19)
  void clearNotes() => clearField(19);

  @$pb.TagNumber(20)
  $core.List<Media> get attachments => $_getList(19);

  @$pb.TagNumber(21)
  $core.bool get selectOneFollo => $_getBF(20);
  @$pb.TagNumber(21)
  set selectOneFollo($core.bool v) { $_setBool(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasSelectOneFollo() => $_has(20);
  @$pb.TagNumber(21)
  void clearSelectOneFollo() => clearField(21);

  @$pb.TagNumber(22)
  $core.bool get scheduleAppointment => $_getBF(21);
  @$pb.TagNumber(22)
  set scheduleAppointment($core.bool v) { $_setBool(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasScheduleAppointment() => $_has(21);
  @$pb.TagNumber(22)
  void clearScheduleAppointment() => clearField(22);

  @$pb.TagNumber(23)
  $fixnum.Int64 get appointmentDate => $_getI64(22);
  @$pb.TagNumber(23)
  set appointmentDate($fixnum.Int64 v) { $_setInt64(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasAppointmentDate() => $_has(22);
  @$pb.TagNumber(23)
  void clearAppointmentDate() => clearField(23);

  @$pb.TagNumber(24)
  $fixnum.Int64 get secondFolloUpStartTimestamp => $_getI64(23);
  @$pb.TagNumber(24)
  set secondFolloUpStartTimestamp($fixnum.Int64 v) { $_setInt64(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasSecondFolloUpStartTimestamp() => $_has(23);
  @$pb.TagNumber(24)
  void clearSecondFolloUpStartTimestamp() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get preferredCommunicationLanguage => $_getSZ(24);
  @$pb.TagNumber(25)
  set preferredCommunicationLanguage($core.String v) { $_setString(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasPreferredCommunicationLanguage() => $_has(24);
  @$pb.TagNumber(25)
  void clearPreferredCommunicationLanguage() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get patientProfileId => $_getSZ(25);
  @$pb.TagNumber(26)
  set patientProfileId($core.String v) { $_setString(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasPatientProfileId() => $_has(25);
  @$pb.TagNumber(26)
  void clearPatientProfileId() => clearField(26);
}

class UndiagnosisCreateFolloUpResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UndiagnosisCreateFolloUpResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpCreated')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folloUpId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  UndiagnosisCreateFolloUpResponse._() : super();
  factory UndiagnosisCreateFolloUpResponse({
    $core.String? status,
    $core.bool? folloUpCreated,
    $core.int? folloUpId,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (folloUpCreated != null) {
      _result.folloUpCreated = folloUpCreated;
    }
    if (folloUpId != null) {
      _result.folloUpId = folloUpId;
    }
    return _result;
  }
  factory UndiagnosisCreateFolloUpResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UndiagnosisCreateFolloUpResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UndiagnosisCreateFolloUpResponse clone() => UndiagnosisCreateFolloUpResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UndiagnosisCreateFolloUpResponse copyWith(void Function(UndiagnosisCreateFolloUpResponse) updates) => super.copyWith((message) => updates(message as UndiagnosisCreateFolloUpResponse)) as UndiagnosisCreateFolloUpResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UndiagnosisCreateFolloUpResponse create() => UndiagnosisCreateFolloUpResponse._();
  UndiagnosisCreateFolloUpResponse createEmptyInstance() => create();
  static $pb.PbList<UndiagnosisCreateFolloUpResponse> createRepeated() => $pb.PbList<UndiagnosisCreateFolloUpResponse>();
  @$core.pragma('dart2js:noInline')
  static UndiagnosisCreateFolloUpResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UndiagnosisCreateFolloUpResponse>(create);
  static UndiagnosisCreateFolloUpResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get folloUpCreated => $_getBF(1);
  @$pb.TagNumber(2)
  set folloUpCreated($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFolloUpCreated() => $_has(1);
  @$pb.TagNumber(2)
  void clearFolloUpCreated() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get folloUpId => $_getIZ(2);
  @$pb.TagNumber(3)
  set folloUpId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFolloUpId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFolloUpId() => clearField(3);
}

class PatientList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PatientList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..hasRequiredFields = false
  ;

  PatientList._() : super();
  factory PatientList({
    $core.String? userId,
    $core.String? userToken,
    $core.String? mobileNumber,
    $core.String? clinicId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    return _result;
  }
  factory PatientList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PatientList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PatientList clone() => PatientList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PatientList copyWith(void Function(PatientList) updates) => super.copyWith((message) => updates(message as PatientList)) as PatientList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatientList create() => PatientList._();
  PatientList createEmptyInstance() => create();
  static $pb.PbList<PatientList> createRepeated() => $pb.PbList<PatientList>();
  @$core.pragma('dart2js:noInline')
  static PatientList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PatientList>(create);
  static PatientList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mobileNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set mobileNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMobileNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearMobileNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get clinicId => $_getSZ(3);
  @$pb.TagNumber(4)
  set clinicId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasClinicId() => $_has(3);
  @$pb.TagNumber(4)
  void clearClinicId() => clearField(4);
}

class PatientListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PatientListResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..pc<Patient>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientdata', $pb.PbFieldType.PM, subBuilder: Patient.create)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientExists')
    ..hasRequiredFields = false
  ;

  PatientListResponse._() : super();
  factory PatientListResponse({
    $core.String? status,
    $core.Iterable<Patient>? patientdata,
    $core.bool? patientExists,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (patientdata != null) {
      _result.patientdata.addAll(patientdata);
    }
    if (patientExists != null) {
      _result.patientExists = patientExists;
    }
    return _result;
  }
  factory PatientListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PatientListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PatientListResponse clone() => PatientListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PatientListResponse copyWith(void Function(PatientListResponse) updates) => super.copyWith((message) => updates(message as PatientListResponse)) as PatientListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatientListResponse create() => PatientListResponse._();
  PatientListResponse createEmptyInstance() => create();
  static $pb.PbList<PatientListResponse> createRepeated() => $pb.PbList<PatientListResponse>();
  @$core.pragma('dart2js:noInline')
  static PatientListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PatientListResponse>(create);
  static PatientListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Patient> get patientdata => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get patientExists => $_getBF(2);
  @$pb.TagNumber(3)
  set patientExists($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPatientExists() => $_has(2);
  @$pb.TagNumber(3)
  void clearPatientExists() => clearField(3);
}

class EditPatientProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EditPatientProfile', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientProfileId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'age', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  EditPatientProfile._() : super();
  factory EditPatientProfile({
    $core.String? userId,
    $core.String? userToken,
    $core.String? patientProfileId,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? gender,
    $core.int? age,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (patientProfileId != null) {
      _result.patientProfileId = patientProfileId;
    }
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    if (age != null) {
      _result.age = age;
    }
    return _result;
  }
  factory EditPatientProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditPatientProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditPatientProfile clone() => EditPatientProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditPatientProfile copyWith(void Function(EditPatientProfile) updates) => super.copyWith((message) => updates(message as EditPatientProfile)) as EditPatientProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EditPatientProfile create() => EditPatientProfile._();
  EditPatientProfile createEmptyInstance() => create();
  static $pb.PbList<EditPatientProfile> createRepeated() => $pb.PbList<EditPatientProfile>();
  @$core.pragma('dart2js:noInline')
  static EditPatientProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditPatientProfile>(create);
  static EditPatientProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set userToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get patientProfileId => $_getSZ(2);
  @$pb.TagNumber(3)
  set patientProfileId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPatientProfileId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPatientProfileId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get firstName => $_getSZ(3);
  @$pb.TagNumber(4)
  set firstName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFirstName() => $_has(3);
  @$pb.TagNumber(4)
  void clearFirstName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get lastName => $_getSZ(4);
  @$pb.TagNumber(5)
  set lastName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastName() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get gender => $_getSZ(5);
  @$pb.TagNumber(6)
  set gender($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasGender() => $_has(5);
  @$pb.TagNumber(6)
  void clearGender() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get age => $_getIZ(6);
  @$pb.TagNumber(7)
  set age($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAge() => $_has(6);
  @$pb.TagNumber(7)
  void clearAge() => clearField(7);
}

class EditPatientProfileResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EditPatientProfileResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patientUpdated')
    ..hasRequiredFields = false
  ;

  EditPatientProfileResponse._() : super();
  factory EditPatientProfileResponse({
    $core.String? status,
    $core.bool? patientUpdated,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (patientUpdated != null) {
      _result.patientUpdated = patientUpdated;
    }
    return _result;
  }
  factory EditPatientProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditPatientProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditPatientProfileResponse clone() => EditPatientProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditPatientProfileResponse copyWith(void Function(EditPatientProfileResponse) updates) => super.copyWith((message) => updates(message as EditPatientProfileResponse)) as EditPatientProfileResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EditPatientProfileResponse create() => EditPatientProfileResponse._();
  EditPatientProfileResponse createEmptyInstance() => create();
  static $pb.PbList<EditPatientProfileResponse> createRepeated() => $pb.PbList<EditPatientProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static EditPatientProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditPatientProfileResponse>(create);
  static EditPatientProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get patientUpdated => $_getBF(1);
  @$pb.TagNumber(2)
  set patientUpdated($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPatientUpdated() => $_has(1);
  @$pb.TagNumber(2)
  void clearPatientUpdated() => clearField(2);
}

class CaregiverInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CaregiverInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userToken')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clinicId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'careTeamId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'caregiverId')
    ..hasRequiredFields = false
  ;

  CaregiverInfo._() : super();
  factory CaregiverInfo({
    $core.String? userToken,
    $core.String? userId,
    $core.String? clinicId,
    $core.String? careTeamId,
    $core.String? caregiverId,
  }) {
    final _result = create();
    if (userToken != null) {
      _result.userToken = userToken;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (clinicId != null) {
      _result.clinicId = clinicId;
    }
    if (careTeamId != null) {
      _result.careTeamId = careTeamId;
    }
    if (caregiverId != null) {
      _result.caregiverId = caregiverId;
    }
    return _result;
  }
  factory CaregiverInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CaregiverInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CaregiverInfo clone() => CaregiverInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CaregiverInfo copyWith(void Function(CaregiverInfo) updates) => super.copyWith((message) => updates(message as CaregiverInfo)) as CaregiverInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CaregiverInfo create() => CaregiverInfo._();
  CaregiverInfo createEmptyInstance() => create();
  static $pb.PbList<CaregiverInfo> createRepeated() => $pb.PbList<CaregiverInfo>();
  @$core.pragma('dart2js:noInline')
  static CaregiverInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CaregiverInfo>(create);
  static CaregiverInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set userToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get clinicId => $_getSZ(2);
  @$pb.TagNumber(3)
  set clinicId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClinicId() => $_has(2);
  @$pb.TagNumber(3)
  void clearClinicId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get careTeamId => $_getSZ(3);
  @$pb.TagNumber(4)
  set careTeamId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCareTeamId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCareTeamId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get caregiverId => $_getSZ(4);
  @$pb.TagNumber(5)
  set caregiverId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCaregiverId() => $_has(4);
  @$pb.TagNumber(5)
  void clearCaregiverId() => clearField(5);
}

class CaregiverInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CaregiverInfoResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'dashboard'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userType')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumber')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<Media>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'profilePicture', subBuilder: Media.create)
    ..aInt64(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateOfBirth')
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'licenseNumber')
    ..aOM<Media>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'medicalCertificate', subBuilder: Media.create)
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'qualifications')
    ..a<$core.int>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'experience', $pb.PbFieldType.O3)
    ..aOM<Media>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'degreeCertificate', subBuilder: Media.create)
    ..pc<CaregiverSpeciality>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'specialities', $pb.PbFieldType.PM, subBuilder: CaregiverSpeciality.create)
    ..aOS(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userStatus')
    ..aOS(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'emergencyContactNumber')
    ..aOS(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appointmentUrl')
    ..aOS(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'about')
    ..hasRequiredFields = false
  ;

  CaregiverInfoResponse._() : super();
  factory CaregiverInfoResponse({
    $core.String? status,
    $core.String? userId,
    $core.String? email,
    $core.String? userType,
    $core.String? role,
    $core.String? mobileNumber,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? name,
    Media? profilePicture,
    $fixnum.Int64? dateOfBirth,
    $core.String? licenseNumber,
    Media? medicalCertificate,
    $core.String? qualifications,
    $core.int? experience,
    Media? degreeCertificate,
    $core.Iterable<CaregiverSpeciality>? specialities,
    $core.String? userStatus,
    $core.String? emergencyContactNumber,
    $core.String? appointmentUrl,
    $core.String? about,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (email != null) {
      _result.email = email;
    }
    if (userType != null) {
      _result.userType = userType;
    }
    if (role != null) {
      _result.role = role;
    }
    if (mobileNumber != null) {
      _result.mobileNumber = mobileNumber;
    }
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    if (name != null) {
      _result.name = name;
    }
    if (profilePicture != null) {
      _result.profilePicture = profilePicture;
    }
    if (dateOfBirth != null) {
      _result.dateOfBirth = dateOfBirth;
    }
    if (licenseNumber != null) {
      _result.licenseNumber = licenseNumber;
    }
    if (medicalCertificate != null) {
      _result.medicalCertificate = medicalCertificate;
    }
    if (qualifications != null) {
      _result.qualifications = qualifications;
    }
    if (experience != null) {
      _result.experience = experience;
    }
    if (degreeCertificate != null) {
      _result.degreeCertificate = degreeCertificate;
    }
    if (specialities != null) {
      _result.specialities.addAll(specialities);
    }
    if (userStatus != null) {
      _result.userStatus = userStatus;
    }
    if (emergencyContactNumber != null) {
      _result.emergencyContactNumber = emergencyContactNumber;
    }
    if (appointmentUrl != null) {
      _result.appointmentUrl = appointmentUrl;
    }
    if (about != null) {
      _result.about = about;
    }
    return _result;
  }
  factory CaregiverInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CaregiverInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CaregiverInfoResponse clone() => CaregiverInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CaregiverInfoResponse copyWith(void Function(CaregiverInfoResponse) updates) => super.copyWith((message) => updates(message as CaregiverInfoResponse)) as CaregiverInfoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CaregiverInfoResponse create() => CaregiverInfoResponse._();
  CaregiverInfoResponse createEmptyInstance() => create();
  static $pb.PbList<CaregiverInfoResponse> createRepeated() => $pb.PbList<CaregiverInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static CaregiverInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CaregiverInfoResponse>(create);
  static CaregiverInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userType => $_getSZ(3);
  @$pb.TagNumber(4)
  set userType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserType() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get role => $_getSZ(4);
  @$pb.TagNumber(5)
  set role($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRole() => $_has(4);
  @$pb.TagNumber(5)
  void clearRole() => clearField(5);

  @$pb.TagNumber(8)
  $core.String get mobileNumber => $_getSZ(5);
  @$pb.TagNumber(8)
  set mobileNumber($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(8)
  $core.bool hasMobileNumber() => $_has(5);
  @$pb.TagNumber(8)
  void clearMobileNumber() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get firstName => $_getSZ(6);
  @$pb.TagNumber(9)
  set firstName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(9)
  $core.bool hasFirstName() => $_has(6);
  @$pb.TagNumber(9)
  void clearFirstName() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get lastName => $_getSZ(7);
  @$pb.TagNumber(10)
  set lastName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(10)
  $core.bool hasLastName() => $_has(7);
  @$pb.TagNumber(10)
  void clearLastName() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get name => $_getSZ(8);
  @$pb.TagNumber(11)
  set name($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(11)
  $core.bool hasName() => $_has(8);
  @$pb.TagNumber(11)
  void clearName() => clearField(11);

  @$pb.TagNumber(12)
  Media get profilePicture => $_getN(9);
  @$pb.TagNumber(12)
  set profilePicture(Media v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasProfilePicture() => $_has(9);
  @$pb.TagNumber(12)
  void clearProfilePicture() => clearField(12);
  @$pb.TagNumber(12)
  Media ensureProfilePicture() => $_ensure(9);

  @$pb.TagNumber(13)
  $fixnum.Int64 get dateOfBirth => $_getI64(10);
  @$pb.TagNumber(13)
  set dateOfBirth($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(13)
  $core.bool hasDateOfBirth() => $_has(10);
  @$pb.TagNumber(13)
  void clearDateOfBirth() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get licenseNumber => $_getSZ(11);
  @$pb.TagNumber(14)
  set licenseNumber($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(14)
  $core.bool hasLicenseNumber() => $_has(11);
  @$pb.TagNumber(14)
  void clearLicenseNumber() => clearField(14);

  @$pb.TagNumber(15)
  Media get medicalCertificate => $_getN(12);
  @$pb.TagNumber(15)
  set medicalCertificate(Media v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasMedicalCertificate() => $_has(12);
  @$pb.TagNumber(15)
  void clearMedicalCertificate() => clearField(15);
  @$pb.TagNumber(15)
  Media ensureMedicalCertificate() => $_ensure(12);

  @$pb.TagNumber(16)
  $core.String get qualifications => $_getSZ(13);
  @$pb.TagNumber(16)
  set qualifications($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(16)
  $core.bool hasQualifications() => $_has(13);
  @$pb.TagNumber(16)
  void clearQualifications() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get experience => $_getIZ(14);
  @$pb.TagNumber(17)
  set experience($core.int v) { $_setSignedInt32(14, v); }
  @$pb.TagNumber(17)
  $core.bool hasExperience() => $_has(14);
  @$pb.TagNumber(17)
  void clearExperience() => clearField(17);

  @$pb.TagNumber(18)
  Media get degreeCertificate => $_getN(15);
  @$pb.TagNumber(18)
  set degreeCertificate(Media v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasDegreeCertificate() => $_has(15);
  @$pb.TagNumber(18)
  void clearDegreeCertificate() => clearField(18);
  @$pb.TagNumber(18)
  Media ensureDegreeCertificate() => $_ensure(15);

  @$pb.TagNumber(19)
  $core.List<CaregiverSpeciality> get specialities => $_getList(16);

  @$pb.TagNumber(20)
  $core.String get userStatus => $_getSZ(17);
  @$pb.TagNumber(20)
  set userStatus($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(20)
  $core.bool hasUserStatus() => $_has(17);
  @$pb.TagNumber(20)
  void clearUserStatus() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get emergencyContactNumber => $_getSZ(18);
  @$pb.TagNumber(21)
  set emergencyContactNumber($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(21)
  $core.bool hasEmergencyContactNumber() => $_has(18);
  @$pb.TagNumber(21)
  void clearEmergencyContactNumber() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get appointmentUrl => $_getSZ(19);
  @$pb.TagNumber(22)
  set appointmentUrl($core.String v) { $_setString(19, v); }
  @$pb.TagNumber(22)
  $core.bool hasAppointmentUrl() => $_has(19);
  @$pb.TagNumber(22)
  void clearAppointmentUrl() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get about => $_getSZ(20);
  @$pb.TagNumber(23)
  set about($core.String v) { $_setString(20, v); }
  @$pb.TagNumber(23)
  $core.bool hasAbout() => $_has(20);
  @$pb.TagNumber(23)
  void clearAbout() => clearField(23);
}


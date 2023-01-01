///
//  Generated code. Do not modify.
//  source: follo.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use sendOTPDescriptor instead')
const SendOTP$json = const {
  '1': 'SendOTP',
  '2': const [
    const {'1': 'mobile_number', '3': 1, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'clinic_id', '3': 2, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `SendOTP`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendOTPDescriptor = $convert.base64Decode('CgdTZW5kT1RQEiMKDW1vYmlsZV9udW1iZXIYASABKAlSDG1vYmlsZU51bWJlchIbCgljbGluaWNfaWQYAiABKAlSCGNsaW5pY0lk');
@$core.Deprecated('Use sendOTPResponseDescriptor instead')
const SendOTPResponse$json = const {
  '1': 'SendOTPResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'mobile_number', '3': 2, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'otp_sent', '3': 3, '4': 1, '5': 8, '10': 'otpSent'},
  ],
};

/// Descriptor for `SendOTPResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendOTPResponseDescriptor = $convert.base64Decode('Cg9TZW5kT1RQUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSIwoNbW9iaWxlX251bWJlchgCIAEoCVIMbW9iaWxlTnVtYmVyEhkKCG90cF9zZW50GAMgASgIUgdvdHBTZW50');
@$core.Deprecated('Use resendOTPDescriptor instead')
const ResendOTP$json = const {
  '1': 'ResendOTP',
  '2': const [
    const {'1': 'mobile_number', '3': 1, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'retry_type', '3': 2, '4': 1, '5': 9, '10': 'retryType'},
    const {'1': 'clinic_id', '3': 3, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `ResendOTP`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resendOTPDescriptor = $convert.base64Decode('CglSZXNlbmRPVFASIwoNbW9iaWxlX251bWJlchgBIAEoCVIMbW9iaWxlTnVtYmVyEh0KCnJldHJ5X3R5cGUYAiABKAlSCXJldHJ5VHlwZRIbCgljbGluaWNfaWQYAyABKAlSCGNsaW5pY0lk');
@$core.Deprecated('Use resendOTPResponseDescriptor instead')
const ResendOTPResponse$json = const {
  '1': 'ResendOTPResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'mobile_number', '3': 2, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'otp_resent', '3': 3, '4': 1, '5': 8, '10': 'otpResent'},
  ],
};

/// Descriptor for `ResendOTPResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resendOTPResponseDescriptor = $convert.base64Decode('ChFSZXNlbmRPVFBSZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxIjCg1tb2JpbGVfbnVtYmVyGAIgASgJUgxtb2JpbGVOdW1iZXISHQoKb3RwX3Jlc2VudBgDIAEoCFIJb3RwUmVzZW50');
@$core.Deprecated('Use verifyOTPDescriptor instead')
const VerifyOTP$json = const {
  '1': 'VerifyOTP',
  '2': const [
    const {'1': 'mobile_number', '3': 1, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'user_otp', '3': 2, '4': 1, '5': 5, '10': 'userOtp'},
    const {'1': 'clinic_id', '3': 3, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `VerifyOTP`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyOTPDescriptor = $convert.base64Decode('CglWZXJpZnlPVFASIwoNbW9iaWxlX251bWJlchgBIAEoCVIMbW9iaWxlTnVtYmVyEhkKCHVzZXJfb3RwGAIgASgFUgd1c2VyT3RwEhsKCWNsaW5pY19pZBgDIAEoCVIIY2xpbmljSWQ=');
@$core.Deprecated('Use verifyOTPResponseDescriptor instead')
const VerifyOTPResponse$json = const {
  '1': 'VerifyOTPResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'mobile_number', '3': 2, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'otp_verified', '3': 3, '4': 1, '5': 8, '10': 'otpVerified'},
  ],
};

/// Descriptor for `VerifyOTPResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyOTPResponseDescriptor = $convert.base64Decode('ChFWZXJpZnlPVFBSZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxIjCg1tb2JpbGVfbnVtYmVyGAIgASgJUgxtb2JpbGVOdW1iZXISIQoMb3RwX3ZlcmlmaWVkGAMgASgIUgtvdHBWZXJpZmllZA==');
@$core.Deprecated('Use patientPresentDescriptor instead')
const PatientPresent$json = const {
  '1': 'PatientPresent',
  '2': const [
    const {'1': 'mobile_number', '3': 1, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'clinic_id', '3': 2, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `PatientPresent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patientPresentDescriptor = $convert.base64Decode('Cg5QYXRpZW50UHJlc2VudBIjCg1tb2JpbGVfbnVtYmVyGAEgASgJUgxtb2JpbGVOdW1iZXISGwoJY2xpbmljX2lkGAIgASgJUghjbGluaWNJZA==');
@$core.Deprecated('Use patientPresentResponseDescriptor instead')
const PatientPresentResponse$json = const {
  '1': 'PatientPresentResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'mobile_number', '3': 2, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'user_present', '3': 3, '4': 1, '5': 8, '10': 'userPresent'},
    const {'1': 'user_type', '3': 4, '4': 1, '5': 9, '10': 'userType'},
    const {'1': 'user_exists_on_app', '3': 5, '4': 1, '5': 8, '10': 'userExistsOnApp'},
  ],
};

/// Descriptor for `PatientPresentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patientPresentResponseDescriptor = $convert.base64Decode('ChZQYXRpZW50UHJlc2VudFJlc3BvbnNlEhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVzEiMKDW1vYmlsZV9udW1iZXIYAiABKAlSDG1vYmlsZU51bWJlchIhCgx1c2VyX3ByZXNlbnQYAyABKAhSC3VzZXJQcmVzZW50EhsKCXVzZXJfdHlwZRgEIAEoCVIIdXNlclR5cGUSKwoSdXNlcl9leGlzdHNfb25fYXBwGAUgASgIUg91c2VyRXhpc3RzT25BcHA=');
@$core.Deprecated('Use patientAuthenticateDescriptor instead')
const PatientAuthenticate$json = const {
  '1': 'PatientAuthenticate',
  '2': const [
    const {'1': 'mobile_number', '3': 1, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'user_pin', '3': 2, '4': 1, '5': 5, '10': 'userPin'},
    const {'1': 'user_biometric', '3': 3, '4': 1, '5': 8, '10': 'userBiometric'},
    const {'1': 'clinic_id', '3': 4, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `PatientAuthenticate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patientAuthenticateDescriptor = $convert.base64Decode('ChNQYXRpZW50QXV0aGVudGljYXRlEiMKDW1vYmlsZV9udW1iZXIYASABKAlSDG1vYmlsZU51bWJlchIZCgh1c2VyX3BpbhgCIAEoBVIHdXNlclBpbhIlCg51c2VyX2Jpb21ldHJpYxgDIAEoCFINdXNlckJpb21ldHJpYxIbCgljbGluaWNfaWQYBCABKAlSCGNsaW5pY0lk');
@$core.Deprecated('Use patientAuthenticateResponseDescriptor instead')
const PatientAuthenticateResponse$json = const {
  '1': 'PatientAuthenticateResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'mobile_number', '3': 2, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'authenticated', '3': 3, '4': 1, '5': 8, '10': 'authenticated'},
    const {'1': 'user_token', '3': 4, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'user_type', '3': 5, '4': 1, '5': 9, '10': 'userType'},
    const {'1': 'user_id', '3': 6, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'sign_up_details', '3': 7, '4': 1, '5': 8, '10': 'signUpDetails'},
  ],
};

/// Descriptor for `PatientAuthenticateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patientAuthenticateResponseDescriptor = $convert.base64Decode('ChtQYXRpZW50QXV0aGVudGljYXRlUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSIwoNbW9iaWxlX251bWJlchgCIAEoCVIMbW9iaWxlTnVtYmVyEiQKDWF1dGhlbnRpY2F0ZWQYAyABKAhSDWF1dGhlbnRpY2F0ZWQSHQoKdXNlcl90b2tlbhgEIAEoCVIJdXNlclRva2VuEhsKCXVzZXJfdHlwZRgFIAEoCVIIdXNlclR5cGUSFwoHdXNlcl9pZBgGIAEoCVIGdXNlcklkEiYKD3NpZ25fdXBfZGV0YWlscxgHIAEoCFINc2lnblVwRGV0YWlscw==');
@$core.Deprecated('Use logoutDescriptor instead')
const Logout$json = const {
  '1': 'Logout',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'clinic_id', '3': 3, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `Logout`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutDescriptor = $convert.base64Decode('CgZMb2dvdXQSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEh0KCnVzZXJfdG9rZW4YAiABKAlSCXVzZXJUb2tlbhIbCgljbGluaWNfaWQYAyABKAlSCGNsaW5pY0lk');
@$core.Deprecated('Use logoutResponseDescriptor instead')
const LogoutResponse$json = const {
  '1': 'LogoutResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'logged_out', '3': 2, '4': 1, '5': 8, '10': 'loggedOut'},
    const {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `LogoutResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutResponseDescriptor = $convert.base64Decode('Cg5Mb2dvdXRSZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxIdCgpsb2dnZWRfb3V0GAIgASgIUglsb2dnZWRPdXQSFwoHdXNlcl9pZBgDIAEoCVIGdXNlcklk');
@$core.Deprecated('Use setPinDescriptor instead')
const SetPin$json = const {
  '1': 'SetPin',
  '2': const [
    const {'1': 'mobile_number', '3': 1, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'user_otp', '3': 2, '4': 1, '5': 5, '10': 'userOtp'},
    const {'1': 'user_pin', '3': 3, '4': 1, '5': 5, '10': 'userPin'},
    const {'1': 'clinic_id', '3': 4, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `SetPin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setPinDescriptor = $convert.base64Decode('CgZTZXRQaW4SIwoNbW9iaWxlX251bWJlchgBIAEoCVIMbW9iaWxlTnVtYmVyEhkKCHVzZXJfb3RwGAIgASgFUgd1c2VyT3RwEhkKCHVzZXJfcGluGAMgASgFUgd1c2VyUGluEhsKCWNsaW5pY19pZBgEIAEoCVIIY2xpbmljSWQ=');
@$core.Deprecated('Use setPinResponseDescriptor instead')
const SetPinResponse$json = const {
  '1': 'SetPinResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'mobile_number', '3': 2, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'pin_set', '3': 3, '4': 1, '5': 8, '10': 'pinSet'},
    const {'1': 'user_token', '3': 4, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'user_id', '3': 5, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `SetPinResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setPinResponseDescriptor = $convert.base64Decode('Cg5TZXRQaW5SZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxIjCg1tb2JpbGVfbnVtYmVyGAIgASgJUgxtb2JpbGVOdW1iZXISFwoHcGluX3NldBgDIAEoCFIGcGluU2V0Eh0KCnVzZXJfdG9rZW4YBCABKAlSCXVzZXJUb2tlbhIXCgd1c2VyX2lkGAUgASgJUgZ1c2VySWQ=');
@$core.Deprecated('Use refreshTokenDescriptor instead')
const RefreshToken$json = const {
  '1': 'RefreshToken',
  '2': const [
    const {'1': 'user_token', '3': 1, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `RefreshToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenDescriptor = $convert.base64Decode('CgxSZWZyZXNoVG9rZW4SHQoKdXNlcl90b2tlbhgBIAEoCVIJdXNlclRva2VuEhcKB3VzZXJfaWQYAiABKAlSBnVzZXJJZA==');
@$core.Deprecated('Use refreshTokenResponseDescriptor instead')
const RefreshTokenResponse$json = const {
  '1': 'RefreshTokenResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'token_refreshed', '3': 2, '4': 1, '5': 8, '10': 'tokenRefreshed'},
    const {'1': 'user_token', '3': 3, '4': 1, '5': 9, '10': 'userToken'},
  ],
};

/// Descriptor for `RefreshTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenResponseDescriptor = $convert.base64Decode('ChRSZWZyZXNoVG9rZW5SZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxInCg90b2tlbl9yZWZyZXNoZWQYAiABKAhSDnRva2VuUmVmcmVzaGVkEh0KCnVzZXJfdG9rZW4YAyABKAlSCXVzZXJUb2tlbg==');
@$core.Deprecated('Use mediaDescriptor instead')
const Media$json = const {
  '1': 'Media',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'media_type', '3': 2, '4': 1, '5': 9, '10': 'mediaType'},
    const {'1': 'file_name', '3': 3, '4': 1, '5': 9, '10': 'fileName'},
  ],
};

/// Descriptor for `Media`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaDescriptor = $convert.base64Decode('CgVNZWRpYRIQCgN1cmwYASABKAlSA3VybBIdCgptZWRpYV90eXBlGAIgASgJUgltZWRpYVR5cGUSGwoJZmlsZV9uYW1lGAMgASgJUghmaWxlTmFtZQ==');
@$core.Deprecated('Use patientSignUpDescriptor instead')
const PatientSignUp$json = const {
  '1': 'PatientSignUp',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'first_name', '3': 3, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'last_name', '3': 4, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'mobile_number', '3': 5, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'date_of_birth', '3': 6, '4': 1, '5': 3, '10': 'dateOfBirth'},
    const {'1': 'gender', '3': 7, '4': 1, '5': 9, '10': 'gender'},
    const {'1': 'role', '3': 8, '4': 1, '5': 9, '10': 'role'},
    const {'1': 'age', '3': 9, '4': 1, '5': 5, '10': 'age'},
    const {'1': 'profile_picture', '3': 10, '4': 1, '5': 11, '6': '.dashboard.Media', '10': 'profilePicture'},
    const {'1': 'clinic_id', '3': 11, '4': 1, '5': 9, '10': 'clinicId'},
    const {'1': 'email', '3': 12, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `PatientSignUp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patientSignUpDescriptor = $convert.base64Decode('Cg1QYXRpZW50U2lnblVwEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIdCgp1c2VyX3Rva2VuGAIgASgJUgl1c2VyVG9rZW4SHQoKZmlyc3RfbmFtZRgDIAEoCVIJZmlyc3ROYW1lEhsKCWxhc3RfbmFtZRgEIAEoCVIIbGFzdE5hbWUSIwoNbW9iaWxlX251bWJlchgFIAEoCVIMbW9iaWxlTnVtYmVyEiIKDWRhdGVfb2ZfYmlydGgYBiABKANSC2RhdGVPZkJpcnRoEhYKBmdlbmRlchgHIAEoCVIGZ2VuZGVyEhIKBHJvbGUYCCABKAlSBHJvbGUSEAoDYWdlGAkgASgFUgNhZ2USOQoPcHJvZmlsZV9waWN0dXJlGAogASgLMhAuZGFzaGJvYXJkLk1lZGlhUg5wcm9maWxlUGljdHVyZRIbCgljbGluaWNfaWQYCyABKAlSCGNsaW5pY0lkEhQKBWVtYWlsGAwgASgJUgVlbWFpbA==');
@$core.Deprecated('Use patientSignUpResponseDescriptor instead')
const PatientSignUpResponse$json = const {
  '1': 'PatientSignUpResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'sign_up_success', '3': 2, '4': 1, '5': 8, '10': 'signUpSuccess'},
  ],
};

/// Descriptor for `PatientSignUpResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patientSignUpResponseDescriptor = $convert.base64Decode('ChVQYXRpZW50U2lnblVwUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSJgoPc2lnbl91cF9zdWNjZXNzGAIgASgIUg1zaWduVXBTdWNjZXNz');
@$core.Deprecated('Use patientHistoryDescriptor instead')
const PatientHistory$json = const {
  '1': 'PatientHistory',
  '2': const [
    const {'1': 'follo_up_id', '3': 1, '4': 1, '5': 5, '10': 'folloUpId'},
    const {'1': 'disease_name', '3': 2, '4': 1, '5': 9, '10': 'diseaseName'},
    const {'1': 'date', '3': 3, '4': 1, '5': 9, '10': 'date'},
    const {'1': 'caregiver_id', '3': 4, '4': 1, '5': 9, '10': 'caregiverId'},
    const {'1': 'created_by_current_doctor', '3': 5, '4': 1, '5': 8, '10': 'createdByCurrentDoctor'},
    const {'1': 'clinic_id', '3': 6, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `PatientHistory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patientHistoryDescriptor = $convert.base64Decode('Cg5QYXRpZW50SGlzdG9yeRIeCgtmb2xsb191cF9pZBgBIAEoBVIJZm9sbG9VcElkEiEKDGRpc2Vhc2VfbmFtZRgCIAEoCVILZGlzZWFzZU5hbWUSEgoEZGF0ZRgDIAEoCVIEZGF0ZRIhCgxjYXJlZ2l2ZXJfaWQYBCABKAlSC2NhcmVnaXZlcklkEjkKGWNyZWF0ZWRfYnlfY3VycmVudF9kb2N0b3IYBSABKAhSFmNyZWF0ZWRCeUN1cnJlbnREb2N0b3ISGwoJY2xpbmljX2lkGAYgASgJUghjbGluaWNJZA==');
@$core.Deprecated('Use patientDescriptor instead')
const Patient$json = const {
  '1': 'Patient',
  '2': const [
    const {'1': 'patient_id', '3': 1, '4': 1, '5': 9, '10': 'patientId'},
    const {'1': 'mobile_number', '3': 2, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'first_name', '3': 3, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'last_name', '3': 4, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'age', '3': 5, '4': 1, '5': 5, '10': 'age'},
    const {'1': 'gender', '3': 6, '4': 1, '5': 9, '10': 'gender'},
    const {'1': 'history', '3': 7, '4': 3, '5': 11, '6': '.dashboard.PatientHistory', '10': 'history'},
    const {'1': 'clinic_id', '3': 8, '4': 1, '5': 9, '10': 'clinicId'},
    const {'1': 'date_of_birth', '3': 9, '4': 1, '5': 3, '10': 'dateOfBirth'},
    const {'1': 'profile_picture', '3': 10, '4': 1, '5': 11, '6': '.dashboard.Media', '10': 'profilePicture'},
    const {'1': 'email', '3': 11, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'patient_profile_id', '3': 12, '4': 1, '5': 9, '10': 'patientProfileId'},
  ],
};

/// Descriptor for `Patient`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patientDescriptor = $convert.base64Decode('CgdQYXRpZW50Eh0KCnBhdGllbnRfaWQYASABKAlSCXBhdGllbnRJZBIjCg1tb2JpbGVfbnVtYmVyGAIgASgJUgxtb2JpbGVOdW1iZXISHQoKZmlyc3RfbmFtZRgDIAEoCVIJZmlyc3ROYW1lEhsKCWxhc3RfbmFtZRgEIAEoCVIIbGFzdE5hbWUSEAoDYWdlGAUgASgFUgNhZ2USFgoGZ2VuZGVyGAYgASgJUgZnZW5kZXISMwoHaGlzdG9yeRgHIAMoCzIZLmRhc2hib2FyZC5QYXRpZW50SGlzdG9yeVIHaGlzdG9yeRIbCgljbGluaWNfaWQYCCABKAlSCGNsaW5pY0lkEiIKDWRhdGVfb2ZfYmlydGgYCSABKANSC2RhdGVPZkJpcnRoEjkKD3Byb2ZpbGVfcGljdHVyZRgKIAEoCzIQLmRhc2hib2FyZC5NZWRpYVIOcHJvZmlsZVBpY3R1cmUSFAoFZW1haWwYCyABKAlSBWVtYWlsEiwKEnBhdGllbnRfcHJvZmlsZV9pZBgMIAEoCVIQcGF0aWVudFByb2ZpbGVJZA==');
@$core.Deprecated('Use fetchPatientDescriptor instead')
const FetchPatient$json = const {
  '1': 'FetchPatient',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'mobile_number', '3': 3, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'clinic_id', '3': 4, '4': 1, '5': 9, '10': 'clinicId'},
    const {'1': 'patient_profile_id', '3': 5, '4': 1, '5': 9, '10': 'patientProfileId'},
  ],
};

/// Descriptor for `FetchPatient`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchPatientDescriptor = $convert.base64Decode('CgxGZXRjaFBhdGllbnQSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEh0KCnVzZXJfdG9rZW4YAiABKAlSCXVzZXJUb2tlbhIjCg1tb2JpbGVfbnVtYmVyGAMgASgJUgxtb2JpbGVOdW1iZXISGwoJY2xpbmljX2lkGAQgASgJUghjbGluaWNJZBIsChJwYXRpZW50X3Byb2ZpbGVfaWQYBSABKAlSEHBhdGllbnRQcm9maWxlSWQ=');
@$core.Deprecated('Use fetchPatientResponseDescriptor instead')
const FetchPatientResponse$json = const {
  '1': 'FetchPatientResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'patientdata', '3': 2, '4': 1, '5': 11, '6': '.dashboard.Patient', '10': 'patientdata'},
    const {'1': 'patient_exists', '3': 3, '4': 1, '5': 8, '10': 'patientExists'},
  ],
};

/// Descriptor for `FetchPatientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchPatientResponseDescriptor = $convert.base64Decode('ChRGZXRjaFBhdGllbnRSZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxI0CgtwYXRpZW50ZGF0YRgCIAEoCzISLmRhc2hib2FyZC5QYXRpZW50UgtwYXRpZW50ZGF0YRIlCg5wYXRpZW50X2V4aXN0cxgDIAEoCFINcGF0aWVudEV4aXN0cw==');
@$core.Deprecated('Use initialSubscriptionDescriptor instead')
const InitialSubscription$json = const {
  '1': 'InitialSubscription',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'player_id', '3': 3, '4': 1, '5': 9, '10': 'playerId'},
    const {'1': 'device_id', '3': 4, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'subscribed', '3': 5, '4': 1, '5': 8, '10': 'subscribed'},
    const {'1': 'user_subscription_setting', '3': 6, '4': 1, '5': 8, '10': 'userSubscriptionSetting'},
    const {'1': 'push_token', '3': 7, '4': 1, '5': 9, '10': 'pushToken'},
    const {'1': 'clinic_id', '3': 8, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `InitialSubscription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initialSubscriptionDescriptor = $convert.base64Decode('ChNJbml0aWFsU3Vic2NyaXB0aW9uEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIdCgp1c2VyX3Rva2VuGAIgASgJUgl1c2VyVG9rZW4SGwoJcGxheWVyX2lkGAMgASgJUghwbGF5ZXJJZBIbCglkZXZpY2VfaWQYBCABKAlSCGRldmljZUlkEh4KCnN1YnNjcmliZWQYBSABKAhSCnN1YnNjcmliZWQSOgoZdXNlcl9zdWJzY3JpcHRpb25fc2V0dGluZxgGIAEoCFIXdXNlclN1YnNjcmlwdGlvblNldHRpbmcSHQoKcHVzaF90b2tlbhgHIAEoCVIJcHVzaFRva2VuEhsKCWNsaW5pY19pZBgIIAEoCVIIY2xpbmljSWQ=');
@$core.Deprecated('Use initialSubscriptionResponseDescriptor instead')
const InitialSubscriptionResponse$json = const {
  '1': 'InitialSubscriptionResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'subscribed', '3': 2, '4': 1, '5': 8, '10': 'subscribed'},
  ],
};

/// Descriptor for `InitialSubscriptionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initialSubscriptionResponseDescriptor = $convert.base64Decode('ChtJbml0aWFsU3Vic2NyaXB0aW9uUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSHgoKc3Vic2NyaWJlZBgCIAEoCFIKc3Vic2NyaWJlZA==');
@$core.Deprecated('Use updateNotificationDescriptor instead')
const UpdateNotification$json = const {
  '1': 'UpdateNotification',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'subscribed', '3': 3, '4': 1, '5': 8, '10': 'subscribed'},
    const {'1': 'player_id', '3': 4, '4': 1, '5': 9, '10': 'playerId'},
    const {'1': 'patient_critical_alert', '3': 5, '4': 1, '5': 8, '10': 'patientCriticalAlert'},
    const {'1': 'patient_message_chat', '3': 6, '4': 1, '5': 8, '10': 'patientMessageChat'},
    const {'1': 'patient_id', '3': 7, '4': 1, '5': 9, '10': 'patientId'},
    const {'1': 'clinic_id', '3': 8, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `UpdateNotification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateNotificationDescriptor = $convert.base64Decode('ChJVcGRhdGVOb3RpZmljYXRpb24SFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEh0KCnVzZXJfdG9rZW4YAiABKAlSCXVzZXJUb2tlbhIeCgpzdWJzY3JpYmVkGAMgASgIUgpzdWJzY3JpYmVkEhsKCXBsYXllcl9pZBgEIAEoCVIIcGxheWVySWQSNAoWcGF0aWVudF9jcml0aWNhbF9hbGVydBgFIAEoCFIUcGF0aWVudENyaXRpY2FsQWxlcnQSMAoUcGF0aWVudF9tZXNzYWdlX2NoYXQYBiABKAhSEnBhdGllbnRNZXNzYWdlQ2hhdBIdCgpwYXRpZW50X2lkGAcgASgJUglwYXRpZW50SWQSGwoJY2xpbmljX2lkGAggASgJUghjbGluaWNJZA==');
@$core.Deprecated('Use updateNotificationResponseDescriptor instead')
const UpdateNotificationResponse$json = const {
  '1': 'UpdateNotificationResponse',
  '2': const [
    const {'1': 'patient_id', '3': 1, '4': 1, '5': 9, '10': 'patientId'},
    const {'1': 'player_id', '3': 2, '4': 1, '5': 9, '10': 'playerId'},
    const {'1': 'status', '3': 3, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'updated', '3': 4, '4': 1, '5': 8, '10': 'updated'},
    const {'1': 'patient_critical_alert', '3': 5, '4': 1, '5': 8, '10': 'patientCriticalAlert'},
    const {'1': 'patient_message_chat', '3': 6, '4': 1, '5': 8, '10': 'patientMessageChat'},
  ],
};

/// Descriptor for `UpdateNotificationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateNotificationResponseDescriptor = $convert.base64Decode('ChpVcGRhdGVOb3RpZmljYXRpb25SZXNwb25zZRIdCgpwYXRpZW50X2lkGAEgASgJUglwYXRpZW50SWQSGwoJcGxheWVyX2lkGAIgASgJUghwbGF5ZXJJZBIWCgZzdGF0dXMYAyABKAlSBnN0YXR1cxIYCgd1cGRhdGVkGAQgASgIUgd1cGRhdGVkEjQKFnBhdGllbnRfY3JpdGljYWxfYWxlcnQYBSABKAhSFHBhdGllbnRDcml0aWNhbEFsZXJ0EjAKFHBhdGllbnRfbWVzc2FnZV9jaGF0GAYgASgIUhJwYXRpZW50TWVzc2FnZUNoYXQ=');
@$core.Deprecated('Use currentNotificationStatusDescriptor instead')
const CurrentNotificationStatus$json = const {
  '1': 'CurrentNotificationStatus',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'player_id', '3': 3, '4': 1, '5': 9, '10': 'playerId'},
    const {'1': 'patient_id', '3': 4, '4': 1, '5': 9, '10': 'patientId'},
    const {'1': 'clinic_id', '3': 5, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `CurrentNotificationStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List currentNotificationStatusDescriptor = $convert.base64Decode('ChlDdXJyZW50Tm90aWZpY2F0aW9uU3RhdHVzEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIdCgp1c2VyX3Rva2VuGAIgASgJUgl1c2VyVG9rZW4SGwoJcGxheWVyX2lkGAMgASgJUghwbGF5ZXJJZBIdCgpwYXRpZW50X2lkGAQgASgJUglwYXRpZW50SWQSGwoJY2xpbmljX2lkGAUgASgJUghjbGluaWNJZA==');
@$core.Deprecated('Use currentNotificationStatusResponseDescriptor instead')
const CurrentNotificationStatusResponse$json = const {
  '1': 'CurrentNotificationStatusResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'subscribed', '3': 2, '4': 1, '5': 8, '10': 'subscribed'},
    const {'1': 'patient_critical_alert', '3': 3, '4': 1, '5': 8, '10': 'patientCriticalAlert'},
    const {'1': 'patient_message_chat', '3': 4, '4': 1, '5': 8, '10': 'patientMessageChat'},
  ],
};

/// Descriptor for `CurrentNotificationStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List currentNotificationStatusResponseDescriptor = $convert.base64Decode('CiFDdXJyZW50Tm90aWZpY2F0aW9uU3RhdHVzUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSHgoKc3Vic2NyaWJlZBgCIAEoCFIKc3Vic2NyaWJlZBI0ChZwYXRpZW50X2NyaXRpY2FsX2FsZXJ0GAMgASgIUhRwYXRpZW50Q3JpdGljYWxBbGVydBIwChRwYXRpZW50X21lc3NhZ2VfY2hhdBgEIAEoCFIScGF0aWVudE1lc3NhZ2VDaGF0');
@$core.Deprecated('Use doctorInfoDescriptor instead')
const DoctorInfo$json = const {
  '1': 'DoctorInfo',
  '2': const [
    const {'1': 'user_token', '3': 1, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'follo_up_id', '3': 3, '4': 1, '5': 5, '10': 'folloUpId'},
    const {'1': 'clinic_id', '3': 4, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `DoctorInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doctorInfoDescriptor = $convert.base64Decode('CgpEb2N0b3JJbmZvEh0KCnVzZXJfdG9rZW4YASABKAlSCXVzZXJUb2tlbhIXCgd1c2VyX2lkGAIgASgJUgZ1c2VySWQSHgoLZm9sbG9fdXBfaWQYAyABKAVSCWZvbGxvVXBJZBIbCgljbGluaWNfaWQYBCABKAlSCGNsaW5pY0lk');
@$core.Deprecated('Use caregiverDescriptor instead')
const Caregiver$json = const {
  '1': 'Caregiver',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'user_type', '3': 3, '4': 1, '5': 9, '10': 'userType'},
    const {'1': 'role', '3': 4, '4': 1, '5': 9, '10': 'role'},
  ],
};

/// Descriptor for `Caregiver`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List caregiverDescriptor = $convert.base64Decode('CglDYXJlZ2l2ZXISFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhIKBG5hbWUYAiABKAlSBG5hbWUSGwoJdXNlcl90eXBlGAMgASgJUgh1c2VyVHlwZRISCgRyb2xlGAQgASgJUgRyb2xl');
@$core.Deprecated('Use caregiverSpecialityDescriptor instead')
const CaregiverSpeciality$json = const {
  '1': 'CaregiverSpeciality',
  '2': const [
    const {'1': 'speciality_id', '3': 1, '4': 1, '5': 9, '10': 'specialityId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `CaregiverSpeciality`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List caregiverSpecialityDescriptor = $convert.base64Decode('ChNDYXJlZ2l2ZXJTcGVjaWFsaXR5EiMKDXNwZWNpYWxpdHlfaWQYASABKAlSDHNwZWNpYWxpdHlJZBISCgRuYW1lGAIgASgJUgRuYW1l');
@$core.Deprecated('Use languageDescriptor instead')
const Language$json = const {
  '1': 'Language',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'language_id', '3': 2, '4': 1, '5': 9, '10': 'languageId'},
  ],
};

/// Descriptor for `Language`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List languageDescriptor = $convert.base64Decode('CghMYW5ndWFnZRISCgRuYW1lGAEgASgJUgRuYW1lEh8KC2xhbmd1YWdlX2lkGAIgASgJUgpsYW5ndWFnZUlk');
@$core.Deprecated('Use doctorInfoResponseDescriptor instead')
const DoctorInfoResponse$json = const {
  '1': 'DoctorInfoResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'mobile_number', '3': 3, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'profile_picture', '3': 5, '4': 1, '5': 11, '6': '.dashboard.Media', '10': 'profilePicture'},
    const {'1': 'license_number', '3': 6, '4': 1, '5': 9, '10': 'licenseNumber'},
    const {'1': 'experience', '3': 7, '4': 1, '5': 5, '10': 'experience'},
    const {'1': 'specialities', '3': 8, '4': 3, '5': 11, '6': '.dashboard.CaregiverSpeciality', '10': 'specialities'},
    const {'1': 'user_id', '3': 9, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'about', '3': 10, '4': 1, '5': 9, '10': 'about'},
    const {'1': 'qualifications', '3': 11, '4': 1, '5': 9, '10': 'qualifications'},
    const {'1': 'languages', '3': 12, '4': 3, '5': 11, '6': '.dashboard.Language', '10': 'languages'},
    const {'1': 'address', '3': 13, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `DoctorInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doctorInfoResponseDescriptor = $convert.base64Decode('ChJEb2N0b3JJbmZvUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSFAoFZW1haWwYAiABKAlSBWVtYWlsEiMKDW1vYmlsZV9udW1iZXIYAyABKAlSDG1vYmlsZU51bWJlchISCgRuYW1lGAQgASgJUgRuYW1lEjkKD3Byb2ZpbGVfcGljdHVyZRgFIAEoCzIQLmRhc2hib2FyZC5NZWRpYVIOcHJvZmlsZVBpY3R1cmUSJQoObGljZW5zZV9udW1iZXIYBiABKAlSDWxpY2Vuc2VOdW1iZXISHgoKZXhwZXJpZW5jZRgHIAEoBVIKZXhwZXJpZW5jZRJCCgxzcGVjaWFsaXRpZXMYCCADKAsyHi5kYXNoYm9hcmQuQ2FyZWdpdmVyU3BlY2lhbGl0eVIMc3BlY2lhbGl0aWVzEhcKB3VzZXJfaWQYCSABKAlSBnVzZXJJZBIUCgVhYm91dBgKIAEoCVIFYWJvdXQSJgoOcXVhbGlmaWNhdGlvbnMYCyABKAlSDnF1YWxpZmljYXRpb25zEjEKCWxhbmd1YWdlcxgMIAMoCzITLmRhc2hib2FyZC5MYW5ndWFnZVIJbGFuZ3VhZ2VzEhgKB2FkZHJlc3MYDSABKAlSB2FkZHJlc3M=');
@$core.Deprecated('Use clinicInfoDescriptor instead')
const ClinicInfo$json = const {
  '1': 'ClinicInfo',
  '2': const [
    const {'1': 'user_token', '3': 1, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'clinic_id', '3': 3, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `ClinicInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clinicInfoDescriptor = $convert.base64Decode('CgpDbGluaWNJbmZvEh0KCnVzZXJfdG9rZW4YASABKAlSCXVzZXJUb2tlbhIXCgd1c2VyX2lkGAIgASgJUgZ1c2VySWQSGwoJY2xpbmljX2lkGAMgASgJUghjbGluaWNJZA==');
@$core.Deprecated('Use departmentDescriptor instead')
const Department$json = const {
  '1': 'Department',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'department_id', '3': 2, '4': 1, '5': 9, '10': 'departmentId'},
  ],
};

/// Descriptor for `Department`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List departmentDescriptor = $convert.base64Decode('CgpEZXBhcnRtZW50EhIKBG5hbWUYASABKAlSBG5hbWUSIwoNZGVwYXJ0bWVudF9pZBgCIAEoCVIMZGVwYXJ0bWVudElk');
@$core.Deprecated('Use clinicInfoResponseDescriptor instead')
const ClinicInfoResponse$json = const {
  '1': 'ClinicInfoResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'clinic_id', '3': 2, '4': 1, '5': 9, '10': 'clinicId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'photo', '3': 4, '4': 1, '5': 11, '6': '.dashboard.Media', '10': 'photo'},
    const {'1': 'address', '3': 5, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'mobile_number', '3': 6, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'about', '3': 7, '4': 1, '5': 9, '10': 'about'},
    const {'1': 'departments', '3': 8, '4': 3, '5': 11, '6': '.dashboard.Department', '10': 'departments'},
  ],
};

/// Descriptor for `ClinicInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clinicInfoResponseDescriptor = $convert.base64Decode('ChJDbGluaWNJbmZvUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSGwoJY2xpbmljX2lkGAIgASgJUghjbGluaWNJZBISCgRuYW1lGAMgASgJUgRuYW1lEiYKBXBob3RvGAQgASgLMhAuZGFzaGJvYXJkLk1lZGlhUgVwaG90bxIYCgdhZGRyZXNzGAUgASgJUgdhZGRyZXNzEiMKDW1vYmlsZV9udW1iZXIYBiABKAlSDG1vYmlsZU51bWJlchIUCgVhYm91dBgHIAEoCVIFYWJvdXQSNwoLZGVwYXJ0bWVudHMYCCADKAsyFS5kYXNoYm9hcmQuRGVwYXJ0bWVudFILZGVwYXJ0bWVudHM=');
@$core.Deprecated('Use conversationMessageDescriptor instead')
const ConversationMessage$json = const {
  '1': 'ConversationMessage',
  '2': const [
    const {'1': 'media_present', '3': 1, '4': 1, '5': 8, '10': 'mediaPresent'},
    const {'1': 'platform', '3': 2, '4': 1, '5': 9, '10': 'platform'},
    const {'1': 'text', '3': 3, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'media', '3': 4, '4': 3, '5': 11, '6': '.dashboard.Media', '10': 'media'},
    const {'1': 'traffic_type', '3': 5, '4': 1, '5': 9, '10': 'trafficType'},
    const {'1': 'timestamp', '3': 6, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `ConversationMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conversationMessageDescriptor = $convert.base64Decode('ChNDb252ZXJzYXRpb25NZXNzYWdlEiMKDW1lZGlhX3ByZXNlbnQYASABKAhSDG1lZGlhUHJlc2VudBIaCghwbGF0Zm9ybRgCIAEoCVIIcGxhdGZvcm0SEgoEdGV4dBgDIAEoCVIEdGV4dBImCgVtZWRpYRgEIAMoCzIQLmRhc2hib2FyZC5NZWRpYVIFbWVkaWESIQoMdHJhZmZpY190eXBlGAUgASgJUgt0cmFmZmljVHlwZRIcCgl0aW1lc3RhbXAYBiABKANSCXRpbWVzdGFtcA==');
@$core.Deprecated('Use conversationDescriptor instead')
const Conversation$json = const {
  '1': 'Conversation',
  '2': const [
    const {'1': 'conversation_id', '3': 1, '4': 1, '5': 9, '10': 'conversationId'},
    const {'1': 'follo_up_start_timestamp', '3': 2, '4': 1, '5': 3, '10': 'folloUpStartTimestamp'},
    const {'1': 'latest_activity_timestamp', '3': 3, '4': 1, '5': 3, '10': 'latestActivityTimestamp'},
    const {'1': 'follo_up_status', '3': 4, '4': 1, '5': 9, '10': 'folloUpStatus'},
    const {'1': 'active_alert', '3': 5, '4': 1, '5': 9, '10': 'activeAlert'},
    const {'1': 'attended_by_caregiver_name', '3': 6, '4': 1, '5': 9, '10': 'attendedByCaregiverName'},
    const {'1': 'patient_attachments', '3': 7, '4': 3, '5': 11, '6': '.dashboard.Media', '10': 'patientAttachments'},
    const {'1': 'conversation_messages', '3': 8, '4': 3, '5': 11, '6': '.dashboard.ConversationMessage', '10': 'conversationMessages'},
    const {'1': 'last_retry_timestamp', '3': 9, '4': 1, '5': 3, '10': 'lastRetryTimestamp'},
    const {'1': 'retry_attempts', '3': 10, '4': 1, '5': 5, '10': 'retryAttempts'},
  ],
};

/// Descriptor for `Conversation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conversationDescriptor = $convert.base64Decode('CgxDb252ZXJzYXRpb24SJwoPY29udmVyc2F0aW9uX2lkGAEgASgJUg5jb252ZXJzYXRpb25JZBI3Chhmb2xsb191cF9zdGFydF90aW1lc3RhbXAYAiABKANSFWZvbGxvVXBTdGFydFRpbWVzdGFtcBI6ChlsYXRlc3RfYWN0aXZpdHlfdGltZXN0YW1wGAMgASgDUhdsYXRlc3RBY3Rpdml0eVRpbWVzdGFtcBImCg9mb2xsb191cF9zdGF0dXMYBCABKAlSDWZvbGxvVXBTdGF0dXMSIQoMYWN0aXZlX2FsZXJ0GAUgASgJUgthY3RpdmVBbGVydBI7ChphdHRlbmRlZF9ieV9jYXJlZ2l2ZXJfbmFtZRgGIAEoCVIXYXR0ZW5kZWRCeUNhcmVnaXZlck5hbWUSQQoTcGF0aWVudF9hdHRhY2htZW50cxgHIAMoCzIQLmRhc2hib2FyZC5NZWRpYVIScGF0aWVudEF0dGFjaG1lbnRzElMKFWNvbnZlcnNhdGlvbl9tZXNzYWdlcxgIIAMoCzIeLmRhc2hib2FyZC5Db252ZXJzYXRpb25NZXNzYWdlUhRjb252ZXJzYXRpb25NZXNzYWdlcxIwChRsYXN0X3JldHJ5X3RpbWVzdGFtcBgJIAEoA1ISbGFzdFJldHJ5VGltZXN0YW1wEiUKDnJldHJ5X2F0dGVtcHRzGAogASgFUg1yZXRyeUF0dGVtcHRz');
@$core.Deprecated('Use folloUpDescriptor instead')
const FolloUp$json = const {
  '1': 'FolloUp',
  '2': const [
    const {'1': 'follo_up_id', '3': 1, '4': 1, '5': 5, '10': 'folloUpId'},
    const {'1': 'disease_id', '3': 2, '4': 1, '5': 9, '10': 'diseaseId'},
    const {'1': 'disease_name', '3': 3, '4': 1, '5': 9, '10': 'diseaseName'},
    const {'1': 'follo_up_registration_timestamp', '3': 5, '4': 1, '5': 3, '10': 'folloUpRegistrationTimestamp'},
    const {'1': 'caregiver_name', '3': 6, '4': 1, '5': 9, '10': 'caregiverName'},
    const {'1': 'caregiver_online', '3': 7, '4': 1, '5': 8, '10': 'caregiverOnline'},
    const {'1': 'conversations', '3': 8, '4': 3, '5': 11, '6': '.dashboard.Conversation', '10': 'conversations'},
  ],
};

/// Descriptor for `FolloUp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List folloUpDescriptor = $convert.base64Decode('CgdGb2xsb1VwEh4KC2ZvbGxvX3VwX2lkGAEgASgFUglmb2xsb1VwSWQSHQoKZGlzZWFzZV9pZBgCIAEoCVIJZGlzZWFzZUlkEiEKDGRpc2Vhc2VfbmFtZRgDIAEoCVILZGlzZWFzZU5hbWUSRQofZm9sbG9fdXBfcmVnaXN0cmF0aW9uX3RpbWVzdGFtcBgFIAEoA1IcZm9sbG9VcFJlZ2lzdHJhdGlvblRpbWVzdGFtcBIlCg5jYXJlZ2l2ZXJfbmFtZRgGIAEoCVINY2FyZWdpdmVyTmFtZRIpChBjYXJlZ2l2ZXJfb25saW5lGAcgASgIUg9jYXJlZ2l2ZXJPbmxpbmUSPQoNY29udmVyc2F0aW9ucxgIIAMoCzIXLmRhc2hib2FyZC5Db252ZXJzYXRpb25SDWNvbnZlcnNhdGlvbnM=');
@$core.Deprecated('Use newFolloDescriptor instead')
const NewFollo$json = const {
  '1': 'NewFollo',
  '2': const [
    const {'1': 'follo_up_id', '3': 1, '4': 1, '5': 5, '10': 'folloUpId'},
    const {'1': 'conversation_id', '3': 2, '4': 1, '5': 9, '10': 'conversationId'},
    const {'1': 'disease_id', '3': 3, '4': 1, '5': 9, '10': 'diseaseId'},
    const {'1': 'disease_name', '3': 4, '4': 1, '5': 9, '10': 'diseaseName'},
    const {'1': 'follo_up_registration_timestamp', '3': 5, '4': 1, '5': 3, '10': 'folloUpRegistrationTimestamp'},
    const {'1': 'caregiver_name', '3': 6, '4': 1, '5': 9, '10': 'caregiverName'},
    const {'1': 'follo_up_start_timestamp', '3': 7, '4': 1, '5': 3, '10': 'folloUpStartTimestamp'},
    const {'1': 'follo_up_status', '3': 8, '4': 1, '5': 9, '10': 'folloUpStatus'},
  ],
};

/// Descriptor for `NewFollo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newFolloDescriptor = $convert.base64Decode('CghOZXdGb2xsbxIeCgtmb2xsb191cF9pZBgBIAEoBVIJZm9sbG9VcElkEicKD2NvbnZlcnNhdGlvbl9pZBgCIAEoCVIOY29udmVyc2F0aW9uSWQSHQoKZGlzZWFzZV9pZBgDIAEoCVIJZGlzZWFzZUlkEiEKDGRpc2Vhc2VfbmFtZRgEIAEoCVILZGlzZWFzZU5hbWUSRQofZm9sbG9fdXBfcmVnaXN0cmF0aW9uX3RpbWVzdGFtcBgFIAEoA1IcZm9sbG9VcFJlZ2lzdHJhdGlvblRpbWVzdGFtcBIlCg5jYXJlZ2l2ZXJfbmFtZRgGIAEoCVINY2FyZWdpdmVyTmFtZRI3Chhmb2xsb191cF9zdGFydF90aW1lc3RhbXAYByABKANSFWZvbGxvVXBTdGFydFRpbWVzdGFtcBImCg9mb2xsb191cF9zdGF0dXMYCCABKAlSDWZvbGxvVXBTdGF0dXM=');
@$core.Deprecated('Use folloUpListDescriptor instead')
const FolloUpList$json = const {
  '1': 'FolloUpList',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'clinic_id', '3': 3, '4': 1, '5': 9, '10': 'clinicId'},
    const {'1': 'filter_by_caregiver_id', '3': 4, '4': 1, '5': 8, '10': 'filterByCaregiverId'},
    const {'1': 'caregiver_id', '3': 5, '4': 1, '5': 9, '10': 'caregiverId'},
    const {'1': 'start_timestamp', '3': 6, '4': 1, '5': 3, '10': 'startTimestamp'},
    const {'1': 'end_timestamp', '3': 7, '4': 1, '5': 3, '10': 'endTimestamp'},
    const {'1': 'filter_by_timestamp', '3': 8, '4': 1, '5': 8, '10': 'filterByTimestamp'},
    const {'1': 'filter_by_patient_profile_id', '3': 9, '4': 1, '5': 8, '10': 'filterByPatientProfileId'},
    const {'1': 'patient_profile_id', '3': 10, '4': 1, '5': 9, '10': 'patientProfileId'},
  ],
};

/// Descriptor for `FolloUpList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List folloUpListDescriptor = $convert.base64Decode('CgtGb2xsb1VwTGlzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSHQoKdXNlcl90b2tlbhgCIAEoCVIJdXNlclRva2VuEhsKCWNsaW5pY19pZBgDIAEoCVIIY2xpbmljSWQSMwoWZmlsdGVyX2J5X2NhcmVnaXZlcl9pZBgEIAEoCFITZmlsdGVyQnlDYXJlZ2l2ZXJJZBIhCgxjYXJlZ2l2ZXJfaWQYBSABKAlSC2NhcmVnaXZlcklkEicKD3N0YXJ0X3RpbWVzdGFtcBgGIAEoA1IOc3RhcnRUaW1lc3RhbXASIwoNZW5kX3RpbWVzdGFtcBgHIAEoA1IMZW5kVGltZXN0YW1wEi4KE2ZpbHRlcl9ieV90aW1lc3RhbXAYCCABKAhSEWZpbHRlckJ5VGltZXN0YW1wEj4KHGZpbHRlcl9ieV9wYXRpZW50X3Byb2ZpbGVfaWQYCSABKAhSGGZpbHRlckJ5UGF0aWVudFByb2ZpbGVJZBIsChJwYXRpZW50X3Byb2ZpbGVfaWQYCiABKAlSEHBhdGllbnRQcm9maWxlSWQ=');
@$core.Deprecated('Use folloDataDescriptor instead')
const FolloData$json = const {
  '1': 'FolloData',
  '2': const [
    const {'1': 'follo_up_status', '3': 1, '4': 1, '5': 9, '10': 'folloUpStatus'},
    const {'1': 'follo_ups_list', '3': 2, '4': 3, '5': 11, '6': '.dashboard.NewFollo', '10': 'folloUpsList'},
  ],
};

/// Descriptor for `FolloData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List folloDataDescriptor = $convert.base64Decode('CglGb2xsb0RhdGESJgoPZm9sbG9fdXBfc3RhdHVzGAEgASgJUg1mb2xsb1VwU3RhdHVzEjkKDmZvbGxvX3Vwc19saXN0GAIgAygLMhMuZGFzaGJvYXJkLk5ld0ZvbGxvUgxmb2xsb1Vwc0xpc3Q=');
@$core.Deprecated('Use folloUpListResponseDescriptor instead')
const FolloUpListResponse$json = const {
  '1': 'FolloUpListResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'follo_list', '3': 2, '4': 3, '5': 11, '6': '.dashboard.FolloData', '10': 'folloList'},
  ],
};

/// Descriptor for `FolloUpListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List folloUpListResponseDescriptor = $convert.base64Decode('ChNGb2xsb1VwTGlzdFJlc3BvbnNlEhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVzEjMKCmZvbGxvX2xpc3QYAiADKAsyFC5kYXNoYm9hcmQuRm9sbG9EYXRhUglmb2xsb0xpc3Q=');
@$core.Deprecated('Use appStatusDescriptor instead')
const AppStatus$json = const {
  '1': 'AppStatus',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'app_in_background', '3': 3, '4': 1, '5': 8, '10': 'appInBackground'},
    const {'1': 'clinic_id', '3': 4, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `AppStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appStatusDescriptor = $convert.base64Decode('CglBcHBTdGF0dXMSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEh0KCnVzZXJfdG9rZW4YAiABKAlSCXVzZXJUb2tlbhIqChFhcHBfaW5fYmFja2dyb3VuZBgDIAEoCFIPYXBwSW5CYWNrZ3JvdW5kEhsKCWNsaW5pY19pZBgEIAEoCVIIY2xpbmljSWQ=');
@$core.Deprecated('Use appStatusResponseDescriptor instead')
const AppStatusResponse$json = const {
  '1': 'AppStatusResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `AppStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appStatusResponseDescriptor = $convert.base64Decode('ChFBcHBTdGF0dXNSZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cw==');
@$core.Deprecated('Use appUninstallDescriptor instead')
const AppUninstall$json = const {
  '1': 'AppUninstall',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'app_uninstalled', '3': 3, '4': 1, '5': 8, '10': 'appUninstalled'},
    const {'1': 'clinic_id', '3': 4, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `AppUninstall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appUninstallDescriptor = $convert.base64Decode('CgxBcHBVbmluc3RhbGwSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEh0KCnVzZXJfdG9rZW4YAiABKAlSCXVzZXJUb2tlbhInCg9hcHBfdW5pbnN0YWxsZWQYAyABKAhSDmFwcFVuaW5zdGFsbGVkEhsKCWNsaW5pY19pZBgEIAEoCVIIY2xpbmljSWQ=');
@$core.Deprecated('Use appUninstallResponseDescriptor instead')
const AppUninstallResponse$json = const {
  '1': 'AppUninstallResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `AppUninstallResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appUninstallResponseDescriptor = $convert.base64Decode('ChRBcHBVbmluc3RhbGxSZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cw==');
@$core.Deprecated('Use folloUpStatsDescriptor instead')
const FolloUpStats$json = const {
  '1': 'FolloUpStats',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'start_timestamp', '3': 3, '4': 1, '5': 3, '10': 'startTimestamp'},
    const {'1': 'end_timestamp', '3': 4, '4': 1, '5': 3, '10': 'endTimestamp'},
    const {'1': 'clinic_id', '3': 5, '4': 1, '5': 9, '10': 'clinicId'},
    const {'1': 'filter_by_timestamp', '3': 6, '4': 1, '5': 8, '10': 'filterByTimestamp'},
    const {'1': 'filter_by_patient_profile_id', '3': 7, '4': 1, '5': 8, '10': 'filterByPatientProfileId'},
    const {'1': 'patient_profile_id', '3': 8, '4': 1, '5': 9, '10': 'patientProfileId'},
  ],
};

/// Descriptor for `FolloUpStats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List folloUpStatsDescriptor = $convert.base64Decode('CgxGb2xsb1VwU3RhdHMSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEh0KCnVzZXJfdG9rZW4YAiABKAlSCXVzZXJUb2tlbhInCg9zdGFydF90aW1lc3RhbXAYAyABKANSDnN0YXJ0VGltZXN0YW1wEiMKDWVuZF90aW1lc3RhbXAYBCABKANSDGVuZFRpbWVzdGFtcBIbCgljbGluaWNfaWQYBSABKAlSCGNsaW5pY0lkEi4KE2ZpbHRlcl9ieV90aW1lc3RhbXAYBiABKAhSEWZpbHRlckJ5VGltZXN0YW1wEj4KHGZpbHRlcl9ieV9wYXRpZW50X3Byb2ZpbGVfaWQYByABKAhSGGZpbHRlckJ5UGF0aWVudFByb2ZpbGVJZBIsChJwYXRpZW50X3Byb2ZpbGVfaWQYCCABKAlSEHBhdGllbnRQcm9maWxlSWQ=');
@$core.Deprecated('Use statusCountDescriptor instead')
const StatusCount$json = const {
  '1': 'StatusCount',
  '2': const [
    const {'1': '_id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    const {'1': 'total', '3': 2, '4': 1, '5': 9, '10': 'total'},
  ],
};

/// Descriptor for `StatusCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statusCountDescriptor = $convert.base64Decode('CgtTdGF0dXNDb3VudBIPCgNfaWQYASABKAlSAklkEhQKBXRvdGFsGAIgASgJUgV0b3RhbA==');
@$core.Deprecated('Use drInfoDescriptor instead')
const DrInfo$json = const {
  '1': 'DrInfo',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'profile_picture', '3': 2, '4': 1, '5': 11, '6': '.dashboard.Media', '10': 'profilePicture'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'qualifications', '3': 4, '4': 1, '5': 9, '10': 'qualifications'},
    const {'1': 'mobile_number', '3': 5, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'license_number', '3': 6, '4': 1, '5': 9, '10': 'licenseNumber'},
    const {'1': 'specialities', '3': 7, '4': 3, '5': 11, '6': '.dashboard.CaregiverSpeciality', '10': 'specialities'},
    const {'1': 'experience', '3': 8, '4': 1, '5': 5, '10': 'experience'},
    const {'1': 'email', '3': 9, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'about', '3': 10, '4': 1, '5': 9, '10': 'about'},
    const {'1': 'languages', '3': 11, '4': 3, '5': 11, '6': '.dashboard.Language', '10': 'languages'},
    const {'1': 'address', '3': 12, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `DrInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List drInfoDescriptor = $convert.base64Decode('CgZEckluZm8SFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEjkKD3Byb2ZpbGVfcGljdHVyZRgCIAEoCzIQLmRhc2hib2FyZC5NZWRpYVIOcHJvZmlsZVBpY3R1cmUSEgoEbmFtZRgDIAEoCVIEbmFtZRImCg5xdWFsaWZpY2F0aW9ucxgEIAEoCVIOcXVhbGlmaWNhdGlvbnMSIwoNbW9iaWxlX251bWJlchgFIAEoCVIMbW9iaWxlTnVtYmVyEiUKDmxpY2Vuc2VfbnVtYmVyGAYgASgJUg1saWNlbnNlTnVtYmVyEkIKDHNwZWNpYWxpdGllcxgHIAMoCzIeLmRhc2hib2FyZC5DYXJlZ2l2ZXJTcGVjaWFsaXR5UgxzcGVjaWFsaXRpZXMSHgoKZXhwZXJpZW5jZRgIIAEoBVIKZXhwZXJpZW5jZRIUCgVlbWFpbBgJIAEoCVIFZW1haWwSFAoFYWJvdXQYCiABKAlSBWFib3V0EjEKCWxhbmd1YWdlcxgLIAMoCzITLmRhc2hib2FyZC5MYW5ndWFnZVIJbGFuZ3VhZ2VzEhgKB2FkZHJlc3MYDCABKAlSB2FkZHJlc3M=');
@$core.Deprecated('Use statsByCaregiverDescriptor instead')
const StatsByCaregiver$json = const {
  '1': 'StatsByCaregiver',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'caregiver_id', '3': 2, '4': 1, '5': 9, '10': 'caregiverId'},
    const {'1': 'data', '3': 3, '4': 3, '5': 11, '6': '.dashboard.StatusCount', '10': 'data'},
    const {'1': 'doctor_info', '3': 4, '4': 1, '5': 11, '6': '.dashboard.DrInfo', '10': 'doctorInfo'},
  ],
};

/// Descriptor for `StatsByCaregiver`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statsByCaregiverDescriptor = $convert.base64Decode('ChBTdGF0c0J5Q2FyZWdpdmVyEhIKBG5hbWUYASABKAlSBG5hbWUSIQoMY2FyZWdpdmVyX2lkGAIgASgJUgtjYXJlZ2l2ZXJJZBIqCgRkYXRhGAMgAygLMhYuZGFzaGJvYXJkLlN0YXR1c0NvdW50UgRkYXRhEjIKC2RvY3Rvcl9pbmZvGAQgASgLMhEuZGFzaGJvYXJkLkRySW5mb1IKZG9jdG9ySW5mbw==');
@$core.Deprecated('Use folloUpStatsResponseDescriptor instead')
const FolloUpStatsResponse$json = const {
  '1': 'FolloUpStatsResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'stats_by_caregiver', '3': 2, '4': 3, '5': 11, '6': '.dashboard.StatsByCaregiver', '10': 'statsByCaregiver'},
    const {'1': 'patient_profile_id', '3': 3, '4': 1, '5': 9, '10': 'patientProfileId'},
  ],
};

/// Descriptor for `FolloUpStatsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List folloUpStatsResponseDescriptor = $convert.base64Decode('ChRGb2xsb1VwU3RhdHNSZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxJJChJzdGF0c19ieV9jYXJlZ2l2ZXIYAiADKAsyGy5kYXNoYm9hcmQuU3RhdHNCeUNhcmVnaXZlclIQc3RhdHNCeUNhcmVnaXZlchIsChJwYXRpZW50X3Byb2ZpbGVfaWQYAyABKAlSEHBhdGllbnRQcm9maWxlSWQ=');
@$core.Deprecated('Use incomingPatientappMessageDescriptor instead')
const IncomingPatientappMessage$json = const {
  '1': 'IncomingPatientappMessage',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'mobile_number', '3': 3, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'response_text', '3': 4, '4': 1, '5': 9, '10': 'responseText'},
    const {'1': 'message_id', '3': 5, '4': 1, '5': 9, '10': 'messageId'},
    const {'1': 'follo_up_id', '3': 6, '4': 1, '5': 9, '10': 'folloUpId'},
    const {'1': 'media_present', '3': 7, '4': 1, '5': 8, '10': 'mediaPresent'},
    const {'1': 'media', '3': 8, '4': 3, '5': 11, '6': '.dashboard.Media', '10': 'media'},
    const {'1': 'traffic_type', '3': 9, '4': 1, '5': 9, '10': 'trafficType'},
    const {'1': 'timestamp', '3': 10, '4': 1, '5': 3, '10': 'timestamp'},
    const {'1': 'platform', '3': 11, '4': 1, '5': 9, '10': 'platform'},
    const {'1': 'provider', '3': 12, '4': 1, '5': 9, '10': 'provider'},
    const {'1': 'message_status', '3': 13, '4': 1, '5': 9, '10': 'messageStatus'},
    const {'1': 'next_node_id', '3': 14, '4': 1, '5': 9, '10': 'nextNodeId'},
    const {'1': 'response_option', '3': 15, '4': 1, '5': 11, '6': '.dashboard.ResponseOptions', '10': 'responseOption'},
    const {'1': 'current_node_id', '3': 16, '4': 1, '5': 9, '10': 'currentNodeId'},
  ],
};

/// Descriptor for `IncomingPatientappMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List incomingPatientappMessageDescriptor = $convert.base64Decode('ChlJbmNvbWluZ1BhdGllbnRhcHBNZXNzYWdlEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIdCgp1c2VyX3Rva2VuGAIgASgJUgl1c2VyVG9rZW4SIwoNbW9iaWxlX251bWJlchgDIAEoCVIMbW9iaWxlTnVtYmVyEiMKDXJlc3BvbnNlX3RleHQYBCABKAlSDHJlc3BvbnNlVGV4dBIdCgptZXNzYWdlX2lkGAUgASgJUgltZXNzYWdlSWQSHgoLZm9sbG9fdXBfaWQYBiABKAlSCWZvbGxvVXBJZBIjCg1tZWRpYV9wcmVzZW50GAcgASgIUgxtZWRpYVByZXNlbnQSJgoFbWVkaWEYCCADKAsyEC5kYXNoYm9hcmQuTWVkaWFSBW1lZGlhEiEKDHRyYWZmaWNfdHlwZRgJIAEoCVILdHJhZmZpY1R5cGUSHAoJdGltZXN0YW1wGAogASgDUgl0aW1lc3RhbXASGgoIcGxhdGZvcm0YCyABKAlSCHBsYXRmb3JtEhoKCHByb3ZpZGVyGAwgASgJUghwcm92aWRlchIlCg5tZXNzYWdlX3N0YXR1cxgNIAEoCVINbWVzc2FnZVN0YXR1cxIgCgxuZXh0X25vZGVfaWQYDiABKAlSCm5leHROb2RlSWQSQwoPcmVzcG9uc2Vfb3B0aW9uGA8gASgLMhouZGFzaGJvYXJkLlJlc3BvbnNlT3B0aW9uc1IOcmVzcG9uc2VPcHRpb24SJgoPY3VycmVudF9ub2RlX2lkGBAgASgJUg1jdXJyZW50Tm9kZUlk');
@$core.Deprecated('Use incomingPatientappMessageResponseDescriptor instead')
const IncomingPatientappMessageResponse$json = const {
  '1': 'IncomingPatientappMessageResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'processed', '3': 2, '4': 1, '5': 8, '10': 'processed'},
    const {'1': 'next_message_id', '3': 3, '4': 1, '5': 9, '10': 'nextMessageId'},
    const {'1': 'emergency_options', '3': 4, '4': 3, '5': 9, '10': 'emergencyOptions'},
    const {'1': 'emergency_type', '3': 5, '4': 1, '5': 8, '10': 'emergencyType'},
    const {'1': 'call', '3': 6, '4': 1, '5': 8, '10': 'call'},
    const {'1': 'url', '3': 7, '4': 1, '5': 8, '10': 'url'},
    const {'1': 'next_chat_message', '3': 8, '4': 1, '5': 11, '6': '.dashboard.PatientappChatMessage', '10': 'nextChatMessage'},
  ],
};

/// Descriptor for `IncomingPatientappMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List incomingPatientappMessageResponseDescriptor = $convert.base64Decode('CiFJbmNvbWluZ1BhdGllbnRhcHBNZXNzYWdlUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSHAoJcHJvY2Vzc2VkGAIgASgIUglwcm9jZXNzZWQSJgoPbmV4dF9tZXNzYWdlX2lkGAMgASgJUg1uZXh0TWVzc2FnZUlkEisKEWVtZXJnZW5jeV9vcHRpb25zGAQgAygJUhBlbWVyZ2VuY3lPcHRpb25zEiUKDmVtZXJnZW5jeV90eXBlGAUgASgIUg1lbWVyZ2VuY3lUeXBlEhIKBGNhbGwYBiABKAhSBGNhbGwSEAoDdXJsGAcgASgIUgN1cmwSTAoRbmV4dF9jaGF0X21lc3NhZ2UYCCABKAsyIC5kYXNoYm9hcmQuUGF0aWVudGFwcENoYXRNZXNzYWdlUg9uZXh0Q2hhdE1lc3NhZ2U=');
@$core.Deprecated('Use responseOptionsDescriptor instead')
const ResponseOptions$json = const {
  '1': 'ResponseOptions',
  '2': const [
    const {'1': 'next_node', '3': 1, '4': 1, '5': 9, '10': 'nextNode'},
    const {'1': 'alert', '3': 2, '4': 1, '5': 9, '10': 'alert'},
    const {'1': 'summary', '3': 3, '4': 1, '5': 9, '10': 'summary'},
    const {'1': 'is_selected', '3': 4, '4': 1, '5': 8, '10': 'isSelected'},
    const {'1': 'response_text', '3': 5, '4': 1, '5': 9, '10': 'responseText'},
  ],
};

/// Descriptor for `ResponseOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseOptionsDescriptor = $convert.base64Decode('Cg9SZXNwb25zZU9wdGlvbnMSGwoJbmV4dF9ub2RlGAEgASgJUghuZXh0Tm9kZRIUCgVhbGVydBgCIAEoCVIFYWxlcnQSGAoHc3VtbWFyeRgDIAEoCVIHc3VtbWFyeRIfCgtpc19zZWxlY3RlZBgEIAEoCFIKaXNTZWxlY3RlZBIjCg1yZXNwb25zZV90ZXh0GAUgASgJUgxyZXNwb25zZVRleHQ=');
@$core.Deprecated('Use patientappChatMessageDescriptor instead')
const PatientappChatMessage$json = const {
  '1': 'PatientappChatMessage',
  '2': const [
    const {'1': 'mobile_number', '3': 1, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'text', '3': 3, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'media_present', '3': 4, '4': 1, '5': 8, '10': 'mediaPresent'},
    const {'1': 'media', '3': 5, '4': 3, '5': 11, '6': '.dashboard.Media', '10': 'media'},
    const {'1': 'message_id', '3': 6, '4': 1, '5': 9, '10': 'messageId'},
    const {'1': 'response_options', '3': 7, '4': 3, '5': 11, '6': '.dashboard.ResponseOptions', '10': 'responseOptions'},
    const {'1': 'traffic_type', '3': 8, '4': 1, '5': 9, '10': 'trafficType'},
    const {'1': 'timestamp', '3': 9, '4': 1, '5': 3, '10': 'timestamp'},
    const {'1': 'platform', '3': 10, '4': 1, '5': 9, '10': 'platform'},
    const {'1': 'provider', '3': 11, '4': 1, '5': 9, '10': 'provider'},
    const {'1': 'message_status', '3': 12, '4': 1, '5': 9, '10': 'messageStatus'},
    const {'1': 'next_node_id', '3': 13, '4': 1, '5': 9, '10': 'nextNodeId'},
    const {'1': 'next_node_ids', '3': 14, '4': 3, '5': 9, '10': 'nextNodeIds'},
    const {'1': 'response_type', '3': 15, '4': 1, '5': 9, '10': 'responseType'},
    const {'1': 'current_node_id', '3': 16, '4': 1, '5': 9, '10': 'currentNodeId'},
  ],
};

/// Descriptor for `PatientappChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patientappChatMessageDescriptor = $convert.base64Decode('ChVQYXRpZW50YXBwQ2hhdE1lc3NhZ2USIwoNbW9iaWxlX251bWJlchgBIAEoCVIMbW9iaWxlTnVtYmVyEhcKB3VzZXJfaWQYAiABKAlSBnVzZXJJZBISCgR0ZXh0GAMgASgJUgR0ZXh0EiMKDW1lZGlhX3ByZXNlbnQYBCABKAhSDG1lZGlhUHJlc2VudBImCgVtZWRpYRgFIAMoCzIQLmRhc2hib2FyZC5NZWRpYVIFbWVkaWESHQoKbWVzc2FnZV9pZBgGIAEoCVIJbWVzc2FnZUlkEkUKEHJlc3BvbnNlX29wdGlvbnMYByADKAsyGi5kYXNoYm9hcmQuUmVzcG9uc2VPcHRpb25zUg9yZXNwb25zZU9wdGlvbnMSIQoMdHJhZmZpY190eXBlGAggASgJUgt0cmFmZmljVHlwZRIcCgl0aW1lc3RhbXAYCSABKANSCXRpbWVzdGFtcBIaCghwbGF0Zm9ybRgKIAEoCVIIcGxhdGZvcm0SGgoIcHJvdmlkZXIYCyABKAlSCHByb3ZpZGVyEiUKDm1lc3NhZ2Vfc3RhdHVzGAwgASgJUg1tZXNzYWdlU3RhdHVzEiAKDG5leHRfbm9kZV9pZBgNIAEoCVIKbmV4dE5vZGVJZBIiCg1uZXh0X25vZGVfaWRzGA4gAygJUgtuZXh0Tm9kZUlkcxIjCg1yZXNwb25zZV90eXBlGA8gASgJUgxyZXNwb25zZVR5cGUSJgoPY3VycmVudF9ub2RlX2lkGBAgASgJUg1jdXJyZW50Tm9kZUlk');
@$core.Deprecated('Use fetchPatientappMessageDescriptor instead')
const FetchPatientappMessage$json = const {
  '1': 'FetchPatientappMessage',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'mobile_number', '3': 3, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'follo_up_id', '3': 4, '4': 1, '5': 9, '10': 'folloUpId'},
    const {'1': 'current_node_id', '3': 5, '4': 1, '5': 9, '10': 'currentNodeId'},
    const {'1': 'message_id', '3': 6, '4': 1, '5': 9, '10': 'messageId'},
    const {'1': 'platform', '3': 7, '4': 1, '5': 9, '10': 'platform'},
    const {'1': 'provider', '3': 8, '4': 1, '5': 9, '10': 'provider'},
    const {'1': 'clinic_id', '3': 9, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `FetchPatientappMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchPatientappMessageDescriptor = $convert.base64Decode('ChZGZXRjaFBhdGllbnRhcHBNZXNzYWdlEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIdCgp1c2VyX3Rva2VuGAIgASgJUgl1c2VyVG9rZW4SIwoNbW9iaWxlX251bWJlchgDIAEoCVIMbW9iaWxlTnVtYmVyEh4KC2ZvbGxvX3VwX2lkGAQgASgJUglmb2xsb1VwSWQSJgoPY3VycmVudF9ub2RlX2lkGAUgASgJUg1jdXJyZW50Tm9kZUlkEh0KCm1lc3NhZ2VfaWQYBiABKAlSCW1lc3NhZ2VJZBIaCghwbGF0Zm9ybRgHIAEoCVIIcGxhdGZvcm0SGgoIcHJvdmlkZXIYCCABKAlSCHByb3ZpZGVyEhsKCWNsaW5pY19pZBgJIAEoCVIIY2xpbmljSWQ=');
@$core.Deprecated('Use fetchPatientappMessageResponseDescriptor instead')
const FetchPatientappMessageResponse$json = const {
  '1': 'FetchPatientappMessageResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'fetched', '3': 2, '4': 1, '5': 8, '10': 'fetched'},
    const {'1': 'fetched_message', '3': 3, '4': 1, '5': 11, '6': '.dashboard.PatientappChatMessage', '10': 'fetchedMessage'},
  ],
};

/// Descriptor for `FetchPatientappMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchPatientappMessageResponseDescriptor = $convert.base64Decode('Ch5GZXRjaFBhdGllbnRhcHBNZXNzYWdlUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSGAoHZmV0Y2hlZBgCIAEoCFIHZmV0Y2hlZBJJCg9mZXRjaGVkX21lc3NhZ2UYAyABKAsyIC5kYXNoYm9hcmQuUGF0aWVudGFwcENoYXRNZXNzYWdlUg5mZXRjaGVkTWVzc2FnZQ==');
@$core.Deprecated('Use fetchPatientappConversationDescriptor instead')
const FetchPatientappConversation$json = const {
  '1': 'FetchPatientappConversation',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'mobile_number', '3': 3, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'follo_up_id', '3': 4, '4': 1, '5': 9, '10': 'folloUpId'},
    const {'1': 'clinic_id', '3': 5, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `FetchPatientappConversation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchPatientappConversationDescriptor = $convert.base64Decode('ChtGZXRjaFBhdGllbnRhcHBDb252ZXJzYXRpb24SFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEh0KCnVzZXJfdG9rZW4YAiABKAlSCXVzZXJUb2tlbhIjCg1tb2JpbGVfbnVtYmVyGAMgASgJUgxtb2JpbGVOdW1iZXISHgoLZm9sbG9fdXBfaWQYBCABKAlSCWZvbGxvVXBJZBIbCgljbGluaWNfaWQYBSABKAlSCGNsaW5pY0lk');
@$core.Deprecated('Use fetchPatientappConversationResponseDescriptor instead')
const FetchPatientappConversationResponse$json = const {
  '1': 'FetchPatientappConversationResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'fetched', '3': 2, '4': 1, '5': 8, '10': 'fetched'},
    const {'1': 'conversation_messages', '3': 3, '4': 3, '5': 11, '6': '.dashboard.PatientappChatMessage', '10': 'conversationMessages'},
  ],
};

/// Descriptor for `FetchPatientappConversationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchPatientappConversationResponseDescriptor = $convert.base64Decode('CiNGZXRjaFBhdGllbnRhcHBDb252ZXJzYXRpb25SZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxIYCgdmZXRjaGVkGAIgASgIUgdmZXRjaGVkElUKFWNvbnZlcnNhdGlvbl9tZXNzYWdlcxgDIAMoCzIgLmRhc2hib2FyZC5QYXRpZW50YXBwQ2hhdE1lc3NhZ2VSFGNvbnZlcnNhdGlvbk1lc3NhZ2Vz');
@$core.Deprecated('Use panicButtonDescriptor instead')
const PanicButton$json = const {
  '1': 'PanicButton',
  '2': const [
    const {'1': 'user_token', '3': 1, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'clinic_id', '3': 3, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `PanicButton`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List panicButtonDescriptor = $convert.base64Decode('CgtQYW5pY0J1dHRvbhIdCgp1c2VyX3Rva2VuGAEgASgJUgl1c2VyVG9rZW4SFwoHdXNlcl9pZBgCIAEoCVIGdXNlcklkEhsKCWNsaW5pY19pZBgDIAEoCVIIY2xpbmljSWQ=');
@$core.Deprecated('Use panicButtonResponseDescriptor instead')
const PanicButtonResponse$json = const {
  '1': 'PanicButtonResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'emergency_contact', '3': 2, '4': 1, '5': 9, '10': 'emergencyContact'},
  ],
};

/// Descriptor for `PanicButtonResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List panicButtonResponseDescriptor = $convert.base64Decode('ChNQYW5pY0J1dHRvblJlc3BvbnNlEhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVzEisKEWVtZXJnZW5jeV9jb250YWN0GAIgASgJUhBlbWVyZ2VuY3lDb250YWN0');
@$core.Deprecated('Use contentDescriptor instead')
const Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'data', '3': 2, '4': 3, '5': 9, '10': 'data'},
  ],
};

/// Descriptor for `Content`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contentDescriptor = $convert.base64Decode('CgdDb250ZW50EhIKBHR5cGUYASABKAlSBHR5cGUSEgoEZGF0YRgCIAMoCVIEZGF0YQ==');
@$core.Deprecated('Use tCandPPDescriptor instead')
const TCandPP$json = const {
  '1': 'TCandPP',
  '2': const [
    const {'1': 'platform', '3': 1, '4': 1, '5': 9, '10': 'platform'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `TCandPP`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tCandPPDescriptor = $convert.base64Decode('CgdUQ2FuZFBQEhoKCHBsYXRmb3JtGAEgASgJUghwbGF0Zm9ybRISCgRuYW1lGAIgASgJUgRuYW1l');
@$core.Deprecated('Use tCandPPResponseDescriptor instead')
const TCandPPResponse$json = const {
  '1': 'TCandPPResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `TCandPPResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tCandPPResponseDescriptor = $convert.base64Decode('Cg9UQ2FuZFBQUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSEgoEbmFtZRgCIAEoCVIEbmFtZRIQCgN1cmwYAyABKAlSA3VybA==');
@$core.Deprecated('Use helpMessageDescriptor instead')
const HelpMessage$json = const {
  '1': 'HelpMessage',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'platform_name', '3': 3, '4': 1, '5': 9, '10': 'platformName'},
    const {'1': 'button_id', '3': 4, '4': 1, '5': 9, '10': 'buttonId'},
    const {'1': 'content_type', '3': 5, '4': 1, '5': 9, '10': 'contentType'},
    const {'1': 'button_name', '3': 6, '4': 1, '5': 9, '10': 'buttonName'},
  ],
};

/// Descriptor for `HelpMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helpMessageDescriptor = $convert.base64Decode('CgtIZWxwTWVzc2FnZRIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSHQoKdXNlcl90b2tlbhgCIAEoCVIJdXNlclRva2VuEiMKDXBsYXRmb3JtX25hbWUYAyABKAlSDHBsYXRmb3JtTmFtZRIbCglidXR0b25faWQYBCABKAlSCGJ1dHRvbklkEiEKDGNvbnRlbnRfdHlwZRgFIAEoCVILY29udGVudFR5cGUSHwoLYnV0dG9uX25hbWUYBiABKAlSCmJ1dHRvbk5hbWU=');
@$core.Deprecated('Use helpMessageReponseDescriptor instead')
const HelpMessageReponse$json = const {
  '1': 'HelpMessageReponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'help_message_fetched', '3': 2, '4': 1, '5': 8, '10': 'helpMessageFetched'},
    const {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `HelpMessageReponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helpMessageReponseDescriptor = $convert.base64Decode('ChJIZWxwTWVzc2FnZVJlcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSMAoUaGVscF9tZXNzYWdlX2ZldGNoZWQYAiABKAhSEmhlbHBNZXNzYWdlRmV0Y2hlZBIYCgdjb250ZW50GAMgASgJUgdjb250ZW50');
@$core.Deprecated('Use emergencyInfoDescriptor instead')
const EmergencyInfo$json = const {
  '1': 'EmergencyInfo',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'caregiver_name', '3': 3, '4': 1, '5': 9, '10': 'caregiverName'},
    const {'1': 'caregiver_id', '3': 4, '4': 1, '5': 9, '10': 'caregiverId'},
    const {'1': 'response_text', '3': 5, '4': 1, '5': 9, '10': 'responseText'},
    const {'1': 'follo_up_id', '3': 6, '4': 1, '5': 9, '10': 'folloUpId'},
    const {'1': 'lattitude', '3': 7, '4': 1, '5': 1, '10': 'lattitude'},
    const {'1': 'logitude', '3': 8, '4': 1, '5': 1, '10': 'logitude'},
    const {'1': 'address', '3': 9, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'data_present', '3': 10, '4': 1, '5': 8, '10': 'dataPresent'},
    const {'1': 'clinic_id', '3': 11, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `EmergencyInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emergencyInfoDescriptor = $convert.base64Decode('Cg1FbWVyZ2VuY3lJbmZvEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIdCgp1c2VyX3Rva2VuGAIgASgJUgl1c2VyVG9rZW4SJQoOY2FyZWdpdmVyX25hbWUYAyABKAlSDWNhcmVnaXZlck5hbWUSIQoMY2FyZWdpdmVyX2lkGAQgASgJUgtjYXJlZ2l2ZXJJZBIjCg1yZXNwb25zZV90ZXh0GAUgASgJUgxyZXNwb25zZVRleHQSHgoLZm9sbG9fdXBfaWQYBiABKAlSCWZvbGxvVXBJZBIcCglsYXR0aXR1ZGUYByABKAFSCWxhdHRpdHVkZRIaCghsb2dpdHVkZRgIIAEoAVIIbG9naXR1ZGUSGAoHYWRkcmVzcxgJIAEoCVIHYWRkcmVzcxIhCgxkYXRhX3ByZXNlbnQYCiABKAhSC2RhdGFQcmVzZW50EhsKCWNsaW5pY19pZBgLIAEoCVIIY2xpbmljSWQ=');
@$core.Deprecated('Use emergencyInfoResponseDescriptor instead')
const EmergencyInfoResponse$json = const {
  '1': 'EmergencyInfoResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'emergency_mobile_number', '3': 2, '4': 1, '5': 9, '10': 'emergencyMobileNumber'},
    const {'1': 'booking_url', '3': 3, '4': 1, '5': 9, '10': 'bookingUrl'},
    const {'1': 'data_saved', '3': 4, '4': 1, '5': 8, '10': 'dataSaved'},
  ],
};

/// Descriptor for `EmergencyInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emergencyInfoResponseDescriptor = $convert.base64Decode('ChVFbWVyZ2VuY3lJbmZvUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSNgoXZW1lcmdlbmN5X21vYmlsZV9udW1iZXIYAiABKAlSFWVtZXJnZW5jeU1vYmlsZU51bWJlchIfCgtib29raW5nX3VybBgDIAEoCVIKYm9va2luZ1VybBIdCgpkYXRhX3NhdmVkGAQgASgIUglkYXRhU2F2ZWQ=');
@$core.Deprecated('Use checkPatientappConversationDescriptor instead')
const CheckPatientappConversation$json = const {
  '1': 'CheckPatientappConversation',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'mobile_number', '3': 3, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'follo_up_id', '3': 4, '4': 1, '5': 9, '10': 'folloUpId'},
    const {'1': 'number_of_messages', '3': 5, '4': 1, '5': 5, '10': 'numberOfMessages'},
    const {'1': 'clinic_id', '3': 6, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `CheckPatientappConversation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkPatientappConversationDescriptor = $convert.base64Decode('ChtDaGVja1BhdGllbnRhcHBDb252ZXJzYXRpb24SFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEh0KCnVzZXJfdG9rZW4YAiABKAlSCXVzZXJUb2tlbhIjCg1tb2JpbGVfbnVtYmVyGAMgASgJUgxtb2JpbGVOdW1iZXISHgoLZm9sbG9fdXBfaWQYBCABKAlSCWZvbGxvVXBJZBIsChJudW1iZXJfb2ZfbWVzc2FnZXMYBSABKAVSEG51bWJlck9mTWVzc2FnZXMSGwoJY2xpbmljX2lkGAYgASgJUghjbGluaWNJZA==');
@$core.Deprecated('Use checkPatientappConversationResponseDescriptor instead')
const CheckPatientappConversationResponse$json = const {
  '1': 'CheckPatientappConversationResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'changed', '3': 2, '4': 1, '5': 8, '10': 'changed'},
    const {'1': 'conversation_messages', '3': 3, '4': 3, '5': 11, '6': '.dashboard.PatientappChatMessage', '10': 'conversationMessages'},
  ],
};

/// Descriptor for `CheckPatientappConversationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkPatientappConversationResponseDescriptor = $convert.base64Decode('CiNDaGVja1BhdGllbnRhcHBDb252ZXJzYXRpb25SZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxIYCgdjaGFuZ2VkGAIgASgIUgdjaGFuZ2VkElUKFWNvbnZlcnNhdGlvbl9tZXNzYWdlcxgDIAMoCzIgLmRhc2hib2FyZC5QYXRpZW50YXBwQ2hhdE1lc3NhZ2VSFGNvbnZlcnNhdGlvbk1lc3NhZ2Vz');
@$core.Deprecated('Use versionDescriptor instead')
const Version$json = const {
  '1': 'Version',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'version_number', '3': 3, '4': 1, '5': 9, '10': 'versionNumber'},
    const {'1': 'clinic_id', '3': 4, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `Version`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List versionDescriptor = $convert.base64Decode('CgdWZXJzaW9uEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIdCgp1c2VyX3Rva2VuGAIgASgJUgl1c2VyVG9rZW4SJQoOdmVyc2lvbl9udW1iZXIYAyABKAlSDXZlcnNpb25OdW1iZXISGwoJY2xpbmljX2lkGAQgASgJUghjbGluaWNJZA==');
@$core.Deprecated('Use versionResponseDescriptor instead')
const VersionResponse$json = const {
  '1': 'VersionResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'version_match', '3': 2, '4': 1, '5': 8, '10': 'versionMatch'},
  ],
};

/// Descriptor for `VersionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List versionResponseDescriptor = $convert.base64Decode('Cg9WZXJzaW9uUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSIwoNdmVyc2lvbl9tYXRjaBgCIAEoCFIMdmVyc2lvbk1hdGNo');
@$core.Deprecated('Use editProfileDescriptor instead')
const EditProfile$json = const {
  '1': 'EditProfile',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'first_name', '3': 3, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'last_name', '3': 4, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'date_of_birth', '3': 5, '4': 1, '5': 3, '10': 'dateOfBirth'},
    const {'1': 'gender', '3': 6, '4': 1, '5': 9, '10': 'gender'},
    const {'1': 'role', '3': 7, '4': 1, '5': 9, '10': 'role'},
    const {'1': 'age', '3': 8, '4': 1, '5': 5, '10': 'age'},
    const {'1': 'profile_picture', '3': 9, '4': 1, '5': 11, '6': '.dashboard.Media', '10': 'profilePicture'},
    const {'1': 'clinic_id', '3': 10, '4': 1, '5': 9, '10': 'clinicId'},
    const {'1': 'email', '3': 11, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'patient_profile_id', '3': 12, '4': 1, '5': 9, '10': 'patientProfileId'},
  ],
};

/// Descriptor for `EditProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editProfileDescriptor = $convert.base64Decode('CgtFZGl0UHJvZmlsZRIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSHQoKdXNlcl90b2tlbhgCIAEoCVIJdXNlclRva2VuEh0KCmZpcnN0X25hbWUYAyABKAlSCWZpcnN0TmFtZRIbCglsYXN0X25hbWUYBCABKAlSCGxhc3ROYW1lEiIKDWRhdGVfb2ZfYmlydGgYBSABKANSC2RhdGVPZkJpcnRoEhYKBmdlbmRlchgGIAEoCVIGZ2VuZGVyEhIKBHJvbGUYByABKAlSBHJvbGUSEAoDYWdlGAggASgFUgNhZ2USOQoPcHJvZmlsZV9waWN0dXJlGAkgASgLMhAuZGFzaGJvYXJkLk1lZGlhUg5wcm9maWxlUGljdHVyZRIbCgljbGluaWNfaWQYCiABKAlSCGNsaW5pY0lkEhQKBWVtYWlsGAsgASgJUgVlbWFpbBIsChJwYXRpZW50X3Byb2ZpbGVfaWQYDCABKAlSEHBhdGllbnRQcm9maWxlSWQ=');
@$core.Deprecated('Use editProfileResponseDescriptor instead')
const EditProfileResponse$json = const {
  '1': 'EditProfileResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'profile_updated', '3': 2, '4': 1, '5': 8, '10': 'profileUpdated'},
    const {'1': 'patientdata', '3': 3, '4': 1, '5': 11, '6': '.dashboard.Patient', '10': 'patientdata'},
  ],
};

/// Descriptor for `EditProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editProfileResponseDescriptor = $convert.base64Decode('ChNFZGl0UHJvZmlsZVJlc3BvbnNlEhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVzEicKD3Byb2ZpbGVfdXBkYXRlZBgCIAEoCFIOcHJvZmlsZVVwZGF0ZWQSNAoLcGF0aWVudGRhdGEYAyABKAsyEi5kYXNoYm9hcmQuUGF0aWVudFILcGF0aWVudGRhdGE=');
@$core.Deprecated('Use patientDeleteDescriptor instead')
const PatientDelete$json = const {
  '1': 'PatientDelete',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'mobile_number', '3': 3, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'clinic_id', '3': 4, '4': 1, '5': 9, '10': 'clinicId'},
    const {'1': 'user_pin', '3': 5, '4': 1, '5': 5, '10': 'userPin'},
  ],
};

/// Descriptor for `PatientDelete`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patientDeleteDescriptor = $convert.base64Decode('Cg1QYXRpZW50RGVsZXRlEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIdCgp1c2VyX3Rva2VuGAIgASgJUgl1c2VyVG9rZW4SIwoNbW9iaWxlX251bWJlchgDIAEoCVIMbW9iaWxlTnVtYmVyEhsKCWNsaW5pY19pZBgEIAEoCVIIY2xpbmljSWQSGQoIdXNlcl9waW4YBSABKAVSB3VzZXJQaW4=');
@$core.Deprecated('Use patientDeleteResponseDescriptor instead')
const PatientDeleteResponse$json = const {
  '1': 'PatientDeleteResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'user_deleted', '3': 2, '4': 1, '5': 8, '10': 'userDeleted'},
  ],
};

/// Descriptor for `PatientDeleteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patientDeleteResponseDescriptor = $convert.base64Decode('ChVQYXRpZW50RGVsZXRlUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSIQoMdXNlcl9kZWxldGVkGAIgASgIUgt1c2VyRGVsZXRlZA==');
@$core.Deprecated('Use addPatientProfileDescriptor instead')
const AddPatientProfile$json = const {
  '1': 'AddPatientProfile',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'mobile_number', '3': 3, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'first_name', '3': 4, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'last_name', '3': 5, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'gender', '3': 6, '4': 1, '5': 9, '10': 'gender'},
    const {'1': 'age', '3': 7, '4': 1, '5': 5, '10': 'age'},
  ],
};

/// Descriptor for `AddPatientProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addPatientProfileDescriptor = $convert.base64Decode('ChFBZGRQYXRpZW50UHJvZmlsZRIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSHQoKdXNlcl90b2tlbhgCIAEoCVIJdXNlclRva2VuEiMKDW1vYmlsZV9udW1iZXIYAyABKAlSDG1vYmlsZU51bWJlchIdCgpmaXJzdF9uYW1lGAQgASgJUglmaXJzdE5hbWUSGwoJbGFzdF9uYW1lGAUgASgJUghsYXN0TmFtZRIWCgZnZW5kZXIYBiABKAlSBmdlbmRlchIQCgNhZ2UYByABKAVSA2FnZQ==');
@$core.Deprecated('Use patientTupleDescriptor instead')
const PatientTuple$json = const {
  '1': 'PatientTuple',
  '2': const [
    const {'1': 'patient_id', '3': 1, '4': 1, '5': 9, '10': 'patientId'},
    const {'1': 'patient_profile_id', '3': 2, '4': 1, '5': 9, '10': 'patientProfileId'},
    const {'1': 'mobile_number', '3': 3, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'first_name', '3': 4, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'last_name', '3': 5, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'age', '3': 6, '4': 1, '5': 5, '10': 'age'},
    const {'1': 'gender', '3': 7, '4': 1, '5': 9, '10': 'gender'},
    const {'1': 'history', '3': 8, '4': 3, '5': 11, '6': '.dashboard.PatientHistory', '10': 'history'},
  ],
};

/// Descriptor for `PatientTuple`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patientTupleDescriptor = $convert.base64Decode('CgxQYXRpZW50VHVwbGUSHQoKcGF0aWVudF9pZBgBIAEoCVIJcGF0aWVudElkEiwKEnBhdGllbnRfcHJvZmlsZV9pZBgCIAEoCVIQcGF0aWVudFByb2ZpbGVJZBIjCg1tb2JpbGVfbnVtYmVyGAMgASgJUgxtb2JpbGVOdW1iZXISHQoKZmlyc3RfbmFtZRgEIAEoCVIJZmlyc3ROYW1lEhsKCWxhc3RfbmFtZRgFIAEoCVIIbGFzdE5hbWUSEAoDYWdlGAYgASgFUgNhZ2USFgoGZ2VuZGVyGAcgASgJUgZnZW5kZXISMwoHaGlzdG9yeRgIIAMoCzIZLmRhc2hib2FyZC5QYXRpZW50SGlzdG9yeVIHaGlzdG9yeQ==');
@$core.Deprecated('Use addPatientProfileResponseDescriptor instead')
const AddPatientProfileResponse$json = const {
  '1': 'AddPatientProfileResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'patient_profile_added', '3': 2, '4': 1, '5': 8, '10': 'patientProfileAdded'},
    const {'1': 'patient', '3': 3, '4': 1, '5': 11, '6': '.dashboard.PatientTuple', '10': 'patient'},
  ],
};

/// Descriptor for `AddPatientProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addPatientProfileResponseDescriptor = $convert.base64Decode('ChlBZGRQYXRpZW50UHJvZmlsZVJlc3BvbnNlEhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVzEjIKFXBhdGllbnRfcHJvZmlsZV9hZGRlZBgCIAEoCFITcGF0aWVudFByb2ZpbGVBZGRlZBIxCgdwYXRpZW50GAMgASgLMhcuZGFzaGJvYXJkLlBhdGllbnRUdXBsZVIHcGF0aWVudA==');
@$core.Deprecated('Use multiplePatientDescriptor instead')
const MultiplePatient$json = const {
  '1': 'MultiplePatient',
  '2': const [
    const {'1': 'patient_id', '3': 1, '4': 1, '5': 9, '10': 'patientId'},
    const {'1': 'patient_profile_id', '3': 2, '4': 1, '5': 9, '10': 'patientProfileId'},
    const {'1': 'mobile_number', '3': 3, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'first_name', '3': 4, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'last_name', '3': 5, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'age', '3': 6, '4': 1, '5': 5, '10': 'age'},
    const {'1': 'gender', '3': 7, '4': 1, '5': 9, '10': 'gender'},
  ],
};

/// Descriptor for `MultiplePatient`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List multiplePatientDescriptor = $convert.base64Decode('Cg9NdWx0aXBsZVBhdGllbnQSHQoKcGF0aWVudF9pZBgBIAEoCVIJcGF0aWVudElkEiwKEnBhdGllbnRfcHJvZmlsZV9pZBgCIAEoCVIQcGF0aWVudFByb2ZpbGVJZBIjCg1tb2JpbGVfbnVtYmVyGAMgASgJUgxtb2JpbGVOdW1iZXISHQoKZmlyc3RfbmFtZRgEIAEoCVIJZmlyc3ROYW1lEhsKCWxhc3RfbmFtZRgFIAEoCVIIbGFzdE5hbWUSEAoDYWdlGAYgASgFUgNhZ2USFgoGZ2VuZGVyGAcgASgJUgZnZW5kZXI=');
@$core.Deprecated('Use fetchMultiplePatientDescriptor instead')
const FetchMultiplePatient$json = const {
  '1': 'FetchMultiplePatient',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'mobile_number', '3': 3, '4': 1, '5': 9, '10': 'mobileNumber'},
  ],
};

/// Descriptor for `FetchMultiplePatient`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchMultiplePatientDescriptor = $convert.base64Decode('ChRGZXRjaE11bHRpcGxlUGF0aWVudBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSHQoKdXNlcl90b2tlbhgCIAEoCVIJdXNlclRva2VuEiMKDW1vYmlsZV9udW1iZXIYAyABKAlSDG1vYmlsZU51bWJlcg==');
@$core.Deprecated('Use fetchMultiplePatientResponseDescriptor instead')
const FetchMultiplePatientResponse$json = const {
  '1': 'FetchMultiplePatientResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'patientdata', '3': 2, '4': 3, '5': 11, '6': '.dashboard.MultiplePatient', '10': 'patientdata'},
    const {'1': 'patient_exists', '3': 3, '4': 1, '5': 8, '10': 'patientExists'},
  ],
};

/// Descriptor for `FetchMultiplePatientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchMultiplePatientResponseDescriptor = $convert.base64Decode('ChxGZXRjaE11bHRpcGxlUGF0aWVudFJlc3BvbnNlEhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVzEjwKC3BhdGllbnRkYXRhGAIgAygLMhouZGFzaGJvYXJkLk11bHRpcGxlUGF0aWVudFILcGF0aWVudGRhdGESJQoOcGF0aWVudF9leGlzdHMYAyABKAhSDXBhdGllbnRFeGlzdHM=');
@$core.Deprecated('Use answerDescriptor instead')
const Answer$json = const {
  '1': 'Answer',
  '2': const [
    const {'1': 'answer', '3': 1, '4': 1, '5': 9, '10': 'answer'},
    const {'1': 'summary', '3': 2, '4': 1, '5': 9, '10': 'summary'},
    const {'1': 'alert', '3': 3, '4': 1, '5': 9, '10': 'alert'},
  ],
};

/// Descriptor for `Answer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List answerDescriptor = $convert.base64Decode('CgZBbnN3ZXISFgoGYW5zd2VyGAEgASgJUgZhbnN3ZXISGAoHc3VtbWFyeRgCIAEoCVIHc3VtbWFyeRIUCgVhbGVydBgDIAEoCVIFYWxlcnQ=');
@$core.Deprecated('Use newQuestionDescriptor instead')
const NewQuestion$json = const {
  '1': 'NewQuestion',
  '2': const [
    const {'1': 'question_type', '3': 1, '4': 1, '5': 9, '10': 'questionType'},
    const {'1': 'question', '3': 2, '4': 1, '5': 9, '10': 'question'},
    const {'1': 'answer_type', '3': 3, '4': 1, '5': 9, '10': 'answerType'},
    const {'1': 'answers', '3': 4, '4': 3, '5': 11, '6': '.dashboard.Answer', '10': 'answers'},
  ],
};

/// Descriptor for `NewQuestion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newQuestionDescriptor = $convert.base64Decode('CgtOZXdRdWVzdGlvbhIjCg1xdWVzdGlvbl90eXBlGAEgASgJUgxxdWVzdGlvblR5cGUSGgoIcXVlc3Rpb24YAiABKAlSCHF1ZXN0aW9uEh8KC2Fuc3dlcl90eXBlGAMgASgJUgphbnN3ZXJUeXBlEisKB2Fuc3dlcnMYBCADKAsyES5kYXNoYm9hcmQuQW5zd2VyUgdhbnN3ZXJz');
@$core.Deprecated('Use comorbidityDescriptor instead')
const Comorbidity$json = const {
  '1': 'Comorbidity',
  '2': const [
    const {'1': 'comorbidity_id', '3': 1, '4': 1, '5': 9, '10': 'comorbidityId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Comorbidity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List comorbidityDescriptor = $convert.base64Decode('CgtDb21vcmJpZGl0eRIlCg5jb21vcmJpZGl0eV9pZBgBIAEoCVINY29tb3JiaWRpdHlJZBISCgRuYW1lGAIgASgJUgRuYW1l');
@$core.Deprecated('Use undiagnosisCreateFolloUpDescriptor instead')
const UndiagnosisCreateFolloUp$json = const {
  '1': 'UndiagnosisCreateFolloUp',
  '2': const [
    const {'1': 'user_token', '3': 1, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'clinic_id', '3': 3, '4': 1, '5': 9, '10': 'clinicId'},
    const {'1': 'care_team_id', '3': 4, '4': 1, '5': 9, '10': 'careTeamId'},
    const {'1': 'mobile_number', '3': 5, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'first_name', '3': 6, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'last_name', '3': 7, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'age', '3': 8, '4': 1, '5': 5, '10': 'age'},
    const {'1': 'gender', '3': 9, '4': 1, '5': 9, '10': 'gender'},
    const {'1': 'disease_id', '3': 10, '4': 1, '5': 9, '10': 'diseaseId'},
    const {'1': 'follo_up_start_timestamp', '3': 11, '4': 1, '5': 3, '10': 'folloUpStartTimestamp'},
    const {'1': 'recurring', '3': 12, '4': 1, '5': 8, '10': 'recurring'},
    const {'1': 'number_of_days', '3': 13, '4': 1, '5': 5, '10': 'numberOfDays'},
    const {'1': 'repeat_frequency', '3': 14, '4': 1, '5': 5, '10': 'repeatFrequency'},
    const {'1': 'daily_frequency', '3': 15, '4': 1, '5': 5, '10': 'dailyFrequency'},
    const {'1': 'comorbidities', '3': 16, '4': 3, '5': 11, '6': '.dashboard.Comorbidity', '10': 'comorbidities'},
    const {'1': 'additional_questions', '3': 17, '4': 3, '5': 11, '6': '.dashboard.NewQuestion', '10': 'additionalQuestions'},
    const {'1': 'contains_lab_tests', '3': 18, '4': 1, '5': 8, '10': 'containsLabTests'},
    const {'1': 'notes', '3': 19, '4': 1, '5': 9, '10': 'notes'},
    const {'1': 'attachments', '3': 20, '4': 3, '5': 11, '6': '.dashboard.Media', '10': 'attachments'},
    const {'1': 'select_one_follo', '3': 21, '4': 1, '5': 8, '10': 'selectOneFollo'},
    const {'1': 'schedule_appointment', '3': 22, '4': 1, '5': 8, '10': 'scheduleAppointment'},
    const {'1': 'appointment_date', '3': 23, '4': 1, '5': 3, '10': 'appointmentDate'},
    const {'1': 'second_follo_up_start_timestamp', '3': 24, '4': 1, '5': 3, '10': 'secondFolloUpStartTimestamp'},
    const {'1': 'preferred_communication_language', '3': 25, '4': 1, '5': 9, '10': 'preferredCommunicationLanguage'},
    const {'1': 'patient_profile_id', '3': 26, '4': 1, '5': 9, '10': 'patientProfileId'},
  ],
};

/// Descriptor for `UndiagnosisCreateFolloUp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List undiagnosisCreateFolloUpDescriptor = $convert.base64Decode('ChhVbmRpYWdub3Npc0NyZWF0ZUZvbGxvVXASHQoKdXNlcl90b2tlbhgBIAEoCVIJdXNlclRva2VuEhcKB3VzZXJfaWQYAiABKAlSBnVzZXJJZBIbCgljbGluaWNfaWQYAyABKAlSCGNsaW5pY0lkEiAKDGNhcmVfdGVhbV9pZBgEIAEoCVIKY2FyZVRlYW1JZBIjCg1tb2JpbGVfbnVtYmVyGAUgASgJUgxtb2JpbGVOdW1iZXISHQoKZmlyc3RfbmFtZRgGIAEoCVIJZmlyc3ROYW1lEhsKCWxhc3RfbmFtZRgHIAEoCVIIbGFzdE5hbWUSEAoDYWdlGAggASgFUgNhZ2USFgoGZ2VuZGVyGAkgASgJUgZnZW5kZXISHQoKZGlzZWFzZV9pZBgKIAEoCVIJZGlzZWFzZUlkEjcKGGZvbGxvX3VwX3N0YXJ0X3RpbWVzdGFtcBgLIAEoA1IVZm9sbG9VcFN0YXJ0VGltZXN0YW1wEhwKCXJlY3VycmluZxgMIAEoCFIJcmVjdXJyaW5nEiQKDm51bWJlcl9vZl9kYXlzGA0gASgFUgxudW1iZXJPZkRheXMSKQoQcmVwZWF0X2ZyZXF1ZW5jeRgOIAEoBVIPcmVwZWF0RnJlcXVlbmN5EicKD2RhaWx5X2ZyZXF1ZW5jeRgPIAEoBVIOZGFpbHlGcmVxdWVuY3kSPAoNY29tb3JiaWRpdGllcxgQIAMoCzIWLmRhc2hib2FyZC5Db21vcmJpZGl0eVINY29tb3JiaWRpdGllcxJJChRhZGRpdGlvbmFsX3F1ZXN0aW9ucxgRIAMoCzIWLmRhc2hib2FyZC5OZXdRdWVzdGlvblITYWRkaXRpb25hbFF1ZXN0aW9ucxIsChJjb250YWluc19sYWJfdGVzdHMYEiABKAhSEGNvbnRhaW5zTGFiVGVzdHMSFAoFbm90ZXMYEyABKAlSBW5vdGVzEjIKC2F0dGFjaG1lbnRzGBQgAygLMhAuZGFzaGJvYXJkLk1lZGlhUgthdHRhY2htZW50cxIoChBzZWxlY3Rfb25lX2ZvbGxvGBUgASgIUg5zZWxlY3RPbmVGb2xsbxIxChRzY2hlZHVsZV9hcHBvaW50bWVudBgWIAEoCFITc2NoZWR1bGVBcHBvaW50bWVudBIpChBhcHBvaW50bWVudF9kYXRlGBcgASgDUg9hcHBvaW50bWVudERhdGUSRAofc2Vjb25kX2ZvbGxvX3VwX3N0YXJ0X3RpbWVzdGFtcBgYIAEoA1Ibc2Vjb25kRm9sbG9VcFN0YXJ0VGltZXN0YW1wEkgKIHByZWZlcnJlZF9jb21tdW5pY2F0aW9uX2xhbmd1YWdlGBkgASgJUh5wcmVmZXJyZWRDb21tdW5pY2F0aW9uTGFuZ3VhZ2USLAoScGF0aWVudF9wcm9maWxlX2lkGBogASgJUhBwYXRpZW50UHJvZmlsZUlk');
@$core.Deprecated('Use undiagnosisCreateFolloUpResponseDescriptor instead')
const UndiagnosisCreateFolloUpResponse$json = const {
  '1': 'UndiagnosisCreateFolloUpResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'follo_up_created', '3': 2, '4': 1, '5': 8, '10': 'folloUpCreated'},
    const {'1': 'follo_up_id', '3': 3, '4': 1, '5': 5, '10': 'folloUpId'},
  ],
};

/// Descriptor for `UndiagnosisCreateFolloUpResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List undiagnosisCreateFolloUpResponseDescriptor = $convert.base64Decode('CiBVbmRpYWdub3Npc0NyZWF0ZUZvbGxvVXBSZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxIoChBmb2xsb191cF9jcmVhdGVkGAIgASgIUg5mb2xsb1VwQ3JlYXRlZBIeCgtmb2xsb191cF9pZBgDIAEoBVIJZm9sbG9VcElk');
@$core.Deprecated('Use patientListDescriptor instead')
const PatientList$json = const {
  '1': 'PatientList',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'mobile_number', '3': 3, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'clinic_id', '3': 4, '4': 1, '5': 9, '10': 'clinicId'},
  ],
};

/// Descriptor for `PatientList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patientListDescriptor = $convert.base64Decode('CgtQYXRpZW50TGlzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSHQoKdXNlcl90b2tlbhgCIAEoCVIJdXNlclRva2VuEiMKDW1vYmlsZV9udW1iZXIYAyABKAlSDG1vYmlsZU51bWJlchIbCgljbGluaWNfaWQYBCABKAlSCGNsaW5pY0lk');
@$core.Deprecated('Use patientListResponseDescriptor instead')
const PatientListResponse$json = const {
  '1': 'PatientListResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'patientdata', '3': 2, '4': 3, '5': 11, '6': '.dashboard.Patient', '10': 'patientdata'},
    const {'1': 'patient_exists', '3': 3, '4': 1, '5': 8, '10': 'patientExists'},
  ],
};

/// Descriptor for `PatientListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patientListResponseDescriptor = $convert.base64Decode('ChNQYXRpZW50TGlzdFJlc3BvbnNlEhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVzEjQKC3BhdGllbnRkYXRhGAIgAygLMhIuZGFzaGJvYXJkLlBhdGllbnRSC3BhdGllbnRkYXRhEiUKDnBhdGllbnRfZXhpc3RzGAMgASgIUg1wYXRpZW50RXhpc3Rz');
@$core.Deprecated('Use editPatientProfileDescriptor instead')
const EditPatientProfile$json = const {
  '1': 'EditPatientProfile',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user_token', '3': 2, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'patient_profile_id', '3': 3, '4': 1, '5': 9, '10': 'patientProfileId'},
    const {'1': 'first_name', '3': 4, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'last_name', '3': 5, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'gender', '3': 6, '4': 1, '5': 9, '10': 'gender'},
    const {'1': 'age', '3': 7, '4': 1, '5': 5, '10': 'age'},
  ],
};

/// Descriptor for `EditPatientProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editPatientProfileDescriptor = $convert.base64Decode('ChJFZGl0UGF0aWVudFByb2ZpbGUSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEh0KCnVzZXJfdG9rZW4YAiABKAlSCXVzZXJUb2tlbhIsChJwYXRpZW50X3Byb2ZpbGVfaWQYAyABKAlSEHBhdGllbnRQcm9maWxlSWQSHQoKZmlyc3RfbmFtZRgEIAEoCVIJZmlyc3ROYW1lEhsKCWxhc3RfbmFtZRgFIAEoCVIIbGFzdE5hbWUSFgoGZ2VuZGVyGAYgASgJUgZnZW5kZXISEAoDYWdlGAcgASgFUgNhZ2U=');
@$core.Deprecated('Use editPatientProfileResponseDescriptor instead')
const EditPatientProfileResponse$json = const {
  '1': 'EditPatientProfileResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'patient_updated', '3': 2, '4': 1, '5': 8, '10': 'patientUpdated'},
  ],
};

/// Descriptor for `EditPatientProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editPatientProfileResponseDescriptor = $convert.base64Decode('ChpFZGl0UGF0aWVudFByb2ZpbGVSZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxInCg9wYXRpZW50X3VwZGF0ZWQYAiABKAhSDnBhdGllbnRVcGRhdGVk');
@$core.Deprecated('Use caregiverInfoDescriptor instead')
const CaregiverInfo$json = const {
  '1': 'CaregiverInfo',
  '2': const [
    const {'1': 'user_token', '3': 1, '4': 1, '5': 9, '10': 'userToken'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'clinic_id', '3': 3, '4': 1, '5': 9, '10': 'clinicId'},
    const {'1': 'care_team_id', '3': 4, '4': 1, '5': 9, '10': 'careTeamId'},
    const {'1': 'caregiver_id', '3': 5, '4': 1, '5': 9, '10': 'caregiverId'},
  ],
};

/// Descriptor for `CaregiverInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List caregiverInfoDescriptor = $convert.base64Decode('Cg1DYXJlZ2l2ZXJJbmZvEh0KCnVzZXJfdG9rZW4YASABKAlSCXVzZXJUb2tlbhIXCgd1c2VyX2lkGAIgASgJUgZ1c2VySWQSGwoJY2xpbmljX2lkGAMgASgJUghjbGluaWNJZBIgCgxjYXJlX3RlYW1faWQYBCABKAlSCmNhcmVUZWFtSWQSIQoMY2FyZWdpdmVyX2lkGAUgASgJUgtjYXJlZ2l2ZXJJZA==');
@$core.Deprecated('Use caregiverInfoResponseDescriptor instead')
const CaregiverInfoResponse$json = const {
  '1': 'CaregiverInfoResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'user_type', '3': 4, '4': 1, '5': 9, '10': 'userType'},
    const {'1': 'role', '3': 5, '4': 1, '5': 9, '10': 'role'},
    const {'1': 'mobile_number', '3': 8, '4': 1, '5': 9, '10': 'mobileNumber'},
    const {'1': 'first_name', '3': 9, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'last_name', '3': 10, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'name', '3': 11, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'profile_picture', '3': 12, '4': 1, '5': 11, '6': '.dashboard.Media', '10': 'profilePicture'},
    const {'1': 'date_of_birth', '3': 13, '4': 1, '5': 3, '10': 'dateOfBirth'},
    const {'1': 'license_number', '3': 14, '4': 1, '5': 9, '10': 'licenseNumber'},
    const {'1': 'medical_certificate', '3': 15, '4': 1, '5': 11, '6': '.dashboard.Media', '10': 'medicalCertificate'},
    const {'1': 'qualifications', '3': 16, '4': 1, '5': 9, '10': 'qualifications'},
    const {'1': 'experience', '3': 17, '4': 1, '5': 5, '10': 'experience'},
    const {'1': 'degree_certificate', '3': 18, '4': 1, '5': 11, '6': '.dashboard.Media', '10': 'degreeCertificate'},
    const {'1': 'specialities', '3': 19, '4': 3, '5': 11, '6': '.dashboard.CaregiverSpeciality', '10': 'specialities'},
    const {'1': 'user_status', '3': 20, '4': 1, '5': 9, '10': 'userStatus'},
    const {'1': 'emergency_contact_number', '3': 21, '4': 1, '5': 9, '10': 'emergencyContactNumber'},
    const {'1': 'appointment_url', '3': 22, '4': 1, '5': 9, '10': 'appointmentUrl'},
    const {'1': 'about', '3': 23, '4': 1, '5': 9, '10': 'about'},
  ],
};

/// Descriptor for `CaregiverInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List caregiverInfoResponseDescriptor = $convert.base64Decode('ChVDYXJlZ2l2ZXJJbmZvUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSFwoHdXNlcl9pZBgCIAEoCVIGdXNlcklkEhQKBWVtYWlsGAMgASgJUgVlbWFpbBIbCgl1c2VyX3R5cGUYBCABKAlSCHVzZXJUeXBlEhIKBHJvbGUYBSABKAlSBHJvbGUSIwoNbW9iaWxlX251bWJlchgIIAEoCVIMbW9iaWxlTnVtYmVyEh0KCmZpcnN0X25hbWUYCSABKAlSCWZpcnN0TmFtZRIbCglsYXN0X25hbWUYCiABKAlSCGxhc3ROYW1lEhIKBG5hbWUYCyABKAlSBG5hbWUSOQoPcHJvZmlsZV9waWN0dXJlGAwgASgLMhAuZGFzaGJvYXJkLk1lZGlhUg5wcm9maWxlUGljdHVyZRIiCg1kYXRlX29mX2JpcnRoGA0gASgDUgtkYXRlT2ZCaXJ0aBIlCg5saWNlbnNlX251bWJlchgOIAEoCVINbGljZW5zZU51bWJlchJBChNtZWRpY2FsX2NlcnRpZmljYXRlGA8gASgLMhAuZGFzaGJvYXJkLk1lZGlhUhJtZWRpY2FsQ2VydGlmaWNhdGUSJgoOcXVhbGlmaWNhdGlvbnMYECABKAlSDnF1YWxpZmljYXRpb25zEh4KCmV4cGVyaWVuY2UYESABKAVSCmV4cGVyaWVuY2USPwoSZGVncmVlX2NlcnRpZmljYXRlGBIgASgLMhAuZGFzaGJvYXJkLk1lZGlhUhFkZWdyZWVDZXJ0aWZpY2F0ZRJCCgxzcGVjaWFsaXRpZXMYEyADKAsyHi5kYXNoYm9hcmQuQ2FyZWdpdmVyU3BlY2lhbGl0eVIMc3BlY2lhbGl0aWVzEh8KC3VzZXJfc3RhdHVzGBQgASgJUgp1c2VyU3RhdHVzEjgKGGVtZXJnZW5jeV9jb250YWN0X251bWJlchgVIAEoCVIWZW1lcmdlbmN5Q29udGFjdE51bWJlchInCg9hcHBvaW50bWVudF91cmwYFiABKAlSDmFwcG9pbnRtZW50VXJsEhQKBWFib3V0GBcgASgJUgVhYm91dA==');

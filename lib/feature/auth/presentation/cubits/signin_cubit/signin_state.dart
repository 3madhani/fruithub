part of 'signin_cubit.dart';

@immutable
class SiginState extends Equatable {
  final UserEntity? userEntity;
  final bool isLoadingEmail;
  final String? emailError;
  final bool isLoadingFacebook;
  final String? facebookError;
  final bool isLoadingGoogle;
  final String? googleError;
  final bool isLoadingApple;
  final String? appleError;

  const SiginState({
    this.userEntity,
    this.isLoadingEmail = false,
    this.emailError,
    this.isLoadingFacebook = false,
    this.facebookError,
    this.isLoadingGoogle = false,
    this.googleError,
    this.isLoadingApple = false,
    this.appleError,
  });

  // Check if there are any errors
  bool get hasError =>
      emailError != null ||
      facebookError != null ||
      googleError != null ||
      appleError != null;

  // Check if any operation is in progress
  bool get isLoading =>
      isLoadingEmail || isLoadingFacebook || isLoadingGoogle || isLoadingApple;

  @override
  List<Object?> get props => [
    userEntity,
    isLoadingEmail,
    emailError,
    isLoadingFacebook,
    facebookError,
    isLoadingGoogle,
    googleError,
    isLoadingApple,
    appleError,
  ];

  // CopyWith method to update specific fields
  SiginState copyWith({
    UserEntity? userEntity,
    bool? isLoadingEmail,
    String? emailError,
    bool? isLoadingFacebook,
    String? facebookError,
    bool? isLoadingGoogle,
    String? googleError,
    bool? isLoadingApple,
    String? appleError,
  }) {
    return SiginState(
      userEntity: userEntity ?? this.userEntity,
      isLoadingEmail: isLoadingEmail ?? this.isLoadingEmail,
      emailError: emailError ?? this.emailError,
      isLoadingFacebook: isLoadingFacebook ?? this.isLoadingFacebook,
      facebookError: facebookError ?? this.facebookError,
      isLoadingGoogle: isLoadingGoogle ?? this.isLoadingGoogle,
      googleError: googleError ?? this.googleError,
      isLoadingApple: isLoadingApple ?? this.isLoadingApple,
      appleError: appleError ?? this.appleError,
    );
  }
}

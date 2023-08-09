import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordStateProvider = StateNotifierProvider<PasswordValidationNotifier, PasswordValidationState>((ref) {
  return PasswordValidationNotifier();
});

class PasswordValidationNotifier extends StateNotifier<PasswordValidationState> {
  PasswordValidationNotifier() : super(PasswordValidationState());

  updatePassword(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final specialCharRegex = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
    final upperCaseRegex = RegExp(r'[A-Z]');

    state = PasswordValidationState(
      isPasswordEightCharacters: password.length >= 8,
      passwordHasOneCharacter: specialCharRegex.hasMatch(password),
      passwordHasOneNumber: numericRegex.hasMatch(password),
      passwordHasUpperCase: upperCaseRegex.hasMatch(password),
    );
  }
}

class PasswordValidationState {
  PasswordValidationState({
    this.isPasswordEightCharacters = false,
    this.passwordHasOneCharacter = false,
    this.passwordHasOneNumber = false,
    this.passwordHasUpperCase = false,
  });

  bool isPasswordEightCharacters;
  bool passwordHasOneCharacter;
  bool passwordHasOneNumber;
  bool passwordHasUpperCase;
}

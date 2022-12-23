import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/pocketbase.user.dart';
import '../api/register.api.dart';

final registerProvider =
    NotifierProvider<RegisterNotifier, bool>(RegisterNotifier.new);

class RegisterNotifier extends Notifier<bool> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController usernameCntrlr;
  late final TextEditingController emailCntrlr;
  late bool emailVisibility;
  late final TextEditingController pwdCntrlr;
  late bool pwdObscure;
  late final TextEditingController confirmPwdCntrlr;
  late bool confirmPwdObscure;
  late final TextEditingController nameCntrlr;
  File? image;

  @override
  bool build() {
    usernameCntrlr = TextEditingController();
    emailCntrlr = TextEditingController();
    emailVisibility = true;
    pwdCntrlr = TextEditingController();
    pwdObscure = true;
    confirmPwdCntrlr = TextEditingController();
    confirmPwdObscure = true;
    nameCntrlr = TextEditingController();
    image = null;
    return true;
  }

  void toggleEmailVisibility() {
    emailVisibility = !emailVisibility;
    state = !state;
  }

  void togglePwdObscure() {
    pwdObscure = !pwdObscure;
    state = !state;
  }

  void toggleConfirmPwdObscure() {
    confirmPwdObscure = !confirmPwdObscure;
    state = !state;
  }

  void setImage(File? img) {
    image = img;
    state = !state;
  }

  void clear() {
    formKey = GlobalKey<FormState>();
    usernameCntrlr.clear();
    emailCntrlr.clear();
    pwdCntrlr.clear();
    confirmPwdCntrlr.clear();
    nameCntrlr.clear();
    image = null;
    state = !state;
  }

  Future<bool> register() async {
    if (formKey.currentState!.validate()) {
      final user = PocketBaseUser(
        name: nameCntrlr.text,
        username: usernameCntrlr.text,
        email: emailCntrlr.text,
        emailVisibility: emailVisibility,
        password: pwdCntrlr.text,
        passwordConfirm: confirmPwdCntrlr.text,
      );
      return await registerApi(user, image);
    } else {
      return false;
    }
  }
}

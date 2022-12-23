import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../utils/constants/constants.dart';

import '../../../../../extensions/extensions.dart';
import '../../../../../shared/image_process/modal_bottom_sheet_menu.dart';
import '../provider/register.provider.dart';

class RegisterView extends ConsumerWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerPd = ref.watch(registerProvider.notifier);
    ref.watch(registerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              key: registerPd.formKey,
              child: Column(
                mainAxisSize: mainMin,
                children: [
                  InkWell(
                    onTap: () async {
                      await modalBottomSheetMenu(context: context).then((pk) {
                        if (pk == null) return;
                        registerPd.setImage(pk);
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(color: kPrimaryColor, width: 2.0),
                      ),
                      child: registerPd.image == null
                          ? const Icon(Icons.add, size: 50.0)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Image.file(
                                registerPd.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: registerPd.nameCntrlr,
                    decoration: const InputDecoration(
                      label: Text('Full Name'),
                      hintText: 'Enter your full name',
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: registerPd.usernameCntrlr,
                    decoration: const InputDecoration(
                      label: Text('Username'),
                      hintText: 'Enter your username',
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: registerPd.emailCntrlr,
                          decoration: const InputDecoration(
                            label: Text('Email'),
                            hintText: 'Enter your email',
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Email is required';
                            } else if (!v.isEmail) {
                              return 'Email is invalid';
                            }
                            return null;
                          },
                        ),
                      ),
                      Switch(
                        value: registerPd.emailVisibility,
                        onChanged: (_) => registerPd.toggleEmailVisibility(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      registerPd.emailVisibility
                          ? '*Email will be visible to others'
                          : '*Email will not be visible to others',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: registerPd.emailVisibility
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    obscureText: registerPd.pwdObscure,
                    controller: registerPd.pwdCntrlr,
                    decoration: InputDecoration(
                      label: const Text('Password'),
                      hintText: 'Enter your password',
                      suffixIcon: InkWell(
                        onTap: () => registerPd.togglePwdObscure(),
                        child: Icon(
                          registerPd.pwdObscure
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return 'Password is required';
                      } else if (v.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    obscureText: registerPd.confirmPwdObscure,
                    controller: registerPd.confirmPwdCntrlr,
                    decoration: InputDecoration(
                      label: const Text('Confirm Password'),
                      hintText: 'Confirm password',
                      suffixIcon: InkWell(
                        onTap: () => registerPd.toggleConfirmPwdObscure(),
                        child: Icon(
                          registerPd.confirmPwdObscure
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return 'Password is required';
                      } else if (v != registerPd.pwdCntrlr.text) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),
                  ElevatedButton(
                    onPressed: () async =>
                        await registerPd.register().then((v) {
                      if (v) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Registration successful'),
                          ),
                        );
                        registerPd.clear();
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Registration failed'),
                          ),
                        );
                      }
                    }),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

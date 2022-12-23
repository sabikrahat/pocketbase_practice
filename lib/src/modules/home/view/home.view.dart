import 'package:flutter/material.dart';
import '../../auth/view/login/view/login.view.dart';
import '../../auth/view/register/view/register.view.dart';
import '../../../utils/constants/constants.dart';

import '../../../localization/loalization.dart';
import '../../../theme/themes/themes.dart';
import '../../router/provider/route.provider.dart';
import '../../setting/view/setting.view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Pocket Base')),
        body: Center(
          child: Column(
            mainAxisSize: mainMin,
            children: [
              ElevatedButton(
                style: roundedButtonStyle,
                onPressed: () async =>
                    await fadePush(context, const LoginView()),
                child: const Text('Login'),
              ),
              ElevatedButton(
                style: roundedButtonStyle,
                onPressed: () async =>
                    await fadePush(context, const RegisterView()),
                child: const Text('Register'),
              ),
              ElevatedButton(
                style: roundedButtonStyle,
                onPressed: () async =>
                    await fadePush(context, const SettingView()),
                child: Text(t!.setting),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {},
          child: const Icon(Icons.add),
        ));
  }
}

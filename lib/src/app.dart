import 'package:flutter/material.dart' show BuildContext, MaterialApp, Widget;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import 'localization/loalization.dart'
    show localizationsDelegates, onGenerateTitle, supportedLocales;
import 'modules/router/view/router.dart' show AppRouter;
import 'theme/model/theme.model.dart' show ThemeProfileExtension;
import 'theme/provider/theme.provider.dart' show themeProvider;
import 'utils/constants/constants.dart' show appName;

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      theme: ref.watch(themeProvider).theme,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: onGenerateTitle,
      restorationScopeId: appName,
      home: const AppRouter(),
      builder: EasyLoading.init(),
    );
  }
}

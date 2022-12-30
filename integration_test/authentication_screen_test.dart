import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:weather_app/core/storage/secure_storage_impl.dart';
import 'package:weather_app/core/storage/storage.manager.dart';

import 'package:weather_app/main.dart' as app;
import 'package:weather_app/presentationLayer/screens/weather.screen.dart';

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late final emailTextInput;
  late final passwordTextInput;
  late final buttonLogin;

  final StorageManager storageManager = StorageManager(SecureStorageImpl(FlutterSecureStorage()));

  group("integration test on Auth feature", () {
    setUpAll(() {
      storageManager.deleteCurrentUser(); // clean appCache for passed the test even if app is already running
      emailTextInput = find.byKey(Key("emailTextInput"));
      passwordTextInput = find.byKey(Key("passwordTextInput"));
      buttonLogin = find.byType(ElevatedButton);
    });

    testWidgets("should pop a snackbar when authentication failed", (WidgetTester widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(emailTextInput, "test@test.fr");
      await widgetTester.enterText(passwordTextInput, "test1");
      await widgetTester.pumpAndSettle();

      await widgetTester.testTextInput.receiveAction(TextInputAction.done);
      await widgetTester.pumpAndSettle();

      await widgetTester.tap(buttonLogin);
      await widgetTester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });
    testWidgets("should redirect to WeatherScreen when authentication success", (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(app.AppProviders());
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(emailTextInput, "test@test.fr");
      await widgetTester.enterText(passwordTextInput, "test");
      await widgetTester.pumpAndSettle();

      await widgetTester.testTextInput.receiveAction(TextInputAction.done);
      await widgetTester.pumpAndSettle();

      await widgetTester.tap(buttonLogin);
      await widgetTester.pumpAndSettle();

      expect(find.byType(WeatherScreen), findsOneWidget);
    });
  });
}

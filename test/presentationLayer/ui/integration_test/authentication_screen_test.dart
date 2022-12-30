import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/di/service_locator.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/presentationLayer/bloc/authentication.cubit.dart';

class AuthenticationCubitMock extends Mock implements AuthenticationCubit {}

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  AuthenticationCubitMock authenticationCubitMock = AuthenticationCubitMock();
  setUpAll(() {
    setUpGetIt();
  });

  void behaviorLogin() {
    when(
      () => authenticationCubitMock.login("test@test.fr", "test"),
    ).thenAnswer((invocation) => Future(() => AuthenticationState.onError(errorMessage: "error")));
  }

  testWidgets("should pop a snackbar when authentication failed", (WidgetTester widgetTester) async {
    // behaviorLogin();
    await widgetTester.pumpWidget(AppProviders());
    expect(find.byType(ElevatedButton), findsOneWidget);

    await widgetTester.tap(find.byType(ElevatedButton));
    await widgetTester.pumpAndSettle();

    print(widgetTester.state(find.byType(AuthenticationState)));
    // expect(find.byType(SnackBarUtils), findsOneWidget);
    // expect(actual, matcher)
  });
}

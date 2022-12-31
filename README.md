# Weather_app

An app that displays the weather in Paris over 5 days. 

## Run the app

Once you have forked the repo, you can open a terminal and execute these commands (this implies you already have the Flutter SDK)


``` flutter pub get```

```flutter run ```

## Authentication 

To authenticate inside the app, you can use these credentials : 

```email : test@test.fr```
```password: test```

Once you are logged in, the application saves your session and you will not need to log in again. 

## Tests 
 Some tests are implemented, the unit and integration tests. 

 To run the integration test, make sure a simulator is open and run this command 

 ``` flutter test integration_test/authentication_screen_test.dart -d {device number} ```

 or you can run the script inside [test_integration_run.sh](/weather_app/test_integration_run.sh) file.

 ## Weather

The main feature of this application, display the weather for the next 5 days of the week, with a refresh every 3 hours.

You can see the real temperature in Paris, the min and max temperature as well as the temperature felt. 
 
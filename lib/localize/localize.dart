String getLocalize(String key) {
  return data.containsKey(key) ? data[key]! : "";
}

Map<String, String> data = {
  // Authentication
  "authenticationLogo": "Weather App",
  "authenticationEmailTextInputLabel": "Email",
  "authenticationPasswordTextInputLabel": "Mot de passe",
  "authMailValidatorText": "Entrez un email valide",
  "authPasswordValidatorText": "Entrez un mot de passe valide",
  "authValidateButtonLabel": "Se connecter",
};
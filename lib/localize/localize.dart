String getLocalize(String key) {
  return data.containsKey(key) ? data[key]! : "";
}

Map<String, String> data = {
  // Authentication
  "authenticationEmailTextInputLabel": "Email",
  "authenticationPasswordTextInputLabel": "Mot de passe",
};

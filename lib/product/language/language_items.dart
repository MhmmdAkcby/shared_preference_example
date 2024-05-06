enum LanguageItems { appBarName, textFieldHintText, saveButton, demo }

extension LangugeItemExtension on LanguageItems {
  String languageItemsString() {
    switch (this) {
      case LanguageItems.appBarName:
        return 'Shared Preferences Example';
      case LanguageItems.textFieldHintText:
        return 'Write your message...';
      case LanguageItems.saveButton:
        return 'Save';
      case LanguageItems.demo:
        return 'Demo';
    }
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String AccessTokenValueKey = 'accessToken';

final Map<String, TextEditingController> _AuthViewTextEditingControllers = {};

final Map<String, FocusNode> _AuthViewFocusNodes = {};

final Map<String, String? Function(String?)?> _AuthViewTextValidations = {
  AccessTokenValueKey: null,
};

mixin $AuthView {
  TextEditingController get accessTokenController =>
      _getFormTextEditingController(AccessTokenValueKey);
  FocusNode get accessTokenFocusNode => _getFormFocusNode(AccessTokenValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AuthViewTextEditingControllers.containsKey(key)) {
      return _AuthViewTextEditingControllers[key]!;
    }

    _AuthViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AuthViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AuthViewFocusNodes.containsKey(key)) {
      return _AuthViewFocusNodes[key]!;
    }
    _AuthViewFocusNodes[key] = FocusNode();
    return _AuthViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    accessTokenController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    accessTokenController.addListener(() => _updateFormData(model));
  }

  static const bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          AccessTokenValueKey: accessTokenController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _AuthViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AuthViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AuthViewTextEditingControllers.clear();
    _AuthViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get accessTokenValue =>
      this.formValueMap[AccessTokenValueKey] as String?;

  set accessTokenValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          AccessTokenValueKey: value,
        }),
    );

    if (_AuthViewTextEditingControllers.containsKey(AccessTokenValueKey)) {
      _AuthViewTextEditingControllers[AccessTokenValueKey]?.text = value ?? '';
    }
  }

  bool get hasAccessToken =>
      this.formValueMap.containsKey(AccessTokenValueKey) &&
      (accessTokenValue?.isNotEmpty ?? false);

  bool get hasAccessTokenValidationMessage =>
      this.fieldsValidationMessages[AccessTokenValueKey]?.isNotEmpty ?? false;

  String? get accessTokenValidationMessage =>
      this.fieldsValidationMessages[AccessTokenValueKey];
}

extension Methods on FormViewModel {
  setAccessTokenValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AccessTokenValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    accessTokenValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      AccessTokenValueKey: getValidationMessage(AccessTokenValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AuthViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AuthViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      AccessTokenValueKey: getValidationMessage(AccessTokenValueKey),
    });

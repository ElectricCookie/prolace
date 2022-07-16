// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs,  constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String HostValueKey = 'host';
const String PortValueKey = 'port';

final Map<String, TextEditingController> _SetupViewTextEditingControllers = {};

final Map<String, FocusNode> _SetupViewFocusNodes = {};

final Map<String, String? Function(String?)?> _SetupViewTextValidations = {
  HostValueKey: null,
  PortValueKey: null,
};

mixin $SetupView on StatelessWidget {
  TextEditingController get hostController =>
      _getFormTextEditingController(HostValueKey, initialValue: 'http://');
  TextEditingController get portController =>
      _getFormTextEditingController(PortValueKey, initialValue: '8123');
  FocusNode get hostFocusNode => _getFormFocusNode(HostValueKey);
  FocusNode get portFocusNode => _getFormFocusNode(PortValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_SetupViewTextEditingControllers.containsKey(key)) {
      return _SetupViewTextEditingControllers[key]!;
    }
    _SetupViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SetupViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SetupViewFocusNodes.containsKey(key)) {
      return _SetupViewFocusNodes[key]!;
    }
    _SetupViewFocusNodes[key] = FocusNode();
    return _SetupViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    hostController.addListener(() => _updateFormData(model));
    portController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          HostValueKey: hostController.text,
          PortValueKey: portController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        HostValueKey: _getValidationMessage(HostValueKey),
        PortValueKey: _getValidationMessage(PortValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _SetupViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_SetupViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _SetupViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SetupViewFocusNodes.values) {
      focusNode.dispose();
    }

    _SetupViewTextEditingControllers.clear();
    _SetupViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get hostValue => this.formValueMap[HostValueKey] as String?;
  String? get portValue => this.formValueMap[PortValueKey] as String?;

  bool get hasHost => this.formValueMap.containsKey(HostValueKey);
  bool get hasPort => this.formValueMap.containsKey(PortValueKey);

  bool get hasHostValidationMessage =>
      this.fieldsValidationMessages[HostValueKey]?.isNotEmpty ?? false;
  bool get hasPortValidationMessage =>
      this.fieldsValidationMessages[PortValueKey]?.isNotEmpty ?? false;

  String? get hostValidationMessage =>
      this.fieldsValidationMessages[HostValueKey];
  String? get portValidationMessage =>
      this.fieldsValidationMessages[PortValueKey];
}

extension Methods on FormViewModel {
  setHostValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[HostValueKey] = validationMessage;
  setPortValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PortValueKey] = validationMessage;
}

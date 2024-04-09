import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/text_style_constant.dart';
import 'package:kayle/Infrastructure/Shared/PhoneNumber/country_picker_dialog.dart';
import 'package:kayle/Infrastructure/Shared/PhoneNumber/helpers.dart';

import './countries.dart';
import './phone_number.dart';

class IntlPhoneField extends StatefulWidget {
  final GlobalKey<FormFieldState>? formFieldKey;

  final bool obscureText;

  final TextAlign textAlign;

  final TextAlignVertical? textAlignVertical;
  final VoidCallback? onTap;

  final bool readOnly;
  final FormFieldSetter<PhoneNumber>? onSaved;

  final ValueChanged<PhoneNumber>? onChanged;

  final ValueChanged<Country>? onCountryChanged;

  final FutureOr<String?> Function(PhoneNumber?)? validator;

  final TextInputType keyboardType;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final void Function(String)? onSubmitted;

  final bool enabled;

  final Brightness? keyboardAppearance;

  final String? initialValue;

  final String languageCode;

  final String? initialCountryCode;

  final List<Country>? countries;

  final InputDecoration decoration;

  final TextStyle? style;

  final bool disableLengthCheck;

  final bool showDropdownIcon;

  final BoxDecoration dropdownDecoration;

  final TextStyle? dropdownTextStyle;

  final List<TextInputFormatter>? inputFormatters;

  final String searchText;

  final IconPosition dropdownIconPosition;

  final Icon dropdownIcon;

  final bool autofocus;

  final AutovalidateMode? autovalidateMode;

  final bool showCountryFlag;

  final String? invalidNumberMessage;

  final Color? cursorColor;

  final double? cursorHeight;

  final Radius? cursorRadius;

  final double cursorWidth;

  final bool? showCursor;

  final EdgeInsetsGeometry flagsButtonPadding;

  final TextInputAction? textInputAction;

  final PickerDialogStyle? pickerDialogStyle;

  final EdgeInsets flagsButtonMargin;

  final bool disableAutoFillHints;

  final TextMagnifierConfiguration? magnifierConfiguration;

  const IntlPhoneField({
    Key? key,
    this.formFieldKey,
    this.initialCountryCode,
    this.languageCode = 'en',
    this.disableAutoFillHints = false,
    this.obscureText = false,
    this.textAlign = TextAlign.left,
    this.textAlignVertical,
    this.onTap,
    this.readOnly = false,
    this.initialValue,
    this.keyboardType = TextInputType.phone,
    this.controller,
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.style,
    this.dropdownTextStyle,
    this.onSubmitted,
    this.validator,
    this.onChanged,
    this.countries,
    this.onCountryChanged,
    this.onSaved,
    this.showDropdownIcon = true,
    this.dropdownDecoration = const BoxDecoration(),
    this.inputFormatters,
    this.enabled = true,
    this.keyboardAppearance,
    @Deprecated('Use searchFieldInputDecoration of PickerDialogStyle instead')
    this.searchText = 'Search country',
    this.dropdownIconPosition = IconPosition.leading,
    this.dropdownIcon = const Icon(Icons.arrow_drop_down),
    this.autofocus = false,
    this.textInputAction,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.showCountryFlag = true,
    this.cursorColor,
    this.disableLengthCheck = false,
    this.flagsButtonPadding = EdgeInsets.zero,
    this.invalidNumberMessage = 'Invalid Mobile Number',
    this.cursorHeight,
    this.cursorRadius = Radius.zero,
    this.cursorWidth = 2.0,
    this.showCursor = true,
    this.pickerDialogStyle,
    this.flagsButtonMargin = EdgeInsets.zero,
    this.magnifierConfiguration,
  }) : super(key: key);

  @override
  State<IntlPhoneField> createState() => _IntlPhoneFieldState();
}

class _IntlPhoneFieldState extends State<IntlPhoneField> {
  late List<Country> _countryList;
  late Country _selectedCountry;
  late List<Country> filteredCountries;
  late String number;

  String? validatorMessage;

  @override
  void initState() {
    super.initState();
    _countryList = widget.countries ?? countries;
    filteredCountries = _countryList;
    number = widget.initialValue ?? '';
    if (widget.initialCountryCode == null && number.startsWith('+')) {
      number = number.substring(1);
      // parse initial value
      _selectedCountry = countries.firstWhere(
          (country) => number.startsWith(country.fullCountryCode),
          orElse: () => _countryList.first);

      // remove country code from the initial number value
      number = number.replaceFirst(
          RegExp("^${_selectedCountry.fullCountryCode}"), "");
    } else {
      _selectedCountry = _countryList.firstWhere(
          (item) => item.code == (widget.initialCountryCode ?? 'US'),
          orElse: () => _countryList.first);

      // remove country code from the initial number value
      if (number.startsWith('+')) {
        number = number.replaceFirst(
            RegExp("^\\+${_selectedCountry.fullCountryCode}"), "");
      } else {
        number = number.replaceFirst(
            RegExp("^${_selectedCountry.fullCountryCode}"), "");
      }
    }

    if (widget.autovalidateMode == AutovalidateMode.always) {
      final initialPhoneNumber = PhoneNumber(
        countryISOCode: _selectedCountry.code,
        countryCode: '+${_selectedCountry.dialCode}',
        number: widget.initialValue ?? '',
      );

      final value = widget.validator?.call(initialPhoneNumber);

      if (value is String) {
        validatorMessage = value;
      } else {
        (value as Future).then((msg) {
          validatorMessage = msg;
        });
      }
    }
  }

  Future<void> _changeCountry() async {
    filteredCountries = _countryList;
    await showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => StatefulBuilder(
        builder: (ctx, setState) => CountryPickerDialog(
          languageCode: widget.languageCode.toLowerCase(),
          style: widget.pickerDialogStyle,
          filteredCountries: filteredCountries,
          searchText: widget.searchText,
          countryList: _countryList,
          selectedCountry: _selectedCountry,
          onCountryChanged: (Country country) {
            _selectedCountry = country;
            widget.onCountryChanged?.call(country);
            setState(() {});
          },
        ),
      ),
    );
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow:
              MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? []
                  : [
                      BoxShadow(
                          color: ThemeColors.primary(context).withOpacity(0.1),
                          blurRadius: 25,
                          offset: const Offset(0, 4),
                          spreadRadius: 1)
                    ]),
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
        ],

        key: widget.formFieldKey,
        initialValue: (widget.controller == null) ? number : null,
        autofillHints: widget.disableAutoFillHints
            ? null
            : [AutofillHints.telephoneNumberNational],
        readOnly: widget.readOnly,
        obscureText: widget.obscureText,
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        cursorColor: widget.cursorColor,
        onTap: widget.onTap,
        controller: widget.controller,
        focusNode: widget.focusNode,

        cursorHeight: widget.cursorHeight,
        cursorRadius: widget.cursorRadius,
        cursorWidth: widget.cursorWidth,
        showCursor: widget.showCursor,
        onFieldSubmitted: widget.onSubmitted,
        magnifierConfiguration: widget.magnifierConfiguration,
        decoration: widget.decoration.copyWith(
          prefixIcon: _buildFlagsButton(),
          counterText: !widget.enabled ? '' : null,
        ),
        style: widget.style,
        onSaved: (value) {
          widget.onSaved?.call(
            PhoneNumber(
              countryISOCode: _selectedCountry.code,
              countryCode:
                  '+${_selectedCountry.dialCode}${_selectedCountry.regionCode}',
              number: value!,
            ),
          );
        },
        onChanged: (value) async {
          final phoneNumber = PhoneNumber(
            countryISOCode: _selectedCountry.code,
            countryCode: '+${_selectedCountry.fullCountryCode}',
            number: value,
          );

          if (widget.autovalidateMode != AutovalidateMode.disabled) {
            validatorMessage = await widget.validator?.call(phoneNumber);
          }

          widget.onChanged?.call(phoneNumber);
        },
        validator: (value) {
          if (value == null || !isNumeric(value)) return validatorMessage;
          if (!widget.disableLengthCheck) {
            return value.length >= _selectedCountry.minLength &&
                    value.length <= _selectedCountry.maxLength
                ? null
                : widget.invalidNumberMessage;
          }

          return validatorMessage;
        },
        //maxLength: widget.disableLengthCheck ? null : _selectedCountry.maxLength,
        keyboardType: widget.keyboardType,
        // inputFormatters: widget.inputFormatters,
        enabled: widget.enabled,
        keyboardAppearance: widget.keyboardAppearance,
        autofocus: widget.autofocus,
        textInputAction: widget.textInputAction,
        autovalidateMode: widget.autovalidateMode,
      ),
    );
  }

  Container _buildFlagsButton() {
    return Container(
      margin: widget.flagsButtonMargin,
      child: DecoratedBox(
        decoration: widget.dropdownDecoration,
        child: InkWell(
          borderRadius: widget.dropdownDecoration.borderRadius as BorderRadius?,
          onTap: widget.enabled ? _changeCountry : null,
          child: Padding(
            padding: widget.flagsButtonPadding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 20),
                if (widget.enabled &&
                    widget.showDropdownIcon &&
                    widget.dropdownIconPosition == IconPosition.leading) ...[
                  SvgPicture.asset(
                    ImageConstants.phone,
                  ),
                  const SizedBox(width: 8),
                ],
                // if (widget.showCountryFlag) ...[
                //   kIsWeb
                //       ? Image.asset(
                //           'assets/flags/${_selectedCountry.code.toLowerCase()}.png',
                //           package: 'intl_phone_field',
                //           width: 32,
                //         )
                //       : Text(
                //           _selectedCountry.flag,
                //           style: const TextStyle(fontSize: 18),
                //         ),
                //   const SizedBox(width: 8),
                // ],
                FittedBox(
                  child: Text('+${_selectedCountry.dialCode}',
                      style: TextStyleConstant.commonStyle(
                          color: ThemeColors.secondary(context),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          context: context)),
                ),

                // if (widget.enabled &&
                //     widget.showDropdownIcon &&
                //     widget.dropdownIconPosition == IconPosition.trailing) ...[
                //   const SizedBox(width: 4),
                //   widget.dropdownIcon,
                // ],
                const SizedBox(width: 12),
                Container(
                  width: 1,
                  height: 16,
                  color: ThemeColors.secondary(context),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum IconPosition {
  leading,
  trailing,
}

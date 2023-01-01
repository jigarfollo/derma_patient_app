import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/image_constants_utils.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/utils.dart';

class CommonTextFieldDecoration extends StatelessWidget {
  final Widget child;
  final BoxConstraints boxConstraints;

  const CommonTextFieldDecoration({Key key, this.child, this.boxConstraints}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: boxConstraints,
      // height: 47,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(69, 91, 99, 0.08),
            spreadRadius: 2,
            blurRadius: 30,
            offset: Offset(2, 10), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class FormLabel extends StatefulWidget {
  FormLabel({@required this.label});

  final String label;

  @override
  State<FormLabel> createState() => _FormLabelState();
}

class _FormLabelState extends State<FormLabel> {
  ThemeUtils theme = ThemeUtils();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.label,
            style: TextStyle(
              fontFamily: theme.poppinsSemibold,
              decoration: TextDecoration.underline,
              fontSize: 17,
              color: Color(0xff141414),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class TitleDecoration extends StatefulWidget {
  TitleDecoration({Key key, @required this.field, @required this.title}) : super(key: key);

  final String title;
  final Widget field;

  @override
  State<TitleDecoration> createState() => _TitleDecorationState();
}

class _TitleDecorationState extends State<TitleDecoration> {
  ThemeUtils theme = new ThemeUtils();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontFamily: theme.poppinsRegular,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: ColorUtils.headerColor,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 8),
        Container(
          height: 42,
          constraints: BoxConstraints(maxWidth: 250),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 0),
              ),
            ],
          ),
          padding: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: widget.field,
          ),
        )
      ],
    );
  }
}

class TextButtonWidget extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color fontColor;
  final double height;
  final double borderRadius;
  final double buttonWidth;
  final TextStyle style;

  const TextButtonWidget({
    Key key,
    @required this.title,
    @required this.onPressed,
    this.bgColor,
    this.fontColor,
    this.height = 36,
    this.borderRadius = 5,
    this.buttonWidth,
    this.style,
  }) : super(key: key);

  @override
  State<TextButtonWidget> createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
  ThemeUtils theme = ThemeUtils();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: widget.height,
      width: widget.buttonWidth ?? getSize(200),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(widget.bgColor ?? theme.themeBlue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.title,
          style: widget.style ??
              TextStyle(
                fontFamily: theme.poppinsRegular,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: widget.fontColor ?? Colors.white,
              ),
        ),
      ),
    );
  }
}

class DropDownWidget<T> extends StatefulWidget {
  const DropDownWidget({
    Key key,
    @required this.onChanged,
    @required this.value,
    @required this.items,
    @required this.hintText,
    this.validator,
    this.title,
    this.maxWidth = 400,
    this.readOnly = false,
  }) : super(key: key);

  final ValueChanged<T> onChanged;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final String hintText;
  final String Function(T) validator;
  final String title;
  final double maxWidth;
  final bool readOnly;

  @override
  State<DropDownWidget<T>> createState() => _DropDownWidgetState<T>();
}

class _DropDownWidgetState<T> extends State<DropDownWidget<T>> {
  ThemeUtils theme = ThemeUtils();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontFamily: theme.poppinsRegular,
            fontSize: getFontSize(12),
            fontWeight: FontWeight.w400,
            color: ColorUtils.greyTextColor,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 8),
        AbsorbPointer(
          absorbing: widget.readOnly,
          child: CommonTextFieldDecoration(
            boxConstraints: BoxConstraints(maxWidth: widget.maxWidth),
            child: DropdownButtonFormField<T>(
              focusColor: Colors.white,
              validator: widget.validator,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(222, 222, 223, 1))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(222, 222, 223, 1))),
                fillColor: widget.readOnly ? Colors.grey.shade200 : Colors.white,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(222, 222, 223, 1))),
              ),
              value: widget.value,
              icon: Icon(Icons.arrow_drop_down, color: ColorUtils.greyButtonColor),
              iconSize: 24,
              elevation: 16,
              isExpanded: true,
              hint: Text(widget.hintText),
              style: TextStyle(color: ColorUtils.headerColor),
              onChanged: widget.onChanged,
              items: widget.items,
            ),
          ),
        ),
      ],
    );
  }
}

class CountryPickerTextField extends StatelessWidget {
  final TextEditingController controller;
  final String Function(String) validator;
  final ValueChanged<String> onChanged;
  final ValueChanged<Country> onValuePicked;
  final Widget suffixIcon;
  final String labelText;
  final double maxWidth;
  const CountryPickerTextField({
    Key key,
    this.controller,
    this.validator,
    this.onChanged,
    @required this.onValuePicked,
    this.suffixIcon,
    this.labelText,
    this.maxWidth = 330,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 30,
            offset: Offset(2, 10),
          ),
        ],
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        readOnly: false,
        onChanged: onChanged,
        maxLength: 10,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          prefixIcon: Container(
            child: CountryPickerDropdown(
              initialValue: 'IN',
              itemBuilder: (country) {
                return Container(
                  width: 300,
                  child: Row(
                    children: <Widget>[
                      CountryPickerUtils.getDefaultFlagImage(country),
                      SizedBox(width: 8.0),
                      Text("+${country.phoneCode}(${country.isoCode})"),
                    ],
                  ),
                );
              },
              iconEnabledColor: Colors.grey,
              selectedItemBuilder: (Country country) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Container(child: Text("+ " + country.phoneCode)),
                  ),
                );
              },
              itemFilter: null,
              priorityList: [
                CountryPickerUtils.getCountryByIsoCode('IN'),
                CountryPickerUtils.getCountryByIsoCode('US'),
              ],
              sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
              onValuePicked: onValuePicked,
            ),
          ),
          filled: true,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          fillColor: Colors.white,
          counterText: '',
          border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(222, 222, 223, 1))),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: labelText,
          labelStyle: TextStyle(color: ColorUtils.hintTextColor, fontSize: 14, fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(222, 222, 223, 1))),
        ),
      ),
    );
  }
}

class CommonTextField extends StatefulWidget {
  const CommonTextField(
      {Key key,
      this.controller,
      this.validator,
      this.onChanged,
      @required this.labelText,
      @required this.title,
      this.inputFormatters,
      this.onFieldSubmitted,
      this.maxWidth = 230,
      this.textInputAction = TextInputAction.done,
      this.textInputType = TextInputType.text,
      this.maxLength,
      this.readOnly = false})
      : super(key: key);

  final String labelText;
  final String title;
  final TextEditingController controller;
  final String Function(String) validator;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onFieldSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final double maxWidth;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final int maxLength;
  final bool readOnly;
  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  ThemeUtils theme = ThemeUtils();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontFamily: theme.poppinsRegular,
            fontSize: getFontSize(12),
            fontWeight: FontWeight.w400,
            color: ColorUtils.greyTextColor,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 8),
        AbsorbPointer(
          absorbing: widget.readOnly,
          child: CommonTextFieldDecoration(
            boxConstraints: BoxConstraints(maxWidth: widget.maxWidth),
            child: TextFormField(
              onChanged: widget.onChanged,
              onFieldSubmitted: widget.onFieldSubmitted,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.validator,
              controller: widget.controller,
              textAlign: TextAlign.start,
              inputFormatters: widget.inputFormatters,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
              maxLength: widget.maxLength,
              readOnly: widget.readOnly,
              style: TextStyle(
                fontFamily: theme.poppinsSemibold,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                fillColor: widget.readOnly ? Colors.grey.shade200 : Colors.white,
                counterText: '',
                border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(222, 222, 223, 1))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(222, 222, 223, 1))),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: widget.labelText,
                labelStyle: TextStyle(
                  fontFamily: theme.poppinsRegular,
                  color: ColorUtils.hintTextColor,
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(222, 222, 223, 1))),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CommonTextFieldWithIcon extends StatefulWidget {
  const CommonTextFieldWithIcon({
    Key key,
    this.controller,
    this.validator,
    this.onChanged,
    @required this.labelText,
    @required this.title,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.maxWidth = 230,
    this.iconText,
    this.readOnly = false,
    this.enabled = false,
  }) : super(key: key);
  final bool readOnly, enabled;
  final String labelText, iconText;
  final String title;
  final TextEditingController controller;
  final String Function(String) validator;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onFieldSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final double maxWidth;

  @override
  State<CommonTextFieldWithIcon> createState() => _CommonTextFieldWithIconState();
}

class _CommonTextFieldWithIconState extends State<CommonTextFieldWithIcon> {
  ThemeUtils theme = ThemeUtils();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontFamily: theme.poppinsMedium,
            fontSize: getFontSize(12),
            fontWeight: FontWeight.w400,
            color: ColorUtils.headerColor,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 8),
        CommonTextFieldDecoration(
          boxConstraints: BoxConstraints(maxWidth: widget.maxWidth, maxHeight: 45),
          child: TextFormField(
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            controller: widget.controller,
            textAlign: TextAlign.start,
            inputFormatters: widget.inputFormatters,
            readOnly: widget.readOnly, //enabled: widget.enabled,
            decoration: InputDecoration(
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              fillColor: Colors.white,
              counterText: '',
              suffixIcon: Image.asset(widget.iconText, width: 20),
              border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(222, 222, 223, 1))),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(222, 222, 223, 1))),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: widget.labelText,
              labelStyle: TextStyle(color: ColorUtils.hintTextColor, fontSize: 14, fontWeight: FontWeight.w400),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(222, 222, 223, 1))),
            ),
          ),
        ),
      ],
    );
  }
}

class DialogHeader extends StatefulWidget {
  final String title;
  final bool closeIcon;
  final double fontSize;
  DialogHeader({@required this.title, this.closeIcon = false, this.fontSize = 20});

  @override
  State<DialogHeader> createState() => _DialogHeaderState();
}

class _DialogHeaderState extends State<DialogHeader> {
  ThemeUtils theme = ThemeUtils();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      decoration: BoxDecoration(
        color: ColorUtils.primaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(flex: 1),
          Flexible(
            flex: 5,
            child: Align(
              child: Text(
                widget.title,
                style: TextStyle(fontSize: widget.fontSize, color: Colors.white, fontFamily: theme.poppinsSemibold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Visibility(
              visible: widget.closeIcon,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  splashRadius: 20,
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UserChoiceTile extends StatefulWidget {
  const UserChoiceTile({Key key, @required this.name, this.isSelected, this.onTap, this.editOnTap, this.editForm, this.cancelOnTap, this.isExpanded = false})
      : super(key: key);

  final String name;
  final bool isSelected, isExpanded;
  final VoidCallback onTap;
  final VoidCallback editOnTap;
  final VoidCallback cancelOnTap;
  final Widget editForm;
  @override
  State<UserChoiceTile> createState() => _UserChoiceTileState();
}

class _UserChoiceTileState extends State<UserChoiceTile> {
  ThemeUtils theme = ThemeUtils();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: widget.isSelected ? theme.themeBlue : Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  spreadRadius: 3,
                  blurRadius: 10,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.name,
                    style: TextStyle(color: widget.isSelected ? Colors.white : Colors.black, fontSize: 17, fontFamily: theme.poppinsMedium),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: widget.isExpanded ? widget.cancelOnTap : widget.editOnTap,
                      child: Text(
                        widget.isExpanded ? 'Cancel edit' : 'Edit details',
                        style: TextStyle(color: ColorUtils.yellowTextColor, fontSize: 14, fontFamily: theme.poppinsSemibold),
                      ),
                    ),
                    Visibility(
                        visible: widget.isSelected,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(ImageConstants.select, height: 24, width: 24, fit: BoxFit.contain),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: widget.isExpanded,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  spreadRadius: 3,
                  blurRadius: 10,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            child: widget.editForm,
          ),
        ),
      ],
    );
  }
}

class DetailTile extends StatelessWidget {
  final String title;
  final String detail;
  const DetailTile({
    Key key,
    @required this.title,
    @required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeUtils theme = new ThemeUtils();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 10, color: Color(0xff96a2b3))),
        SizedBox(height: 2),
        Text(detail,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: theme.poppinsMedium,
            )),
        SizedBox(height: 20)
      ],
    );
  }
}

class DataRowWidget extends StatefulWidget {
  DataRowWidget({
    Key key,
    @required this.title,
    @required this.value,
    this.fontColor,
  }) : super(key: key);

  final String title;
  final String value;
  final Color fontColor;

  @override
  State<DataRowWidget> createState() => _DataRowWidgetState();
}

class _DataRowWidgetState extends State<DataRowWidget> {
  ThemeUtils theme = ThemeUtils();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Text(
              '${widget.title}: ',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: Colors.white, fontFamily: theme.poppinsRegular),
            ),
          ),
          Expanded(
            flex: 10,
            child: Text(
              widget.value.isEmpty ? '-' : widget.value,
              // maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, color: widget.fontColor == null ? Colors.white : widget.fontColor, fontFamily: theme.poppinsRegular),
            ),
          ),
        ],
      ),
    );
  }
}

class RegistrationDetailHeader extends StatefulWidget {
  const RegistrationDetailHeader({
    Key key,
    @required this.name,
    @required this.clinicName,
    @required this.degree,
    @required this.profileUrl,
  }) : super(key: key);

  final String name;
  final String clinicName;
  final String degree;
  final String profileUrl;

  @override
  State<RegistrationDetailHeader> createState() => _RegistrationDetailHeaderState();
}

class _RegistrationDetailHeaderState extends State<RegistrationDetailHeader> {
  ThemeUtils theme = ThemeUtils();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenHeight(context) * 0.23,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: ColorUtils.primaryColor,
          ),
        ),
        Image.asset(
          ImageConstants.backgroundMask1,
          height: screenHeight(context) * 0.22,
          width: screenWidth(context),
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.only(left: getSize(26), right: getSize(18), top: getSize(18), bottom: getSize(18)),
          height: screenHeight(context) * 0.22,
          child: Column(
            children: [
              SizedBox(
                height: getSize(26),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: getSize(22),
                        color: Colors.white,
                      ),
                      constraints: BoxConstraints(),
                    ),
                  ),
                  Text(
                    'Appointment Registration',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: theme.poppinsBold,
                      fontSize: getFontSize(16),
                      color: ColorUtils.secondaryColor,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    width: getSize(46),
                  )
                ],
              ),
              SizedBox(height: getSize(16)),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CircleAvatar(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.grey.shade300,
                          radius: getSize(34),
                          child: widget.profileUrl.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.profileUrl,
                                    height: getSize(66),
                                    width: getSize(66),
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Center(child: CupertinoActivityIndicator()),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                )
                              : Icon(Icons.person, color: Colors.white, size: getSize(34)),
                        ),
                        SizedBox(width: getSize(16)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                Utils.appName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: theme.poppinsSemibold,
                                  fontSize: getSize(16),
                                  fontWeight: FontWeight.w900,
                                  color: ColorUtils.yellowTextColor,
                                ),
                              ),
                              SizedBox(
                                height: getSize(6),
                              ),
                              Text(
                                widget.name,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: TextStyle(
                                  fontFamily: theme.poppinsRegular,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: getSize(6),
                              ),
                              Text(
                                widget.degree,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: TextStyle(
                                  fontFamily: theme.poppinsRegular,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

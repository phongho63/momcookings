import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart' as MyFormat;
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';
import 'package:geocoding/geocoding.dart' as GeoCoding;
import '../assets/icon_assets.dart';
import 'constants.dart';
import 'global.dart';

String formattedDate(String? formattedString, String dateFormat) {
  if (formattedString == null || formattedString == "") return "";

  DateTime? tempDate = DateTime.tryParse(formattedString);
  if (tempDate != null) {
    return MyFormat.DateFormat(dateFormat).format(tempDate.toLocal());
  }

  return MyFormat.DateFormat(dateFormat).format(DateTime.now().toLocal());
}

String getRandomString(int length) {
  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}

String formattedMoney(double? currentAmount, [String? currency = '₫']) {
  double amount = currentAmount ?? 0;
  final currencyFormatter = MyFormat.NumberFormat('#,##0.##');
  String formatedMoney = currencyFormatter.format(amount);

  String currencyString =
  (currency != null || currency != "") ? " $currency" : "";
  String formatedString = '$formatedMoney$currencyString';
  return formatedString;
}

Widget getNetworkImage(String? imageKey,
    {String? accessToken, String? customUrlPath, double? width}) {
  if (imageKey == null || imageKey.trim().isEmpty) {
    return Container();
  }
  String accessTokenString = accessToken ?? "";
  String imagePath = imageKey ?? "";
  String currentPath = "$customUrlPath$imageKey";
  if (customUrlPath == null) {
    if (width != null) {
      width = width * IMAGE_WIDTH_RATIO;
    }
    //currentPath = Global.convertMedia(imagePath, width?.round());
  }

  return FadeInImage(
      fit: BoxFit.cover,
      placeholder: const AssetImage(IconAssets.icLoading),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset(IconAssets.icWhite, fit: BoxFit.cover);
      },
      image: accessTokenString.isEmpty
          ? NetworkImage(currentPath)
          : NetworkImage(currentPath,
          headers: {"Authorization": "Bearer " + accessTokenString}));
}

// String getNetworkVideo(String url) {
//   if (url.isEmpty) return '';
//   return Global.convertVideoPath(url);
// }

String toCurrency(double? value) {
  if (value == null) return "0 VNĐ";
  return MyFormat.NumberFormat.currency(locale: 'vi')
      .format(value)
      .replaceAll(".", ",")
      .replaceAll("D", "Đ")
      .replaceAll("d", "đ");
}

/// EmailAddress separation method
String toDisplayEmail(String inputEmail) {
  int position = inputEmail.indexOf('@');
  String email = inputEmail.substring(0, position);
  String displayEmail = inputEmail.substring(position, inputEmail.length);
  String firstEmail = inputEmail.substring(0, 3);
  if (email.length <= 3) {
    return email + displayEmail;
  } else {
    return firstEmail + "***" + displayEmail;
  }
}

Future<String?> deviceIpAddress() async {
  for (var interface in await NetworkInterface.list()) {
    debugPrint('== Interface: ${interface.name} ==');
    for (var addr in interface.addresses) {
      debugPrint(
          '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
    }
    if (interface.addresses.isNotEmpty) {
      return interface.addresses[0].address;
    } else {
      return "";
    }
  }
  return null;
}

/// Display phone number with +84762***965
String toDisplaySizeUpPhoneNumber(String? inputPhoneNumber) {
  String displayNumber = "";
  if (inputPhoneNumber == null) return "";
  if (inputPhoneNumber.isEmpty || inputPhoneNumber.length < 6) {
    return inputPhoneNumber;
  }
  if (inputPhoneNumber.length == 10) {
    if (inputPhoneNumber.substring(0, 1) == "0") {
      String phoneNumber =
      inputPhoneNumber.substring(1, inputPhoneNumber.length);
      displayNumber = phoneNumber.replaceRange(2, 6, "****");
    } else {
      displayNumber = inputPhoneNumber.replaceRange(2, 7, "****");
    }
  } else {
    displayNumber = inputPhoneNumber.replaceRange(2, 6, "****");
  }
  return displayNumber;
}

/// Display phone number with ***
String toDisplayPhoneNumber(String? inputPhoneNumber) {
  String displayNumber = "";
  if (inputPhoneNumber == null) return "";
  if (inputPhoneNumber.isEmpty || inputPhoneNumber.length < 6) {
    return inputPhoneNumber;
  }
  if (inputPhoneNumber.length == 10) {
    if (inputPhoneNumber.substring(0, 1) == "0") {
      String phoneNumber =
      inputPhoneNumber.substring(1, inputPhoneNumber.length);
      displayNumber = phoneNumber.replaceRange(1, 5, " *** ");
    } else {
      displayNumber = inputPhoneNumber.replaceRange(1, 6, " *** ");
    }
  } else {
    displayNumber = inputPhoneNumber.replaceRange(1, 5, " *** ");
  }
  return displayNumber;
}

/// Condition to check the email address
bool checkEmailAddress(String newEmail) {
  if (newEmail.isNotEmpty) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(newEmail);
  }
  return false;
}

Future<ui.Image> loadUiImage(String assetPath) async {
  final data = await rootBundle.load(assetPath);
  final list = Uint8List.view(data.buffer);
  final completer = Completer<ui.Image>();
  ui.decodeImageFromList(list, completer.complete);
  return completer.future;
}

Future<ui.Image> loadUiImageFromLocalStorage(String filePath) async {
  final data = File(filePath);
  final list = data.readAsBytesSync();
  final completer = Completer<ui.Image>();
  ui.decodeImageFromList(list, completer.complete);
  return completer.future;
}

/// Display full phone number
String toDisplayFullPhoneNumber(String? inputPhoneNumber) {
  if (inputPhoneNumber == null) return "";
  if (inputPhoneNumber.isEmpty || inputPhoneNumber.length < 9) {
    return inputPhoneNumber;
  }
  if (inputPhoneNumber.length == 10) {
    if (inputPhoneNumber.substring(0, 1) == "0") {
      String phoneNumber =
      inputPhoneNumber.substring(1, inputPhoneNumber.length);

      String displayNumber1 = phoneNumber.substring(0, 2);
      String displayNumber2 = phoneNumber.substring(2, 5);
      String displayNumber3 = phoneNumber.substring(5, 9);

      return displayNumber1 + " " + displayNumber2 + " " + displayNumber3;
    } else {
      String displayNumber1 = inputPhoneNumber.substring(0, 3);
      String displayNumber2 = inputPhoneNumber.substring(3, 6);
      String displayNumber3 = inputPhoneNumber.substring(6, 10);

      return displayNumber1 + " " + displayNumber2 + " " + displayNumber3;
    }
  } else {
    String displayNumber1 = inputPhoneNumber.substring(0, 2);
    String displayNumber2 = inputPhoneNumber.substring(2, 5);
    String displayNumber3 = inputPhoneNumber.substring(5);

    return displayNumber1 + " " + displayNumber2 + " " + displayNumber3;
  }
}

///
String removeZeroAtFirstDigitPhoneNumber(String inputPhoneNumber) {
  if (inputPhoneNumber.startsWith("0")) {
    return inputPhoneNumber.substring(1, inputPhoneNumber.length);
  }
  return inputPhoneNumber;
}

/// stat reduction by 0.8
double toSize(double size) {
  return size * 0.95;
}

/// format date time to 'HH:mm, dd/MM/yyyy'
String formatDateTime(String dateTime) {
  return MyFormat.DateFormat(dateTimeFormat)
      .format(DateTime.parse((dateTime)).toLocal());
}

String formatTimeToHour(DateTime time) {
  return MyFormat.DateFormat('HH:mm').format(time.toLocal());
}

// calculate days between 2 date
int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

String getAddressFromPlace(GeoCoding.Placemark place) {
  return ((place.street.toString().isNotEmpty)
      ? '${place.street.toString()}, '
      : '') +
      ((place.subLocality.toString().isNotEmpty)
          ? '${place.subLocality.toString()}, '
          : '') +
      ((place.locality.toString().isNotEmpty)
          ? '${place.locality.toString()}, '
          : '') +
      ((place.subAdministrativeArea.toString().isNotEmpty)
          ? '${place.subAdministrativeArea.toString()}, '
          : '') +
      ((place.postalCode.toString().isNotEmpty)
          ? '${place.postalCode.toString()}, '
          : '') +
      ((place.country.toString().isNotEmpty) ? place.country.toString() : '');
}

List<String> getListAddressFromPlace(GeoCoding.Placemark place) {
  List<String> listAddress = [];
  if (place.street.toString().isNotEmpty)
    listAddress.add(place.street.toString());
  if (place.subLocality.toString().isNotEmpty)
    listAddress.add(place.subLocality.toString());
  if (place.locality.toString().isNotEmpty)
    listAddress.add(place.locality.toString());
  if (place.subAdministrativeArea.toString().isNotEmpty)
    listAddress.add(place.subAdministrativeArea.toString());
  if (place.postalCode.toString().isNotEmpty)
    listAddress.add(place.postalCode.toString());
  if (place.country.toString().isNotEmpty)
    listAddress.add(place.country.toString());
  return listAddress;
}

/// calculate Distance
double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
  double R = 6371000;
  double dLat = (lat2 - lat1) * (pi / 180);
  double dLon = (lng2 - lng1) * (pi / 180);
  double la1ToRad = lat1 * (pi / 180);
  double la2ToRad = lat2 * (pi / 180);
  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(la1ToRad) * cos(la2ToRad) * sin(dLon / 2) * sin(dLon / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  double d = R * c;
  return (d / 1000);
}

String accentParser(String text) {
  const String _vietnamese = 'aAeEoOuUiIdDyY';
  final _vietnameseRegex = <RegExp>[
    RegExp(r'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'),
    RegExp(r'À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ'),
    RegExp(r'è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ'),
    RegExp(r'È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ'),
    RegExp(r'ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ'),
    RegExp(r'Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ'),
    RegExp(r'ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ'),
    RegExp(r'Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ'),
    RegExp(r'ì|í|ị|ỉ|ĩ'),
    RegExp(r'Ì|Í|Ị|Ỉ|Ĩ'),
    RegExp(r'đ'),
    RegExp(r'Đ'),
    RegExp(r'ỳ|ý|ỵ|ỷ|ỹ'),
    RegExp(r'Ỳ|Ý|Ỵ|Ỷ|Ỹ')
  ];
  String result = text;
  for (var i = 0; i < _vietnamese.length; ++i) {
    result = result.replaceAll(_vietnameseRegex[i], _vietnamese[i]);
  }
  return result;
}

final RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

/// open google map when click
Future<void> openMap(double latitude, double longitude) async {
  String googleUrl =
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
  } else {
    throw 'Could not open the map.';
  }
}

String splitStringLeft(String input) {
  if (input.contains('-') == false) {
    return input;
  }
  int index = input.indexOf('-');
  String part1 = input.substring(0, index);
  return part1;
}

String splitStringRight(String input) {
  if (input.contains('-') == false) {
    return "";
  }
  int index = input.indexOf('-');
  String part2 = input.substring(index + 1);
  return part2;
}

final RegExp detectedHyperlink = RegExp(
    r"http[s]?://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}(:[0-9]+)?(/[a-zA-Z0-9&%_./-~-]*)?");

Widget getImageNetwork(String path) {
  return Image.network(
    path,
    headers: {
      "Authorization": "Bearer " + Global.mToken,
    },
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) return child;
      return Image.asset(IconAssets.icLoading);
    },
    errorBuilder: (context, object, stackTrace) {
      return Image.asset(IconAssets.icWhite, fit: BoxFit.cover);
    },
  );
}

bool isExceeds10Lines(String text, double maxWidth) {
  final textSpan = TextSpan(text: text);

  final textPainter = TextPainter(
    text: textSpan,
    textDirection: TextDirection.ltr,
    maxLines: 10,
    ellipsis: '...',
  );
  textPainter.layout(maxWidth: maxWidth);

  return textPainter.didExceedMaxLines;
}

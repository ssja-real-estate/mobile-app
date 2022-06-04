import 'package:flutter/material.dart';

class MapResources {
  static const openStreetAddress =
      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";
  static const noGpsService = "سرویس مکان یابی برای شما فعال نشده است";
  static const permanentlyDenied =
      "تا زمانی که مجوز استفاده از موقعیت مکانی را ندهید سرویس دریافت موقعیت کار نخواهد کرد";
  static const errorTracking =
      "خطا در مسیریابی ، لطفا از فعال بودن سرویس مکان یابی اطمینان حاصل کنید";
}

class MapIcons {
  static const gpsIcon = Icons.gps_fixed_outlined;
  static const gpsIconTracking = Icons.gps_not_fixed_outlined;
}

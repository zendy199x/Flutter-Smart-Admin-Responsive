import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:smart_admin/core/constants/color_constants.dart';

class DailyInfoModel {
  IconData? icon;
  String? title;
  String? totalStorage;
  int? volumeData;
  int? percentage;
  Color? color;
  List<Color>? colors;
  List<FlSpot>? spots;

  DailyInfoModel({
    this.icon,
    this.title,
    this.totalStorage,
    this.volumeData,
    this.percentage,
    this.color,
    this.colors,
    this.spots,
  });

  DailyInfoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    volumeData = json['volumeData'];
    icon = json['icon'];
    totalStorage = json['totalStorage'];
    color = json['color'];
    percentage = json['percentage'];
    colors = json['colors'];
    spots = json['spots'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['volumeData'] = volumeData;
    data['icon'] = icon;
    data['totalStorage'] = totalStorage;
    data['color'] = color;
    data['percentage'] = percentage;
    data['colors'] = colors;
    data['spots'] = spots;
    return data;
  }
}

List<DailyInfoModel> dailyDatas =
    dailyData.map((item) => DailyInfoModel.fromJson(item)).toList();

final dailyData = [
  {
    "title": "Employee",
    "volumeData": 1328,
    "icon": FlutterIcons.user_alt_faw5s,
    "totalStorage": "+ %20",
    "color": primaryColor,
    "percentage": 35,
    "colors": const [
      Color(0xff23b6e6),
      Color(0xff02d39a),
    ],
    "spots": [
      FlSpot(
        1,
        2,
      ),
      FlSpot(
        2,
        1.0,
      ),
      FlSpot(
        3,
        1.8,
      ),
      FlSpot(
        4,
        1.5,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        2.2,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1.5,
      )
    ]
  },
  {
    "title": "On Leave",
    "volumeData": 1328,
    "icon": FlutterIcons.message1_ant,
    "totalStorage": "+ %5",
    "color": const Color(0xFFFFA113),
    "percentage": 35,
    "colors": const [
      Color(0xfff12711),
      Color(0xfff5af19),
    ],
    "spots": [
      FlSpot(
        1,
        1.3,
      ),
      FlSpot(
        2,
        1.0,
      ),
      FlSpot(
        3,
        4,
      ),
      FlSpot(
        4,
        1.5,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        3,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1.5,
      )
    ]
  },
  {
    "title": "Onboarding",
    "volumeData": 1328,
    "icon": FlutterIcons.comment_alt_faw5s,
    "totalStorage": "+ %8",
    "color": const Color(0xFFA4CDFF),
    "percentage": 10,
    "colors": const [
      Color(0xff2980B9),
      Color(0xff6DD5FA),
    ],
    "spots": [
      FlSpot(
        1,
        1.3,
      ),
      FlSpot(
        2,
        5,
      ),
      FlSpot(
        3,
        1.8,
      ),
      FlSpot(
        4,
        6,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        2.2,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1,
      )
    ]
  },
  {
    "title": "Open Position",
    "volumeData": 1328,
    "icon": FlutterIcons.heart_faw5s,
    "totalStorage": "+ %8",
    "color": const Color(0xFFd50000),
    "percentage": 10,
    "colors": const [
      Color(0xff93291E),
      Color(0xffED213A),
    ],
    "spots": [
      FlSpot(
        1,
        3,
      ),
      FlSpot(
        2,
        4,
      ),
      FlSpot(
        3,
        1.8,
      ),
      FlSpot(
        4,
        1.5,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        2.2,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1.5,
      )
    ]
  },
  {
    "title": "Efficiency",
    "volumeData": 5328,
    "icon": FlutterIcons.bell_faw5s,
    "totalStorage": "- %5",
    "color": const Color(0xFF00F260),
    "percentage": 78,
    "colors": const [
      Color(0xff0575E6),
      Color(0xff00F260),
    ],
    "spots": [
      FlSpot(
        1,
        1.3,
      ),
      FlSpot(
        2,
        1.0,
      ),
      FlSpot(
        3,
        1.8,
      ),
      FlSpot(
        4,
        1.5,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        2.2,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1.5,
      )
    ]
  }
];

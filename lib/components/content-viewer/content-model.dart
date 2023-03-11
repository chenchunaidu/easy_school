import 'package:easy_school/components/content-viewer/content-block-model.dart';
import 'package:easy_school/components/content/block-model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'content-model.g.dart';

@JsonSerializable()
class ContentViewerModel {
  final List<ContentBlockModel> blocks;
  ContentViewerModel({required this.blocks});

  factory ContentViewerModel.fromJson(Map<String, dynamic> json) =>
      _$ContentViewerModelFromJson(json);
}

import 'package:easy_school/components/common/image-upload-model.dart';
import 'package:easy_school/components/common/image-upload.dart';
import 'package:easy_school/components/common/image/image.dart';
import 'package:easy_school/components/common/typography/index.dart';
import 'package:easy_school/components/content-viewer/list-item.dart';
import 'package:easy_school/components/content/custom-editable-text.dart';
import 'package:easy_school/components/content/list-item-editable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import '../content/block-model.dart';
import '../content/custom-editable-text-model.dart';
part 'content-block-model.g.dart';

@JsonSerializable()
class ContentBlockModel {
  final BlockTypes blockType;
  final Map<String, dynamic> blockProps;

  ContentBlockModel({required this.blockType, required this.blockProps});

  Widget? getBlock() {
    if (blockType == BlockTypes.text) {
      CustomEditableTextModel props =
          CustomEditableTextModel.fromJson(blockProps);
      return CustomTypography(props.text ?? "", as: props.typography);
    } else if (blockType == BlockTypes.image) {
      return CustomImage(
          image: NetworkImage(
              ImageUploadModel.fromJson(blockProps).imageUrl ?? ""));
    } else if (blockType == BlockTypes.listItem) {
      CustomEditableTextModel props =
          CustomEditableTextModel.fromJson(blockProps);
      return ListItem(
        text: props.text,
      );
    }
    return null;
  }

  factory ContentBlockModel.fromJson(Map<String, dynamic> json) =>
      _$ContentBlockModelFromJson(json);
}

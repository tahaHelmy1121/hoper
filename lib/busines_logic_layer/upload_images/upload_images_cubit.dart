import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';

import '../../data_layer/model/upload_images/upload_images_model.dart';
import '../../data_layer/repo/upload_images_repo.dart';
part 'upload_images_state.dart';

class UploadImagesCubit extends Cubit<UploadImagesState> {
  UploadImagesCubit() : super(UploadImagesInitial());


  }


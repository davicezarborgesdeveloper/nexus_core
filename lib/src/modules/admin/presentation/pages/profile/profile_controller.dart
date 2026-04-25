import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../domain/usecases/get_admin_usecase.dart';
import 'profile_state.dart';

class ProfileController extends ValueNotifier<ProfileState> {
  final IGetAdminUsecase _usecase;

  ProfileController(this._usecase) : super(const ProfileInitial());

  /// CONTROLLERS DO FORM
  final nameController = TextEditingController();
  final titleController = TextEditingController();
  final taglineController = TextEditingController();
  final descriptionController = TextEditingController();

  final githubController = TextEditingController();
  final linkedinController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();

  bool available = true;

  /// LOAD INICIAL
  Future<void> load() async {
    value = const ProfileLoading();

    // final result = await _usecase();

    // result.fold(
    //   (error) {
    //     value = ProfileError(error.message);
    //   },
    //   (admin) {
    //     nameController.text = admin.name ?? '';
    //     titleController.text = admin.title ?? '';
    //     taglineController.text = admin.tagline ?? '';
    //     descriptionController.text = admin.description ?? '';
    //     githubController.text = admin.github ?? '';
    //     linkedinController.text = admin.linkedin ?? '';
    //     emailController.text = admin.email ?? '';
    //     locationController.text = admin.location ?? '';
    //     available = admin.available ?? true;

    //     value = const ProfileLoaded();
    //   },
    // );
  }

  /// SAVE
  Map<String, dynamic> get formData => {
    'name': nameController.text,
    'title': titleController.text,
    'tagline': taglineController.text,
    'description': descriptionController.text,
    'github': githubController.text,
    'linkedin': linkedinController.text,
    'email': emailController.text,
    'location': locationController.text,
    'available': available,
  };

  /// RESET
  void reset() {
    nameController.clear();
    titleController.clear();
    taglineController.clear();
    descriptionController.clear();
    githubController.clear();
    linkedinController.clear();
    emailController.clear();
    locationController.clear();
    available = true;

    value = const ProfileInitial();
  }

  @override
  void dispose() {
    nameController.dispose();
    titleController.dispose();
    taglineController.dispose();
    descriptionController.dispose();
    githubController.dispose();
    linkedinController.dispose();
    emailController.dispose();
    locationController.dispose();
    super.dispose();
  }
}

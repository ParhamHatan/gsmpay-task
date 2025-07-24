import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsm_pay_task/views/extensions/app_theme_context_extension.dart';
import 'package:gsm_pay_task/views/extensions/typography_context_extension.dart';
import 'package:gsm_pay_task/views/widgets/custom_filled_loading_button.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({
    required this.title,
    required this.isLoading,
    required this.image,
    required this.imageId,
    required this.onPressed,
    required this.onRemove,
    super.key,
  });

  final String title;
  final bool isLoading;
  final XFile? image;
  final String? imageId;
  final VoidCallback onPressed;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.appTheme.borderColor,
        ),
        borderRadius: BorderRadius.circular(8),
        color: context.appTheme.bodyBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: context.typography.textField.copyWith(
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          if (imageId != null)
            Column(
              children: [
                Image.asset(
                  image!.path,
                  width: Get.width,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: onRemove,
                      icon: Icon(
                        IconsaxPlusLinear.trash_square,
                        color: context.appTheme.negetiveColor,
                        size: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      imageId!,
                      style: context.typography.description,
                    ),
                  ],
                ),
              ],
            )
          else
            CustomFilledLoadingButton(
              title: 'انتخاب از گالری',
              onPressed: onPressed,
              isLoading: isLoading,
            ),
        ],
      ),
    );
  }
}

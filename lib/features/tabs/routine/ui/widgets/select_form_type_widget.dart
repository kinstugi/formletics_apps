import 'package:flutter/material.dart';

enum FormType { photoUpload, bodyMeasurement }

class SelectFormTypeWidget extends StatelessWidget {
  final void Function(FormType) onChange;
  final FormType formType;

  const SelectFormTypeWidget({
    this.onChange,
    this.formType = FormType.bodyMeasurement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(
            "Select Form Type",
            style: Theme.of(context).textTheme.subtitle2.copyWith(),
          ),
          Expanded(child: Container()),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio(
                groupValue: formType,
                value: FormType.bodyMeasurement,
                onChanged: onChange,
              ),
              const SizedBox(width: 1),
              const Text("Body Measurement"),
            ],
          ),
          const SizedBox(width: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio(
                groupValue: formType,
                value: FormType.photoUpload,
                onChanged: onChange,
              ),
              const SizedBox(width: 1),
              const Text("Phot Upload"),
            ],
          )
        ],
      ),
    );
  }
}

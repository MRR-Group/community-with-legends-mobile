import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/hardware_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';

class HardwareComponent extends StatefulWidget {
  final Hardware hardwareItem;

  const HardwareComponent({
    super.key,
    required this.hardwareItem,
  });

  @override
  State<StatefulWidget> createState() => _HardwareComponentState();
}

class _HardwareComponentState extends State<HardwareComponent> {
  late final TextEditingController titleController;
  late final TextEditingController valueController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    valueController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    valueController.dispose();
    super.dispose();
  }

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: isEditing
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    TextInputField(
                      hint: widget.hardwareItem.title,
                      text: 'Component',
                      controller: titleController,
                      fillColor: backgroundColor,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check,
                            color: textColor,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isEditing = false;
                              });
                            },
                            child: const Icon(
                              Icons.close,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextInputField(
                    hint: widget.hardwareItem.value,
                    controller: valueController,
                    fillColor: backgroundColor,
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.hardwareItem.title,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isEditing = true;
                        });
                      },
                      child: const Icon(
                        Icons.edit,
                        color: textColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.delete_outline,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.hardwareItem.value,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
    );
  }
}

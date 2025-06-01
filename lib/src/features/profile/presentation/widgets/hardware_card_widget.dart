import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/hardware_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/profile_card_widget.dart';
import 'package:flutter/material.dart';

class HardwareCard extends StatelessWidget {
  final List<Hardware> hardware;

  const HardwareCard({
    super.key,
    required this.hardware,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    if(hardware.isEmpty){
      return Container();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      width: 500,
      alignment: Alignment.topCenter,
      child: ProfileCard(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: Text(
                    localizations.profile_hardware,
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: hardware.map((item) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                        ),
                        Text(
                          item.value,
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

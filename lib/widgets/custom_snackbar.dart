import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app_alpian/utils/constants.dart';

class CustomSnackbar extends StatefulWidget {
  final bool isVisible;
  final String? errorMessage;
  const CustomSnackbar(
      {Key? key, required this.isVisible, required this.errorMessage})
      : super(key: key);

  @override
  State<CustomSnackbar> createState() => _CustomSnackbarState();
}

class _CustomSnackbarState extends State<CustomSnackbar> {
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    setState(() {
      isVisible = widget.isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInBack,
      bottom: isVisible ? 0 : -300,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () => setState(() {
          isVisible = false;
        }),
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 40),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [Constants.lightShadow],
              borderRadius: BorderRadius.circular(16),
            ),
            child: widget.errorMessage != null
                ? Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          FontAwesomeIcons.robot,
                          color: Colors.red[300],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Oh snap! Something went wrong...',
                                style: themeData.textTheme.subtitle1!
                                    .copyWith(color: Colors.black),
                              ),
                              Text(
                                widget.errorMessage!,
                                style: themeData.textTheme.subtitle2!
                                    .copyWith(color: Colors.grey[500]),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () => setState(() {
                            isVisible = false;
                          }),
                          child: const Text('Got it'),
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}

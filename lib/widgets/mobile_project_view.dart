import 'package:flutter/material.dart';
import 'package:port_folio/common_utils.dart';
import 'package:port_folio/constants.dart';
import 'package:port_folio/widgets/bulletin_list.dart';
import 'package:port_folio/widgets/high_light_text.dart';

class Projects extends StatefulWidget {
  final ProjectArgs projectParams;

  const Projects({super.key, required this.projectParams});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  int _currentIndex = 0;

  void _onTypingFinished() {
    if (_currentIndex < AppConstants().tataNeuDes.length - 1) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    final isRepaint =
        widget.projectParams.projectPageNav == ProjectPageNav.rePaintBoundary;

    return Container(
      padding: isRepaint
          ? const EdgeInsets.symmetric(vertical: 4, horizontal: 10)
          : const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      child: Column(
        crossAxisAlignment: isRepaint
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: isRepaint
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image
              SizedBox(
                height: isRepaint ? 60 : 70,
                width: isRepaint ? 30 : 80,
                child: Image.asset(widget.projectParams.imageString),
              ),

              const SizedBox(width: 8),

              // Text
              Expanded(
                child: isRepaint
                    ? Padding(
                        padding: EdgeInsetsGeometry.only(top: 10),
                        child: Text(
                          widget.projectParams.projectTitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            // fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodySmall,
                          children: [
                            TextSpan(
                              text: widget.projectParams.projectTitle,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const WidgetSpan(child: SizedBox(height: 22)),
                            TextSpan(text: widget.projectParams.company),
                            TextSpan(text: widget.projectParams.position),
                          ],
                        ),
                      ),
              ),

              if (!isRepaint)
                InkWell(
                  onTap: widget.projectParams.onTap,
                  child: widget.projectParams.childIcon,
                ),
            ],
          ),

          if (widget.projectParams.isExpanded &&
              !widget.projectParams.isSbi &&
              !isRepaint) ...[
            const SizedBox(height: 15),
            highlightedText(
              context: context,
              text:
                  'Tata Neu is a lifestyle and travel super app serving millions of '
                  'users across India. It brings together shopping, travel, '
                  'and payment experiences into one seamless platform.',
              boldWords: ['shopping', 'travel', 'payment'],
            ),
            const SizedBox(height: 15),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: AppConstants().tataNeuDes.length,
              itemBuilder: (context, index) {
                return listTiles(
                  context: context,
                  text: AppConstants().tataNeuDes[index],
                  onFinished: index == _currentIndex ? _onTypingFinished : null,
                  isActive: index == _currentIndex,
                  isCompleted: index <= _currentIndex,
                );
              },
            ),
          ],

          if (widget.projectParams.isExpanded &&
              widget.projectParams.isSbi &&
              !isRepaint) ...[
            const SizedBox(height: 15),
            highlightedText(
              context: context,
              text:
                  'SBI YONO (You Only Need One) is India’s largest mobile '
                  'banking super app, providing UPI, payments, shopping, and '
                  'investment services to millions of customers.',
              boldWords: ['mobile', 'banking', 'UPI'],
            ),
            const SizedBox(height: 15),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: AppConstants().sbiYonoDes.length,
              itemBuilder: (context, index) {
                return listTiles(
                  context: context,
                  text: AppConstants().sbiYonoDes[index],
                  onFinished: index == _currentIndex ? _onTypingFinished : null,
                  isActive: index == _currentIndex,
                  isCompleted: index <= _currentIndex,
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}

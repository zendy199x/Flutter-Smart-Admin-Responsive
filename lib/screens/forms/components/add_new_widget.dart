import 'package:flutter/material.dart';
import 'package:smart_admin/core/constants/color_constants.dart';
import 'package:smart_admin/core/widgets/app_button_widget.dart';
import 'package:smart_admin/models/daily_info_model.dart';
import 'package:smart_admin/responsive.dart';

class SelectionSection extends StatelessWidget {
  const SelectionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [],
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: InformationCard(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.2 : 1,
          ),
          tablet: const InformationCard(),
          desktop: InformationCard(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.3,
          ),
        ),
      ],
    );
  }
}

class InformationCard extends StatelessWidget {
  const InformationCard({
    Key? key,
    this.crossAxisCount = 5,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: dailyDatas.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          MiniInformationWidget(dailyData: dailyDatas[index]),
    );
  }
}

class MiniInformationWidget extends StatefulWidget {
  const MiniInformationWidget({
    Key? key,
    required this.dailyData,
  }) : super(key: key);
  final DailyInfoModel dailyData;

  @override
  _MiniInformationWidgetState createState() => _MiniInformationWidgetState();
}

class _MiniInformationWidgetState extends State<MiniInformationWidget> {
  bool _visible = false;

  final TextEditingController _controller = TextEditingController();

  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }

  int charLength = 0;

  bool status = false;
  bool _closeIcon = true;

  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });

    if (charLength >= 6) {
      setState(() {
        _closeIcon = _closeIcon;
        status = true;
      });
    } else {
      setState(() {
        _closeIcon = !_closeIcon;
        status = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: widget.dailyData.color!.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Icon(
                  widget.dailyData.icon,
                  color: widget.dailyData.color,
                  size: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          GestureDetector(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "New ${widget.dailyData.title!}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Visibility(
                      visible: !_visible,
                      child: const Icon(Icons.create, size: 18),
                    )
                  ],
                ),
              ),
              onTap: () {
                _toggle();
              }),
          const SizedBox(height: 8),
          Visibility(
            visible: _visible,
            child: Container(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(8.0),
                child: ListTile(
                  title: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter Name',
                      border: InputBorder.none,
                    ),
                    onChanged: _onChanged,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      _controller.clear();
                      _toggle();
                      status = false;
                    },
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: status,
            child: Container(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0),
              margin: const EdgeInsets.only(top: 15),
              child: Center(
                child: AppButton(
                  type: ButtonType.PRIMARY,
                  text: "Start",
                  onPressed: () {
                    // ignore: avoid_print
                    print('Button clicked..');
                    _showDialog(context);
                    _toggle();
                    status = false;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: const [
            Icon(
              Icons.verified,
              color: bgColor,
            ),
            SizedBox(
              width: 25,
            ),
            Text('Please wait. Generating form to continue..'),
          ],
        ),
      ),
    );
  }
}

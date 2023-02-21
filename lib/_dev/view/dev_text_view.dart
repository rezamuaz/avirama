import 'package:flutter/material.dart';

import '../../src/theme/colors.dart';

class DevTextView extends StatelessWidget {
  const DevTextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Text Theme',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          _title('Theme Typography'),
          _buildTypography(context),
        ],
      ),
    );
  }

  Widget _title(String title) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: XColors.text,
          ),
        ),
      ),
    );
  }

  Widget _buildTypography(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "H1",
                  style: Theme.of(context).textTheme.headline1,
                  maxLines: 1,
                ),
                const Text("Manrope (bold)")
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "H2",
                  style: Theme.of(context).textTheme.headline2,
                  maxLines: 1,
                ),
                const Text("Manrope (bold)")
              ],
            ),
            const Text(
                "Used for the date in the dialog shown by [showDatePicker]."),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "H3",
                  style: Theme.of(context).textTheme.headline3,
                ),
                const Text("Manrope (bold)")
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "H4",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const Text("Manrope (bold)")
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "H5",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const Text("Manrope (bold)")
              ],
            ),
            const Text(
                "Used for large text in dialogs (e.g., the month and year in the dialog shown by [showDatePicker])."),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "H6",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Text("Manrope (bold)")
              ],
            ),
            const Text(
                "Used for the primary text in app bars and dialogs (e.g., [AppBar.title] and [AlertDialog.title])."),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Subtitle1",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const Text("Regular 16")
              ],
            ),
            const Text(
                "Used for the primary text in lists (e.g., [ListTile.title])."),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Subtitle2",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const Text("Medium 14")
              ],
            ),
            const Text(
                "For medium emphasis text that's a little smaller than [subtitle1]."),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "BodyText1",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const Text("Regular 16")
              ],
            ),
            const Text(
                "Used for emphasizing text that would otherwise be [bodyText2]."),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "BodyText2 (Default)",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const Text("Regular 16")
              ],
            ),
            const Text("The default text style for [Material]."),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Button",
                  style: Theme.of(context).textTheme.button,
                ),
                const Text("MEDIUM 14")
              ],
            ),
            const Text("Used for text on [RaisedButton] and [FlatButton]."),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Caption",
                  style: Theme.of(context).textTheme.caption,
                ),
                const Text("Regular 12")
              ],
            ),
            const Text("Used for auxiliary text associated with images."),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Overline",
                  style: Theme.of(context).textTheme.overline,
                ),
                const Text("REGULAR 10")
              ],
            ),
            const Text(
                "Typically used for captions or to introduce a (larger) headline.")
          ],
        ),
      ),
    );
  }
}

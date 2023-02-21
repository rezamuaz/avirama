import 'package:flutter/material.dart';

class DevInputView extends StatefulWidget {
  const DevInputView({Key? key}) : super(key: key);

  @override
  State<DevInputView> createState() => _DevInputViewState();
}

class _DevInputViewState extends State<DevInputView> {
  InputDecoration getDecoration({InputBorder? border}) {
    return InputDecoration(
        hintText: !hintText ? null : "Hint Text",
        labelText: !labelText ? null : "Label Text",
        errorText: !errorText ? null : "Error Text",
        helperText: !helpText ? null : "Help Text",
        counterText: !counterText ? null : "232",
        prefix: !prefix ? null : const Text("Prefix"),
        suffix: !suffix ? null : const Text("Suffix"),
        prefixIcon: !prefixIcon ? null : const Icon(Icons.access_alarms),
        suffixIcon: !suffixIcon
            ? null
            : IconButton(icon: const Icon(Icons.close), onPressed: () {}),
        isDense: isDense,
        alignLabelWithHint: alignLabelWithHint,
        filled: filled,
        border: border);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Form view",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                decoration: getDecoration(),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: getDecoration(border: const OutlineInputBorder()),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          SwitchListTile(
              title: const Text("Hint Text"),
              value: hintText,
              onChanged: (value) {
                setState(() {
                  hintText = value;
                });
              }),
          SwitchListTile(
              title: const Text("Label Text"),
              value: labelText,
              onChanged: (value) {
                setState(() {
                  labelText = value;
                });
              }),
          SwitchListTile(
              title: const Text("Help Text"),
              value: helpText,
              onChanged: (value) {
                setState(() {
                  helpText = value;
                });
              }),
          SwitchListTile(
              title: const Text("Error Text"),
              value: errorText,
              onChanged: (value) {
                setState(() {
                  errorText = value;
                });
              }),
          SwitchListTile(
              title: const Text("Counter Text"),
              value: counterText,
              onChanged: (value) {
                setState(() {
                  counterText = value;
                });
              }),
          SwitchListTile(
              title: const Text("Prefix"),
              value: prefix,
              onChanged: (value) {
                setState(() {
                  prefix = value;
                });
              }),
          SwitchListTile(
              title: const Text("Suffix"),
              value: suffix,
              onChanged: (value) {
                setState(() {
                  suffix = value;
                });
              }),
          SwitchListTile(
              title: const Text("Prefix Icon"),
              value: prefixIcon,
              onChanged: (value) {
                setState(() {
                  prefixIcon = value;
                });
              }),
          SwitchListTile(
              title: const Text("Suffix Icon"),
              value: suffixIcon,
              onChanged: (value) {
                setState(() {
                  suffixIcon = value;
                });
              }),
          SwitchListTile(
              title: const Text("Is Dense"),
              value: isDense,
              onChanged: (value) {
                setState(() {
                  isDense = value;
                });
              }),
          SwitchListTile(
              title: const Text("Filled"),
              value: filled,
              onChanged: (value) {
                setState(() {
                  filled = value;
                });
              }),
          SwitchListTile(
              title: const Text("Align Label With Hint"),
              value: alignLabelWithHint,
              onChanged: (value) {
                setState(() {
                  alignLabelWithHint = value;
                });
              }),
        ],
      ),
    );
  }

  bool hintText = true;
  bool labelText = true;
  bool helpText = false;
  bool errorText = true;
  bool prefix = false;
  bool suffix = false;
  bool prefixIcon = false;
  bool suffixIcon = false;
  bool isDense = false;
  bool counterText = false;
  bool filled = false;
  bool alignLabelWithHint = false;
}

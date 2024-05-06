import 'package:flutter/material.dart';
import 'package:shared_preference_example/cache/shared_manager.dart';
import 'package:shared_preference_example/product/colors/project_colors.dart';
import 'package:shared_preference_example/product/language/language_items.dart';
import 'package:shared_preference_example/screen/home/home_state.dart';
import 'package:shared_preference_example/widget/naw_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends HomeScreenState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NawDrawer(),
      appBar: AppBar(
        title: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Text(LanguageItems.appBarName.languageItemsString()),
        actions: [Padding(padding: _WidgetSize().normalPadding, child: const CircleAvatar(child: Icon(Icons.person)))],
      ),
      body: Column(
        children: [
          _Card(currentValue: currentValue),
          Column(children: [_textWidget(), _buttons()]),
        ],
      ),
    );
  }

  Padding _buttons() {
    return Padding(
      padding: _WidgetSize().normalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _saveButton(),
          _deleteButton(),
        ],
      ),
    );
  }

  ElevatedButton _deleteButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: ProjectColors.redColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
      onPressed: (() async {
        changeLoading();
        await manager.remove(SharedKey.action);
        changeLoading();
      }),
      child: Padding(
          padding: _WidgetSize().symetricVerticalPadding,
          child: const Icon(Icons.delete, color: ProjectColors.whiteColor)),
    );
  }

  ElevatedButton _saveButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: ProjectColors.blueColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
      onPressed: (() async {
        changeLoading();
        await manager.saveString(SharedKey.action, currentValue);
        changeLoading();
      }),
      child: Padding(
          padding: _WidgetSize().symetricVerticalPadding,
          child: const Icon(Icons.save, color: ProjectColors.whiteColor)),
    );
  }

  Padding _textWidget() {
    return Padding(
      padding: _WidgetSize().normalPadding,
      child: TextField(
        onChanged: (value) {
          changeCurrentValue(value);
        },
        decoration: InputDecoration(
            border: const OutlineInputBorder(), hintText: LanguageItems.textFieldHintText.languageItemsString()),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    super.key,
    required this.currentValue,
  });

  final String currentValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: _WidgetSize().cardWidth,
      child: Card(
        margin: _WidgetSize().normalMargin,
        child: Center(child: Text(currentValue)),
      ),
    );
  }
}

class _WidgetSize {
  final normalPadding = const EdgeInsets.all(8.0);
  final symetricVerticalPadding = const EdgeInsets.symmetric(horizontal: 50);
  final normalMargin = const EdgeInsets.all(12.0);
  final double cardWidth = 200.0;
}

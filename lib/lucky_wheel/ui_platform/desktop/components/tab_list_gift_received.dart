import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class TabListGiftReceived extends StatefulWidget {
  const TabListGiftReceived({super.key});

  @override
  State<TabListGiftReceived> createState() => _TabListGiftReceivedState();
}

class _TabListGiftReceivedState extends State<TabListGiftReceived> {
  List<String> listItem = ['1', '2', '3', '4', '5', '6', '7'];

  late Timer _timer;
  final ScrollController _scrollController = ScrollController();
  bool _needsScroll = false;
  static const List<String> _possibleMessages = [
    "Hi!",
    "Hello.",
    "Bye forever!",
    "I'd really like to talk to you.",
    "Have you heard the news?",
    "I see you're using our website. Can I annoy you with a chat bubble?",
    "I miss you.",
    "I never want to hear from you again.",
    "You up?",
    ":-)",
    "ok",
  ];
  final Random _random = Random();

  reassemble() {
    super.reassemble();
    _timer?.cancel();
    _startTimer();
  }

  initState() {
    super.initState();
    _startTimer();
  }

  dispose() {
    _timer?.cancel();
    super.dispose();
  }

  _addMessage() {
    listItem.add(_possibleMessages[_random.nextInt(_possibleMessages.length)]);
    listItem.removeAt(0);
  }

  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 2), (_) {
      setState(() {
        _addMessage();
        _needsScroll = true;
      });
    });
  }

  _scrollToEnd() async {
    if (_needsScroll) {
      _needsScroll = false;
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 200), curve: Curves.decelerate);
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.4,
      width: MediaQuery.sizeOf(context).height * 0.4,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: listItem.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.all(8),
          alignment: Alignment.center,
          color: Colors.amber,
          height: 70,
          child: Text(
            listItem[index].toString(),
          ),
        ),
      ),
    );
  }
}

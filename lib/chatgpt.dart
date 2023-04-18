import 'dart:async';
import 'dart:developer';

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:flutter/services.dart';
import 'question_answer.dart';
import 'package:flutter/material.dart';



const backgroundColor = Color(0xff343541);
const botBackgroundColor = Color(0xff444654);
final _scrollController = ScrollController();
void _scrollDown() {
  _scrollController.animateTo(
    _scrollController.position.maxScrollExtent,
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeOut,
  );
}

class Chatgpt extends StatelessWidget {
  const Chatgpt({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.purple,
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          fillColor: Colors.transparent,

          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white, width: 2),
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

const apiKey = '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';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? answer;
  final chatGpt = ChatGpt(apiKey: apiKey);
  bool loading = false;
  final testPrompt =
      'Which Disney character famously leaves a glass slipper behind at a royal ball?';

  final List<QuestionAnswer> questionAnswers = [];

  late TextEditingController textEditingController;

  StreamSubscription<StreamCompletionResponse>? streamSubscription;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text(
          'ChatGPT for EdTech',


          textAlign: TextAlign.center,
        ),
        backgroundColor: botBackgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20,),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  controller:_scrollController ,
                  itemCount: questionAnswers.length,
                  itemBuilder: (context, index) {
                    final questionAnswer = questionAnswers[index];
                    final answer = questionAnswer.answer.toString().trim();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(   margin: const EdgeInsets.symmetric(vertical: 5.0),
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                          child: Row(children: [
                            Container(
                              margin: const EdgeInsets.only(right: 16.0),
                              child: const CircleAvatar(
                                child: Icon(
                                  Icons.person,
                                ),
                              ),
                            ),

                            GestureDetector(
                              child:  Text(questionAnswer.question,style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.white)),
                              onLongPress: () {
                                Clipboard.setData(new ClipboardData(text: questionAnswer.question));


                              },
                            ),
                            //Text(' ${questionAnswer.question}',style: TextStyle(color: Colors.white)),
                          ],),
                        ),

                        const SizedBox(height: 12),
                        if (answer.isEmpty && loading)
                          const Center(child: CircularProgressIndicator())
                        else
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            padding: const EdgeInsets.all(16),
                            color:  botBackgroundColor,
                            child: Row(children: [
                              Container(
                                margin: const EdgeInsets.only(right: 16.0),
                                child: CircleAvatar(
                                  backgroundColor: const Color.fromRGBO(16, 163, 127, 1),
                                  child: Image.asset(
                                    'assets/bot.png',
                                    color: Colors.white,
                                    scale: 1.5,
                                  ),
                                ),
                              ),

                              //  Text('A: $',style: TextStyle(color: Colors.white),),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      ),
                                      child:
                                      GestureDetector(
                                        child:  Text(
                                          answer,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(color: Colors.white),
                                        ),
                                        onLongPress: () {
                                          Clipboard.setData(new ClipboardData(text:answer));


                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],),
                          )


                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                  const SizedBox(height: 12),
                ),
              ),
              Row(
                children: [ const SizedBox(width: 5),
                  Expanded(
                    child: TextFormField(


                      style: TextStyle(color: Colors.white,),
                      controller: textEditingController,
                      decoration: const InputDecoration(hintText: 'how can i help you?...'),
                      onFieldSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 5),
                  ClipOval(
                    child: Material(
                      color: botBackgroundColor, // Button color
                      child: InkWell(
                        onTap: _sendMessage,
                        child: const SizedBox(
                          width: 48,
                          height: 48,
                          child: Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _sendMessage() async {
    final question = textEditingController.text;
    setState(() {
      textEditingController.clear();

      loading = true;
      questionAnswers.add(
        QuestionAnswer(
          question: question,
          answer: StringBuffer(),
        ),
      );
      Future.delayed(const Duration(milliseconds: 70))
          .then((_) => _scrollDown());

    });
    final testRequest = CompletionRequest(
      stream: true,
      maxTokens: 4000,
      messages: [Message(role: Role.user.name, content: question)],
    );
    await _streamResponse(testRequest);
    setState(() => loading = false);
    Future.delayed(const Duration(milliseconds: 100))
        .then((_) => _scrollDown());
  }

  _streamResponse(CompletionRequest request) async {
    streamSubscription?.cancel();
    try {
      final stream = await chatGpt.createChatCompletionStream(request);
      streamSubscription = stream?.listen(
            (event) => setState(
              () {
            if (event.streamMessageEnd) {
              streamSubscription?.cancel();
            } else {
              return questionAnswers.last.answer.write(
                event.choices?.first.delta?.content,
              );

            }
          },
        ),
      );
    } catch (error) {
      setState(() {
        loading = false;
        questionAnswers.last.answer.write("Error");
      });
      log("Error occurred: $error");
    }
  }
}

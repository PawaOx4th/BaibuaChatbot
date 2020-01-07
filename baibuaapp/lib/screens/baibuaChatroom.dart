import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatroomBaibua extends StatefulWidget {
  ChatroomBaibua({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageDialogflowV2 createState() => new _HomePageDialogflowV2();
}

class _HomePageDialogflowV2 extends State<ChatroomBaibua> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false; // Check message null ?

  //TextStyle
  TextStyle _googleFontRoboto = GoogleFonts.roboto(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(color: Color.fromRGBO(0, 147, 233, 1)),
  );

//  Connect with Dialogflow => AuthGoogle => key.json file...
  void Response(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "asset/key.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.thai);
    AIResponse response = await dialogflow.detectIntent(query);
    ChatMessage message = new ChatMessage(
      text: response.getMessage() ??
          new TypeMessage(response.getListMessage()[0]).platform,
      name: "Baibua",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSubmitted(String text) {
    String _textname = "";
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = new ChatMessage(
      text: text,
      name: _textname,
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    Response(text);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new AppBar(
              centerTitle: true,
              // Widget App Name
              title: titleAppbar(),
              backgroundColor: Colors.white,
              // Widget Arrow back
              leading: arrowBack(),
              //Rounded Rectangle Border
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    width: 40,
                    height: 40,
                    child: IconButton(
                      splashColor: Colors.lightBlueAccent,
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        //Call Page => Menu
                        Navigator.pushNamed(context, '/Mainmenu-page');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: new Column(children: <Widget>[
        Container(
          child: new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(16.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
        ),
        new Container(
          padding: EdgeInsets.only(bottom: 30.0),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.transparent)),
          child: _buildTextComposer(),
        ),
      ]),
    );
  }

//  ************************************ Widget Section ****************************** //
//  Widget Component
  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(231, 234, 241, 1),
          borderRadius: BorderRadius.circular(50.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                decoration: new InputDecoration.collapsed(
                  hintText: "Type your message",
                  hintStyle: GoogleFonts.roboto(
                    fontSize: 14.0,
//                    fontWeight: FontWeight.bold,
                    textStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(left: 5.00),
              width: 40,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                shape: BoxShape.circle,
              ),
              child: Container(
                child: new IconButton(
                  icon: new Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text)
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget App Name
  Widget titleAppbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.track_changes,
          color: Colors.blue,
          size: 32,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Baibua",
          style: _googleFontRoboto,
        ),
      ],
    );
  }

  // Widget Arrow back
  Widget arrowBack() {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

//  **************************************************************************//
}

class ChatMessage extends StatelessWidget {
  ChatMessage({
    this.text,
    this.name,
    this.type,
  });

//  AnimationController animationController; // Animation Control Chat UI

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    TimeOfDay now = TimeOfDay.now();
    String _timeofdayBot = now.format(context).toString();
    print(now.format(context));

    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 5.0),
        child: new CircleAvatar(child: new Image.asset("img/logo.png")),
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(231, 234, 241, 1),
                borderRadius: BorderRadius.only(
                  bottomRight: const Radius.circular(30),
                  bottomLeft: const Radius.circular(30),
                  topRight: const Radius.circular(30),
                ),
              ),
              margin: const EdgeInsets.only(top: 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(16.00),
                    child: new Text(
                      text,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                    child: Text(
                      _timeofdayBot,
                      style: TextStyle(color: Colors.grey[500], fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    TimeOfDay now = TimeOfDay.now();
    String _timeofdayUser = now.format(context).toString();
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 147, 233, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(30),
                  topLeft: const Radius.circular(30),
                  topRight: const Radius.circular(30),
                ),
              ),
              margin: const EdgeInsets.only(right: 5),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10.00),
                    child: new Text(
                      text,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
                    child: Text(
                      _timeofdayUser,
                      style: TextStyle(color: Colors.white70, fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
//      new Container(
//        margin: const EdgeInsets.only(left: 16.0),
////        child: new CircleAvatar(child: new Image.asset("img/photo.png")),
//      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}

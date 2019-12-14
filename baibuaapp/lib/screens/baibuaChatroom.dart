import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

class ChatroomBaibua extends StatefulWidget {
  ChatroomBaibua({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageDialogflowV2 createState() => new _HomePageDialogflowV2();
}

class _HomePageDialogflowV2 extends State<ChatroomBaibua> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration.collapsed(
                  hintText: "Send a message",
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

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
    String _textname = "User";
    _textController.clear();
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
      appBar: new AppBar(
        title: Text("Baibuachatbot"),
        leading: Icon(Icons.chat),
        actions: <Widget>[
          PopupMenuButton(
            offset: Offset(0, 100),
            elevation: 10,
            color: Colors.blue,
            //** (val) => value property in PopupMenuItem **//
            onSelected: (val) {
              Navigator.pushNamed(context, val);
            },
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 40,
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  //** value => 'routes/...' **//
                  value: '/News-page',
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.fiber_new,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "ข่าวสาร",
                        style: TextStyle(
                          fontFamily: 'FC Lamoon',
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  //** value => 'routes/...' **//
                  value: '/Setting-page',
                  child: Row(
                    children: <Widget>[
                      Hero(
                        tag: "setting",
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "ตั้งค่า",
                        style: TextStyle(
                          fontFamily: 'FC Lamoon',
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  //** value => 'routes/...' **//
                  value: '/emty-page',
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.map,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "แผนที่",
                        style: TextStyle(
                          fontFamily: 'FC Lamoon',
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  //** value => 'routes/...' **//
                  value: '/emty-page',
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.add_box,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "เพิ่มงาน",
                        style: TextStyle(
                          fontFamily: 'FC Lamoon',
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: new Column(children: <Widget>[
        Container(
          child: new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
        ),
        new Divider(height: 1.0),
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ]),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: new CircleAvatar(child: new Image.asset("img/logo.png")),
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(this.name,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                  fontSize: 20,
                )),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(text),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Text(
              this.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: new CircleAvatar(child: new Image.asset("img/photo.png")),
      ),
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

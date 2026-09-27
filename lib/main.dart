import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MarketMakerApp()));

class MarketMakerApp extends StatefulWidget {
  @override
  State<MarketMakerApp> createState() => _MarketMakerAppState();
}

class _MarketMakerAppState extends State<MarketMakerApp> {
  int tab = 0;
  bool running = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A0A1A),
      body: tab == 0 ? homeTab() : tab == 1 ? chartTab() : mt5Tab(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, selectedItemColor: Colors.pink, unselectedItemColor: Colors.grey,
        currentIndex: tab, onTap: (i)=> setState(()=> tab=i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: "EA Chart"),
          BottomNavigationBarItem(icon: Icon(Icons.candlestick_chart), label: "MetaTrader"),
        ],
      ),
    );
  }

  Widget homeTab(){
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF4A1028), Colors.black], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: SafeArea(child: Column(children: [
        SizedBox(height:10), Text("MarketMakerAI", style: TextStyle(fontSize:22, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height:20),
        Container(width:180,height:180,decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.pink,width:2), color: Colors.black), child: Icon(Icons.smart_toy, size:80, color: Colors.pink)),
        SizedBox(height:15), Text("You are trading with", style: TextStyle(color: Colors.white70)),
        Text("MARKET MAKER AI", style: TextStyle(fontSize:26, fontWeight: FontWeight.bold, color: Colors.white)),
        Text("POWERED BY APEXEA", style: TextStyle(letterSpacing:2, color: Colors.white54)),
        SizedBox(height:30),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ElevatedButton(onPressed: (){}, child: Text("Pairs"), style: ElevatedButton.styleFrom(backgroundColor: Colors.black87)),
          GestureDetector(onTap: ()=> setState(()=> running=!running), child: Container(width:100,height:100,decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black, border: Border.all(color: Colors.pink,width:2), boxShadow: [BoxShadow(color: Colors.pink.withOpacity(0.6), blurRadius:20)]), child: Center(child: Text(running?"STOP":"START", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))))),
          ElevatedButton(onPressed: (){}, child: Text("Remove bot"), style: ElevatedButton.styleFrom(backgroundColor: Colors.black87)),
        ]),
        Spacer(),
        Container(margin: EdgeInsets.all(16), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFFE9407A), borderRadius: BorderRadius.circular(16)), child: Row(children: [Icon(Icons.smart_toy, color: Colors.white), SizedBox(width:10), Text("MARKET MAKER AI", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)), Spacer(), Icon(Icons.vpn_key, color: Colors.white)])),
        SizedBox(height:20),
      ])),
    );
  }

  Widget chartTab(){
    return Scaffold(appBar: AppBar(title: Text("EA Chart"), backgroundColor: Colors.black), backgroundColor: Color(0xFF1A0A1A), body: Center(child: Text("P&L: +\$124.50 Today\nWin Rate: 68%\n\nLive trades will show here from MT5", textAlign: TextAlign.center, style: TextStyle(fontSize:18, color: Colors.white))));
  }

  Widget mt5Tab(){
    return Scaffold(appBar: AppBar(title: Text("MetaTrader"), backgroundColor: Colors.black), backgroundColor: Color(0xFF1A0A1A), body: Padding(padding: EdgeInsets.all(16), child: Column(children: [
      TextField(style: TextStyle(color: Colors.white), decoration: InputDecoration(labelText: "MT5 Login", border: OutlineInputBorder())),
      SizedBox(height:10),
      TextField(style: TextStyle(color: Colors.white), decoration: InputDecoration(labelText: "Investor Password", border: OutlineInputBorder()), obscureText: true),
      SizedBox(height:10),
      TextField(style: TextStyle(color: Colors.white), decoration: InputDecoration(labelText: "Server: Exness-MT5Real", border: OutlineInputBorder())),
      SizedBox(height:20),
      ElevatedButton(onPressed: (){}, child: Text("CONNECT & START BOT"), style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, minimumSize: Size(double.infinity,50))),
    ])));
  }
}

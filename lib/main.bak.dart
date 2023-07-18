import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}


class CupertinoTestRoute extends StatelessWidget  {
  const CupertinoTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: const Text("Press"),
        onPressed: () async {
          //导航到新路由
          // var result = await Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) {
          //     return  const NewRoute(info:"传入参数");
          //   }),
          // );
          // var result = await Navigator.pushNamed(
          //   context,
          //   "new_page"
          // );
          var result = await Navigator.of(context).pushNamed("new_page", arguments: "hi");
          debugPrint(result as String?);
          // var result = await Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return NewRoute(
          //         // 路由参数
          //         info: "我是提示xxxx",
          //       );
          //     },
          //   ),
          // );
          // //输出`TipRoute`路由返回结果
          // debugPrint("路由返回值: $result");

        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      routes:{
        "new_page":(context) =>   NewRoute(info:ModalRoute.of(context)?.settings?.arguments as String),
        // "/":(context) =>  MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由

      } ,
      onGenerateRoute:(RouteSettings settings){
        return MaterialPageRoute(builder: (context){
          String? routeName = settings.name;
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其他情况则正常打开路由。
          return const Text("没有权限");
        });
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ss'),
    );
  }
}


// 创建一个 stateless 组件
class Echo extends StatelessWidget {
  const Echo({
      Key? key,
      required this.text,
      this.backgroundColor = Colors.grey
  }):super(key:key);
  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
        color: backgroundColor,
        child:Padding(
          padding: EdgeInsets.all(20),
          child: Text(text,style: const TextStyle(
              color: Colors.red
          ),
        )

        ),
      )
    );
  }


}


class NewRoute extends StatelessWidget {
  const NewRoute({
  Key? key,
     this.info = "default"
}):super(key:key);

  final String info;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("New route"),
      ),
      body: Center(
        child: GestureDetector(
          child: Text("This is new route:$info"),
          onTap: ()=>{
            Navigator.pop(context,"返回提交参数")
          },
        ),
      ),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, this.intCount = 1});
  final String title;
  final int intCount;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String str = "";
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.intCount;
    str = widget.title;
    if (kDebugMode) {
      print("initState");
    }
  }
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    final str = wordPair.toString();
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const CupertinoTestRoute(),
            const Echo(text: "text"),
            Text( str ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increments',
        child:const Text("shit"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

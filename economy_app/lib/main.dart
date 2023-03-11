import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project/blocks/money_bloc/money_block.dart';
import 'package:project/firebase_options.dart';
import 'package:project/models/app_routes.dart';
import 'package:project/provider/user.provider.dart';
import 'package:project/service/hive_service.dart';
import 'package:project/service/money_service.dart';
import 'package:project/ui/main/home.dart';
import 'package:project/ui/splash_screen.dart';
import 'package:project/ui/start/login_screen.dart';
import 'package:project/ui/start/redistration_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _ = await Firebase.initializeApp(
    name: 'Economy Stat',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();

  GetIt.I.registerSingletonAsync<HiveService>(
    () async {
      HiveService hiveService = HiveService();
      await hiveService.init();
      return hiveService;
    },
  );
  GetIt.I.registerSingletonWithDependencies<MoneyRepository>(
      () => MoneyRepository(),
      dependsOn: [HiveService]);

  await GetIt.I.allReady();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.addListener(() {
      if (!userProvider.isLoggedIn) {
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil(AppRoute.login, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 102, 9, 88),
          appBarTheme: const AppBarTheme(color: Colors.pink)),
      routes: {
        AppRoute.initial: (_) => const SplashScreen(),
        AppRoute.registration: (_) => const RegistrationScreen(),
        AppRoute.login: (_) => const LoginScreen(),
        AppRoute.home: (context) => BlocProvider(
            create: (BuildContext context) =>
                MoneyBloc(GetIt.I.get<MoneyRepository>()),
            child: const HomeScreen()),
        //AppRoute.money: (_) =>  MoneyScreen(),
      },
      initialRoute: AppRoute.initial,
    );
  }
}

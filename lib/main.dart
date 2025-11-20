import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evencir_task/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:evencir_task/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => DashboardCubit())],

      child: ScreenUtilInit(
        designSize: const Size(439, 956),
        builder: (_, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fitnesstracker',
          theme: AppTheme.darkTheme,
          home: DashboardScreen(),
        ),
      ),
    );
  }
}

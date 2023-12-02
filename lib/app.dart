import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/pages/country_screen.dart';
import 'presentation/providers/everything_provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CountryScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the FutureProvider
    final everythingProviderAsyncValue = ref.watch(everythingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your App'),
      ),
      body: everythingProviderAsyncValue.when(
        data: (articlesList) {
          // Handle successful data
          if (articlesList != null) {
            // Do something with articlesList
            return ListView.builder(
              itemCount: articlesList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(articlesList[index].title!),
                  // ... other widgets for displaying article data
                );
              },
            );
          } else {
            return const Text('No data');
          }
        },
        loading: () {
          // Handle loading state
          return const CircularProgressIndicator();
        },
        error: (error, stackTrace) {
          // Handle error state
          print('Error: $error');
          return const Text('Error occurred');
        },
      ),
    );
  }
}

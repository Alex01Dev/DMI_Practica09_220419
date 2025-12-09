import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _audioPlayed = false;

  @override
  void initState() {
    super.initState();

    _playSplashAudio();

    Future.delayed(const Duration(seconds: 7), () {
      if (mounted) {
        context.go('/');
      }
    });
  }

  void _playSplashAudio() async {
    if (!_audioPlayed) {
      await _audioPlayer.play(
        AssetSource('audio/splash_sound.mp3'),
      ); 
      _audioPlayed = true;
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.movie_filter,
                size: 150,
                color: Colors.white,
              ),
            ),
            
            SizedBox(height: 30),
            
            Text(
              'Cinemapedia',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: 4,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Color.fromARGB(255, 54, 54, 54),
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50),
            
            SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
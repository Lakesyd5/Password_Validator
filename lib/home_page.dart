import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:password_validation/providers/password_notifier.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool _isVisible = false;
  
  @override
  Widget build(BuildContext context) {
    final passwordValidationState = ref.watch(passwordStateProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Create Your Account', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Set a password', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Please make a secure password with all criteria ticked.',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey[500],
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 30),
            TextField(
              onChanged: (password) =>  ref.read(passwordStateProvider.notifier).updatePassword(password),
              obscureText: !_isVisible,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      icon: _isVisible ? const Icon(Icons.visibility,color: Colors.grey) : const Icon(Icons.visibility_off, color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black, width: 1.5)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black54, width: 1.5)
                  ),    
                  hintText: 'Password',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: passwordValidationState.isPasswordEightCharacters ? Colors.green : Colors.transparent,
                      border: passwordValidationState.isPasswordEightCharacters ? Border.all(color: Colors.green) : Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(child: Icon(Icons.check, color: Colors.white, size: 15)),
                ),
                const SizedBox(width: 10),
                const Text('Contains at least 8 characters')
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: passwordValidationState.passwordHasUpperCase ? Colors.green : Colors.transparent,
                      border: passwordValidationState.passwordHasUpperCase ? Border.all(color: Colors.green) : Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(child: Icon(Icons.check, color: Colors.white, size: 15)),
                ),
                const SizedBox(width: 10),
                const Text('Contains Uppercase')
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                AnimatedContainer(duration: const Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: passwordValidationState.passwordHasOneNumber ? Colors.green : Colors.transparent,
                  border: passwordValidationState.passwordHasOneNumber ? Border.all(color: Colors.green) : Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: const Center(child: Icon(Icons.check, color: Colors.white, size: 15)),
                ),
                const SizedBox(width: 10),
                const Text('Contains at least 1 number')
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                AnimatedContainer(duration: const Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: passwordValidationState.passwordHasOneCharacter ? Colors.green : Colors.transparent,
                  border: passwordValidationState.passwordHasOneCharacter ? Border.all(color: Colors.green) : Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: const Center(child: Icon(Icons.check, size: 15, color: Colors.white)),
                ),
                const SizedBox(width: 10),
                const Text('Contains at least 1 special character')
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 45),
                backgroundColor: Colors.green[800],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              onPressed: () {}, 
              child: const Text('CREATE ACCOUNT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)))
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
        final FlutterSecureStorage secureStorage = FlutterSecureStorage();
         final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: ['email', 'profile'],
      clientId: Platform.isIOS
          ? '694852920295-vi1labct2ieq8u0h5m1k5bten33an3vi.apps.googleusercontent.com'
          : '694852920295-4p7cn7t4apaho6aldn1drta25mccq5ij.apps.googleusercontent.com',
    );

    on<RegisterEvent>((event, emit) {

    });

     on<GoogleRegisterEvent>((event, emit)async{

      emit(RegisterLoading());
      try {
         final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        if (googleUser == null) {
          emit(
             RegisterFailure(
               'User cancelled the Google Sign-In.',
            ),
          );
          return;
        }

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final String? idToken = googleAuth.idToken;

        if (idToken == null) {
          emit(
             RegisterFailure(
              'Failed to retrieve Google ID token.',
            ),
          );
          return;
        }

        final response = await http.post(
          Uri.parse(
            'https://beta.groceryguru.app/api/auth/oauth/google/mobile',
          ),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'idToken': idToken}),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);

          if (data['success'] == true && data['token'] != null) {
            final token = data['token'] as String;
            await secureStorage.write(key: 'jwt_token', value: token);

            // Decode token safely
            String userId = 'unknown';
            try {
              final decodedToken = JwtDecoder.decode(token);
              userId = decodedToken['userId']?.toString() ?? 'unknown';
            } catch (_) {}

            // final user = AppUser(
            //   uid: userId,
            //   fullName:
            //       data['user']?['fullName'] ?? googleUser.displayName ?? '',
            //   email: data['user']?['email'] ?? googleUser.email,
            // );

            emit(RegisterSuccess("user"));
          } else {
            emit(
              RegisterFailure(
               
                    data['message'] ?? 'Failed to authenticate with backend.',
              ),
            );
          }
        } else {
          emit(
            RegisterFailure(
            
                  'Server error (${response.statusCode}): ${response.body}',
            ),
          );
        }
      } catch (e) {
        emit(RegisterFailure( 'Google Sign-In failed: $e'));
      }
    });
    
  }
}

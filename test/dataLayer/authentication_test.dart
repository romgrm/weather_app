import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthenticationRepositoryMock extends Mock implements AuthenticationRepository()
class DioClientMock extends Mock implements RestManager {}


late AuthenticationRepositoryMock _authenticationRepositoryMock;
late DioClientMock _mockDioClient;
late AuthenticationDataSourceImpl _authenticationDataSourceImpl; 

  String email = ''; 
  String password = '';

void setUp() {
 _authenticationRepositoryMock = AuthenticationRepositoryMock(); 
 _mockDioClient = DioClientMock();
 _authenticationDataSourceImpl = AuthenticationDataSourceImpl(_mockDioClient, email, password); 

}

void main() {
  setUp();

  group("test user loggin", () {
    test("should loggin() method be called", () async {
// arrange
  email = "test"; 
  password = "test"; 
   
  // act
  final result = _authenticationDataSourceImpl.loggin(email, password); 
   
  // assert

  verify(() => _authenticationRepositoryMock.loggin(email, password),).called(1); 
    });
 
  });
}
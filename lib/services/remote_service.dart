import 'package:api_demo/models/entrepreneurusering.dart';
import 'package:api_demo/models/post.dart';
import 'package:api_demo/models/user.dart';
import 'package:api_demo/models/usering.dart';
import 'package:api_demo/models/investorusering.dart';
import 'package:api_demo/models/entrepreneurusering.dart';
import 'package:api_demo/models/entrepreneurproperProfile.dart';
import 'package:api_demo/models/singleUser.dart';
import 'package:api_demo/models/properProfile.dart';
import 'package:api_demo/models/investring.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_ip_address/get_ip_address.dart';

//this code is responsible for fetching data online
class RemoteService {
  String ipAddress2 = '10.135.64.112';
  // String ipAddress2 = '10.135.84.169';
  Future<String> getLocalIpAddress() async {
    var ipAddress = IpAddress(type: RequestType.json);
    ipAddress2 = await ipAddress.getIpAddress();
    return ipAddress2;
  }

  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('http://$ipAddress2:8000/notes/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }

  Future<List<User>?> getUsers() async {
    var client = http.Client();

    // var uri = Uri.parse('http://127.0.0.1:8000/api/Users/');
    var uri = Uri.parse('http://$ipAddress2:8000/api/Users/');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    }
  }

  // Future<List<SingleUser>?> getEachUsers(int id) async {
  //   var client = http.Client();
  //   String pk = id.toString();

  //   var uri = Uri.parse('http://127.0.0.1:8000/api/Users/$pk');

  //   var response = await client.get(uri);
  //   if (response.statusCode == 200) {
  //     var json = response.body;
  //     return singleUserFromJson(json);
  //   }
  // }
// getting the proper profile from entrepreneur
  Future<EntrepreneurproperProfile?> getProperEntrepreneurProfile(
      int id) async {
    var client = http.Client();
    String pk = id.toString();

    var uri = Uri.parse(
        // 'http://127.0.0.1:8000/api/create_user_profile/$pk/create_Proper_Profile/entreprenuer');
        'http://$ipAddress2:8000/api/create_user_profile/$pk/create_Proper_Profile/entreprenuer');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return entrepreneurproperProfileFromJson(json);
    }
    // Return null in case of an error
    return null;
  }

  Future<SingleUser?> getEachUsers(int id) async {
    var client = http.Client();
    String pk = id.toString();

    // var uri = Uri.parse('http://127.0.0.1:8000/api/Users/$pk');
    var uri = Uri.parse('http://$ipAddress2:8000/api/Users/$pk');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return singleUserFromJson(json);
    }
    // Return null in case of an error
    return null;
  }

  // Future<User?> getEachUsers(int id) async {
  //   var client = http.Client();
  //   String pk = id.toString();

  //   var uri = Uri.parse('http://127.0.0.1:8000/api/Users/$pk');

  //   var response = await client.get(uri);
  //   if (response.statusCode == 200) {
  //     var json = response.body;
  //     return userFromJson(json);
  //   }
  // Return null in case of an error
  // return null;
  // }

  Future<List<Usering>?> getProjects() async {
    var client = http.Client();

    // var uri = Uri.parse('http://127.0.0.1:8000/api/Projects/');
    var uri = Uri.parse('http://$ipAddress2:8000/api/Projects/');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return useringFromJson(json);
    }
  }

  Future<List<Usering>?> getEachProjects(int id) async {
    var client = http.Client();

    String pk = id.toString();
    // var uri = Uri.parse('http://127.0.0.1:8000/api/Projects/');
    var uri = Uri.parse('http://$ipAddress2:8000/api/Projects/$pk');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return useringFromJson(json);
    }
  }

  Future<List<Investring>?> getEachInvestorProjects(int id) async {
    var client = http.Client();

    String pk = id.toString();
    // var uri = Uri.parse('http://127.0.0.1:8000/api/Projects/');
    var uri = Uri.parse('http://$ipAddress2:8000/api/InvestorProjects/$pk');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return investringFromJson(json);
    }
  }

  Future<List<User>?> sendUsers(String username, String password, String email,
      String phoneNumber) async {
    var client = http.Client();

    // var uri = Uri.parse('http://127.0.0.1:8000/api/create_user_profile/');
    var uri = Uri.parse('http://$ipAddress2:8000/api/create_user_profile/');

    var response = await http.post(uri, body: {
      "username": username,
      "password": password,
      "email": email,
      "phoneNumber": phoneNumber
    });
    var json = response.body;
    print(json);
    if (response.statusCode == 201) {
      String responseString = response.body;
      postFromJson(responseString);
    } else {
      return null;
    }
  }

  //selecting entrepreneur or investor
  Future<List<User>?> sendInvestorOrEntrepreneur(int id, String username,
      String password, String email, String phoneNumber, String role) async {
    var client = http.Client();
    String pk = id.toString();

    // var uri =
    // Uri.parse('http://127.0.0.1:8000/api/create_user_profile/$pk/update');
    var uri =
        Uri.parse('http://$ipAddress2:8000/api/create_user_profile/$pk/update');
    var response = await http.put(uri, body: {
      "username": username,
      "password": password,
      "email": email,
      "phoneNumber": phoneNumber,
      "role": role
    });
    var json = response.body;
    print(json);
    if (response.statusCode == 201) {
      String responseString = response.body;
      postFromJson(responseString);
    } else {
      return null;
    }
  }
  //write a code in python

  Future<List<Post>?> sendPosts(String body) async {
    var client = http.Client();

    // var uri = Uri.parse('http://127.0.0.1:8000/notes/create/');
    var uri = Uri.parse('http://$ipAddress2:8000/notes/create/');

    var response = await http.post(uri, body: {"body": body});
    var json = response.body;
    print(json);
    if (response.statusCode == 201) {
      String responseString = response.body;
      postFromJson(responseString);
    } else {
      return null;
    }
  }

  // writing the code to make the proper profile
  Future<List<User>?> sendProperProfile(
      int id,
      String username,
      String password,
      String email,
      String phoneNumber,
      String role,
      String date_of_birth,
      String city,
      String country,
      String postalCode,
      String latest_job,
      String salary_Income_allowance,
      String is_married,
      String cnic_number) async {
    var client = http.Client();
    String pk = id.toString();

    var uri = Uri.parse(
        // 'http://127.0.0.1:8000/api/create_user_profile/$pk/create_Proper_Profile');
        'http://$ipAddress2:8000/api/create_user_profile/$pk/create_Proper_Profile');

    var response = await http.post(uri, body: {
      "username": username,
      "password": password,
      "email": email,
      "phoneNumber": phoneNumber,
      "role": role,
      "date_of_birth": date_of_birth,
      "city": city,
      "country": country,
      "postalCode": postalCode,
      "latest_job": latest_job,
      "salary_Income_allowance": salary_Income_allowance,
      "is_married": is_married,
      "cnic_number": cnic_number
    });
    var json = response.body;
    print(json);
    if (response.statusCode == 201) {
      String responseString = response.body;
      postFromJson(responseString);
    } else {
      return null;
    }
  }

//getting each proper profile
  Future<ProperProfile?> GetEachProperProfile(int id) async {
    var client = http.Client();
    String pk = id.toString();

    // var uri = Uri.parse(
    //     'http://127.0.0.1:8000/api/create_user_profile/$pk/create_Proper_Profile');

    var uri = Uri.parse(
        'http://$ipAddress2:8000/api/create_user_profile/$pk/create_Proper_Profile');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return properProfileFromJson(json);
    }
  }

  // deleting proper profile
  Future<void> deleteProperProfile(int id) async {
    try {
      String pk = id.toString();
      // var uri = Uri.parse(
      //     'http://127.0.0.1:8000/api/create_user_profile/$pk/create_Proper_Profile');
      var uri = Uri.parse(
          'http://$ipAddress2:8000/api/create_user_profile/$pk/create_Proper_Profile');

      var response = await http.delete(uri);

      if (response.statusCode == 204) {
        // Deletion was successful (HTTP 204 - No Content)
        print('Profile deleted successfully');
      } else {
        // Handle other status codes or errors if needed
        print('Failed to delete profile. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle exceptions
      print('Error while deleting profile: $error');
    }
  }

  // deleting user profile
  Future<void> deleteUserProfile(int id) async {
    try {
      String pk = id.toString();
      // var uri =
      //     Uri.parse('http://127.0.0.1:8000/api/create_user_profile/$pk/delete');
      var uri = Uri.parse(
          'http://$ipAddress2:8000/api/create_user_profile/$pk/delete');
      var response = await http.delete(uri);

      if (response.statusCode == 204) {
        // Deletion was successful (HTTP 204 - No Content)
        print('Profile deleted successfully');
      } else {
        // Handle other status codes or errors if needed
        print('Failed to delete profile. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle exceptions
      print('Error while deleting profile: $error');
    }
  }

  Future<List<User>?> sendEntrepreneurProfile(
      int id,
      // String UserId,
      String company_name,
      String industry_expertise,
      String job_title,
      String previous_venture,
      String years_of_experience,
      String achievements,
      String key_skills,
      String highest_education_attained,
      String profile_image,
      String linkedin_profile,
      String twitter_profile,
      String bio) async {
    var client = http.Client();
    String pk = id.toString();

    // var uri = Uri.parse(
    //     'http://127.0.0.1:8000/api/create_user_profile/$pk/create_Proper_Profile/entreprenuer');

    var uri = Uri.parse(
        'http://$ipAddress2:8000/api/create_user_profile/$pk/create_Proper_Profile/entreprenuer');
    var response = await http.post(uri, body: {
      "company_name": company_name,
      "industry_expertise": industry_expertise,
      "job_title": job_title,
      "previous_venture": previous_venture,
      "years_of_experience": years_of_experience,
      "achievements": achievements,
      "key_skills": key_skills,
      "highest_education_attained": highest_education_attained,
      "profile_image": profile_image,
      "linkedin_profile": linkedin_profile,
      "twitter_profile": twitter_profile,
      "bio": bio
    });
    var json = response.body;
    print(json);
    if (response.statusCode == 201) {
      String responseString = response.body;
      postFromJson(responseString);
    } else {
      return null;
    }
  }

  Future<List<User>?> sendEntrepreneurProjectProfile(
      int id,
      // String UserId,
      String name,
      String field,
      String minimumInvestment,
      String guarenteedProfit,
      String chanceOfRisk,
      String description,
      String timeScale) async {
    var client = http.Client();
    String pk = id.toString();

    // var uri = Uri.parse(
    //     'http://127.0.0.1:8000/api/create_user_profile/$pk/create_project');
    var uri = Uri.parse(
        'http://$ipAddress2:8000/api/create_user_profile/$pk/create_project');

    var response = await http.post(uri, body: {
      "name": name,
      "field": field,
      "minimum_investment": minimumInvestment,
      "guaranteed_profit": guarenteedProfit,
      "chance_of_risk": chanceOfRisk,
      "description": description,
      "time_scale": timeScale
    });
    var json = response.body;
    print(json);
    if (response.statusCode == 201) {
      String responseString = response.body;
      postFromJson(responseString);
    } else {
      return null;
    }
  }
//for investor

  Future<List<User>?> sendInvestorProjectProfile(
      int id,
      // String UserId,
      // String name,
      String field_of_investment,
      String years_of_investment,
      String minimum_investment,
      String minimum_profit,
      String allowed_risk,
      String description,
      String time_scale_allowed) async {
    var client = http.Client();
    String pk = id.toString();

    // var uri = Uri.parse(
    //     'http://127.0.0.1:8000/api/create_user_profile/$pk/create_investor_project');
    var uri = Uri.parse(
        'http://$ipAddress2:8000/api/create_user_profile/$pk/create_investor_project');
    var response = await http.post(uri, body: {
      "field_of_investment": field_of_investment,
      "years_of_investment": years_of_investment,
      "minimum_investment": minimum_investment,
      "minimum_profit": minimum_profit,
      "allowed_risk": allowed_risk,
      "description": description,
      "time_scale_allowed": time_scale_allowed
    });
    var json = response.body;
    print(json);
    if (response.statusCode == 201) {
      String responseString = response.body;
      postFromJson(responseString);
    } else {
      return null;
    }
  }
// for getting all investor projects and displaying them

  Future<List<InvestorUsering>?> getInvestorProjects() async {
    var client = http.Client();

    // var uri = Uri.parse('http://127.0.0.1:8000/api/InvestorProjects/');
    // var uri = Uri.parse('http://192.168.1.17:8000/api/InvestorProjects/');
    // var uri = Uri.parse('http://192.168.1.17:8000/api/Projects/');
    var uri = Uri.parse('http://$ipAddress2:8000/api/InvestorProjects/');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return investorUseringFromJson(json);
    }
  }
//for getting all entrepreneur project snd displaying them

// for getting all investor projects and displaying them

  Future<List<Entrepreneurusering>?> getEntrepreneurProjects() async {
    var client = http.Client();

    var uri = Uri.parse('http://$ipAddress2:8000/api/Projects/');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;

      return entrepreneuruseringFromJson(json);
    }
  }

  Future<List<Entrepreneurusering>?> getFilteredEntrepreneurProjects({
    double? minInvestment,
    double? maxInvestment,
    double? minGuaranteedProfit,
    double? maxGuaranteedProfit,
  }) async {
    var client = http.Client();

    // Create a Map to hold the query parameters
    var queryParameters = <String, String>{};

    // Add filtering parameters if provided
    if (minInvestment != null) {
      queryParameters['min_investment'] = minInvestment.toString();
    }
    if (maxInvestment != null) {
      queryParameters['max_investment'] = maxInvestment.toString();
    }
    if (minGuaranteedProfit != null) {
      queryParameters['min_guaranteed_profit'] = minGuaranteedProfit.toString();
    }
    if (maxGuaranteedProfit != null) {
      queryParameters['max_guaranteed_profit'] = maxGuaranteedProfit.toString();
    }

    // Construct the URL with the query parameters
    var uri = Uri.parse('http://$ipAddress2:8000/api/Projects/?')
        .replace(queryParameters: queryParameters);

    // Make the HTTP request
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;

      return entrepreneuruseringFromJson(json);
    }
  }

  // Future<void> createUserProfile(Map<String, dynamic> data) async {
  //   final String apiUrl = '';

  //   try {
  //     final http.Response response = await http.post(
  //       Uri.parse(apiUrl),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode(data),
  //     );

  //     if (response.statusCode == 200) {
  //       print('User profile created successfully');
  //       // Perform actions for successful profile creation
  //     } else {
  //       print(
  //           'Failed to create user profile. Status code: ${response.statusCode}');
  //       // Handle error
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     // Handle exception
  //   }
  // }

//sending push notifications in flutter
  Future<void> sendPushNotification() async {
    final url = Uri.parse('http://127.0.0.1:8000/send-push-notification/');

    try {
      final response = await http.post(url);

      if (response.statusCode == 200) {
        print('Push notification sent successfully');
      } else {
        print(
            'Failed to send push notification. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending push notification: $e');
    }
  }

//updating the personal profile of the user:
  Future<List<User>?> updatingProperProfile(
      int id,
      String username,
      String password,
      String email,
      String phoneNumber,
      String role,
      String date_of_birth,
      String city,
      String country,
      String postalCode,
      String latest_job,
      String salary_Income_allowance,
      String is_married,
      String cnic_number) async {
    var client = http.Client();
    String pk = id.toString();

    // var uri = Uri.parse(
    //     'http://127.0.0.1:8000/api/create_user_profile/$pk/create_Proper_Profile');
    var uri = Uri.parse(
        'http://$ipAddress2:8000/api/create_user_profile/$pk/create_Proper_Profile');

    var response = await http.put(uri, body: {
      "username": username,
      "password": password,
      "email": email,
      "phoneNumber": phoneNumber,
      "role": role,
      "date_of_birth": date_of_birth,
      "city": city,
      "country": country,
      "postalCode": postalCode,
      "latest_job": latest_job,
      "salary_Income_allowance": salary_Income_allowance,
      "is_married": is_married,
      "cnic_number": cnic_number
    });
    var json = response.body;
    print(json);
    if (response.statusCode == 201) {
      String responseString = response.body;
      postFromJson(responseString);
    } else {
      return null;
    }
  }
}

// To parse this JSON data, do
//
//     final entrepreneurproperProfile = entrepreneurproperProfileFromJson(jsonString);

import 'dart:convert';

EntrepreneurproperProfile entrepreneurproperProfileFromJson(String str) =>
    EntrepreneurproperProfile.fromJson(json.decode(str));

String entrepreneurproperProfileToJson(EntrepreneurproperProfile data) =>
    json.encode(data.toJson());

class EntrepreneurproperProfile {
  int id;
  int userId;
  String companyName;
  String industryExpertise;
  String jobTitle;
  String previousVenture;
  int yearsOfExperience;
  String achievements;
  String keySkills;
  String highestEducationAttained;
  String profileImage;
  String linkedinProfile;
  String twitterProfile;
  String bio;

  EntrepreneurproperProfile({
    required this.id,
    required this.userId,
    required this.companyName,
    required this.industryExpertise,
    required this.jobTitle,
    required this.previousVenture,
    required this.yearsOfExperience,
    required this.achievements,
    required this.keySkills,
    required this.highestEducationAttained,
    required this.profileImage,
    required this.linkedinProfile,
    required this.twitterProfile,
    required this.bio,
  });

  factory EntrepreneurproperProfile.fromJson(Map<String, dynamic> json) =>
      EntrepreneurproperProfile(
        id: json["id"],
        userId: json["UserId"],
        companyName: json["company_name"],
        industryExpertise: json["industry_expertise"],
        jobTitle: json["job_title"],
        previousVenture: json["previous_venture"],
        yearsOfExperience: json["years_of_experience"],
        achievements: json["achievements"],
        keySkills: json["key_skills"],
        highestEducationAttained: json["highest_education_attained"],
        profileImage: json["profile_image"],
        linkedinProfile: json["linkedin_profile"],
        twitterProfile: json["twitter_profile"],
        bio: json["bio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "UserId": userId,
        "company_name": companyName,
        "industry_expertise": industryExpertise,
        "job_title": jobTitle,
        "previous_venture": previousVenture,
        "years_of_experience": yearsOfExperience,
        "achievements": achievements,
        "key_skills": keySkills,
        "highest_education_attained": highestEducationAttained,
        "profile_image": profileImage,
        "linkedin_profile": linkedinProfile,
        "twitter_profile": twitterProfile,
        "bio": bio,
      };
}

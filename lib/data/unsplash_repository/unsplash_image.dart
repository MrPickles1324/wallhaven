// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class UnsplashImage {
  final String id;
  final String created_at;
  final String updated_at;
  final int width;
  final int height;
  final String color;
  final String blur_hash;
  final int likes;
  final bool liked_by_user;
  final String description;
  final User user;
  UnsplashImage({
    required this.id,
    required this.created_at,
    required this.updated_at,
    required this.width,
    required this.height,
    required this.color,
    required this.blur_hash,
    required this.likes,
    required this.liked_by_user,
    required this.description,
    required this.user,
  });

  UnsplashImage copyWith({
    String? id,
    String? created_at,
    String? updated_at,
    int? width,
    int? height,
    String? color,
    String? blur_hash,
    int? likes,
    bool? liked_by_user,
    String? description,
    User? user,
  }) {
    return UnsplashImage(
      id: id ?? this.id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      width: width ?? this.width,
      height: height ?? this.height,
      color: color ?? this.color,
      blur_hash: blur_hash ?? this.blur_hash,
      likes: likes ?? this.likes,
      liked_by_user: liked_by_user ?? this.liked_by_user,
      description: description ?? this.description,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': created_at,
      'updated_at': updated_at,
      'width': width,
      'height': height,
      'color': color,
      'blur_hash': blur_hash,
      'likes': likes,
      'liked_by_user': liked_by_user,
      'description': description,
      'user': user.toMap(),
    };
  }

  factory UnsplashImage.fromMap(Map<String, dynamic> map) {
    return UnsplashImage(
      id: map['id'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
      width: map['width']?.toInt(),
      height: map['height']?.toInt(),
      color: map['color'],
      blur_hash: map['blur_hash'],
      likes: map['likes']?.toInt(),
      liked_by_user: map['liked_by_user'],
      description: map['description'],
      user: User.fromMap(map['user']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UnsplashImage.fromJson(String source) =>
      UnsplashImage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UnsplashImage(id: $id, created_at: $created_at, updated_at: $updated_at, width: $width, height: $height, color: $color, blur_hash: $blur_hash, likes: $likes, liked_by_user: $liked_by_user, description: $description, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UnsplashImage &&
        other.id == id &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.width == width &&
        other.height == height &&
        other.color == color &&
        other.blur_hash == blur_hash &&
        other.likes == likes &&
        other.liked_by_user == liked_by_user &&
        other.description == description &&
        other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        width.hashCode ^
        height.hashCode ^
        color.hashCode ^
        blur_hash.hashCode ^
        likes.hashCode ^
        liked_by_user.hashCode ^
        description.hashCode ^
        user.hashCode;
  }
}

class User {
  final String id;
  final String username;
  final String name;
  final String portfolio_url;
  final String bio;
  final String location;
  final int total_likes;
  final int total_photos;
  final int total_collections;
  final String instagram_username;
  final String twitter_username;
  final ProfileImage profile_image;
  final Links links;
  User({
    required this.id,
    required this.username,
    required this.name,
    required this.portfolio_url,
    required this.bio,
    required this.location,
    required this.total_likes,
    required this.total_photos,
    required this.total_collections,
    required this.instagram_username,
    required this.twitter_username,
    required this.profile_image,
    required this.links,
  });

  User copyWith({
    String? id,
    String? username,
    String? name,
    String? portfolio_url,
    String? bio,
    String? location,
    int? total_likes,
    int? total_photos,
    int? total_collections,
    String? instagram_username,
    String? twitter_username,
    ProfileImage? profile_image,
    Links? links,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      name: name ?? this.name,
      portfolio_url: portfolio_url ?? this.portfolio_url,
      bio: bio ?? this.bio,
      location: location ?? this.location,
      total_likes: total_likes ?? this.total_likes,
      total_photos: total_photos ?? this.total_photos,
      total_collections: total_collections ?? this.total_collections,
      instagram_username: instagram_username ?? this.instagram_username,
      twitter_username: twitter_username ?? this.twitter_username,
      profile_image: profile_image ?? this.profile_image,
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'portfolio_url': portfolio_url,
      'bio': bio,
      'location': location,
      'total_likes': total_likes,
      'total_photos': total_photos,
      'total_collections': total_collections,
      'instagram_username': instagram_username,
      'twitter_username': twitter_username,
      'profile_image': profile_image.toMap(),
      'links': links.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      name: map['name'],
      portfolio_url: map['portfolio_url'],
      bio: map['bio'],
      location: map['location'],
      total_likes: map['total_likes']?.toInt(),
      total_photos: map['total_photos']?.toInt(),
      total_collections: map['total_collections']?.toInt(),
      instagram_username: map['instagram_username'],
      twitter_username: map['twitter_username'],
      profile_image: ProfileImage.fromMap(map['profile_image']),
      links: Links.fromMap(map['links']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, username: $username, name: $name, portfolio_url: $portfolio_url, bio: $bio, location: $location, total_likes: $total_likes, total_photos: $total_photos, total_collections: $total_collections, instagram_username: $instagram_username, twitter_username: $twitter_username, profile_image: $profile_image, links: $links)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.username == username &&
        other.name == name &&
        other.portfolio_url == portfolio_url &&
        other.bio == bio &&
        other.location == location &&
        other.total_likes == total_likes &&
        other.total_photos == total_photos &&
        other.total_collections == total_collections &&
        other.instagram_username == instagram_username &&
        other.twitter_username == twitter_username &&
        other.profile_image == profile_image &&
        other.links == links;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        name.hashCode ^
        portfolio_url.hashCode ^
        bio.hashCode ^
        location.hashCode ^
        total_likes.hashCode ^
        total_photos.hashCode ^
        total_collections.hashCode ^
        instagram_username.hashCode ^
        twitter_username.hashCode ^
        profile_image.hashCode ^
        links.hashCode;
  }
}

class ProfileImage {
  final String small;
  final String medium;
  final String large;
  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  ProfileImage copyWith({
    String? small,
    String? medium,
    String? large,
  }) {
    return ProfileImage(
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'small': small,
      'medium': medium,
      'large': large,
    };
  }

  factory ProfileImage.fromMap(Map<String, dynamic> map) {
    return ProfileImage(
      small: map['small'],
      medium: map['medium'],
      large: map['large'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileImage.fromJson(String source) =>
      ProfileImage.fromMap(json.decode(source));

  @override
  String toString() =>
      'Profile_image(small: $small, medium: $medium, large: $large)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileImage &&
        other.small == small &&
        other.medium == medium &&
        other.large == large;
  }

  @override
  int get hashCode => small.hashCode ^ medium.hashCode ^ large.hashCode;
}

class Links {
  final String self;
  final String html;
  final String photos;
  final String likes;
  final String portfolio;
  Links({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
  });

  Links copyWith({
    String? self,
    String? html,
    String? photos,
    String? likes,
    String? portfolio,
  }) {
    return Links(
      self: self ?? this.self,
      html: html ?? this.html,
      photos: photos ?? this.photos,
      likes: likes ?? this.likes,
      portfolio: portfolio ?? this.portfolio,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'self': self,
      'html': html,
      'photos': photos,
      'likes': likes,
      'portfolio': portfolio,
    };
  }

  factory Links.fromMap(Map<String, dynamic> map) {
    return Links(
      self: map['self'],
      html: map['html'],
      photos: map['photos'],
      likes: map['likes'],
      portfolio: map['portfolio'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Links.fromJson(String source) => Links.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Links(self: $self, html: $html, photos: $photos, likes: $likes, portfolio: $portfolio)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Links &&
        other.self == self &&
        other.html == html &&
        other.photos == photos &&
        other.likes == likes &&
        other.portfolio == portfolio;
  }

  @override
  int get hashCode {
    return self.hashCode ^
        html.hashCode ^
        photos.hashCode ^
        likes.hashCode ^
        portfolio.hashCode;
  }
}

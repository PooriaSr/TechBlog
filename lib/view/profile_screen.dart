import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_components.dart';
import 'package:tech_blog/constant/storage_constant.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/constant/my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.phoneSize,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size phoneSize;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileScreenPhoto(phoneSize: phoneSize),
        const SizedBox(
          height: 5,
        ),
        ProfileScreenEditPhotoTitle(textTheme: textTheme),
        const SizedBox(
          height: 40,
        ),
        ProfileScreenUserName(textTheme: textTheme),
        const SizedBox(
          height: 5,
        ),
        ProfileScreenUserEmail(textTheme: textTheme),
        const SizedBox(
          height: 40,
        ),
        GreyDividerTechBlog(phoneSize: phoneSize),
        ProfileScreenFavoriteBlogs(phoneSize: phoneSize, textTheme: textTheme),
        GreyDividerTechBlog(phoneSize: phoneSize),
        ProfileScreenFavoritePodcasts(
            phoneSize: phoneSize, textTheme: textTheme),
        GreyDividerTechBlog(phoneSize: phoneSize),
        ProfileScreenLogOut(phoneSize: phoneSize, textTheme: textTheme),
        SizedBox(
          height: phoneSize.height / 6,
        )
      ],
    );
  }
}

class ProfileScreenLogOut extends StatelessWidget {
  const ProfileScreenLogOut({
    super.key,
    required this.phoneSize,
    required this.textTheme,
  });

  final Size phoneSize;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      splashFactory: NoSplash.splashFactory,
      child: SizedBox(
        height: phoneSize.height / 18,
        width: phoneSize.width * 0.66,
        child: Center(
          child: Text(
            MyStrings.logOut,
            style: textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}

class ProfileScreenFavoritePodcasts extends StatelessWidget {
  const ProfileScreenFavoritePodcasts({
    super.key,
    required this.phoneSize,
    required this.textTheme,
  });

  final Size phoneSize;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      splashFactory: NoSplash.splashFactory,
      child: SizedBox(
        height: phoneSize.height / 18,
        width: phoneSize.width * 0.66,
        child: Center(
          child: Text(
            MyStrings.myFavoritePodcasts,
            style: textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}

class ProfileScreenFavoriteBlogs extends StatelessWidget {
  const ProfileScreenFavoriteBlogs({
    super.key,
    required this.phoneSize,
    required this.textTheme,
  });

  final Size phoneSize;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      splashFactory: NoSplash.splashFactory,
      child: SizedBox(
        height: phoneSize.height / 18,
        width: phoneSize.width * .66,
        child: Center(
          child: Text(
            MyStrings.myFavoriteBlogs,
            style: textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}

class ProfileScreenUserEmail extends StatelessWidget {
  const ProfileScreenUserEmail({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GetStorage().read(StorageConstant.token) != 'token'
        ? Text(
            GetStorage().read(StorageConstant.email),
            style: textTheme.bodyMedium,
          )
        : Text(
            '',
            style: textTheme.bodyMedium,
          );
  }
}

class ProfileScreenUserName extends StatelessWidget {
  const ProfileScreenUserName({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GetStorage().read(StorageConstant.token) != 'token'
        ? Text(
            GetStorage().read(StorageConstant.name),
            style: textTheme.bodyMedium,
          )
        : Text(
            MyStrings.gustUser,
            style: textTheme.bodyMedium,
          );
  }
}

class ProfileScreenEditPhotoTitle extends StatelessWidget {
  const ProfileScreenEditPhotoTitle({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageIcon(
          Assets.icons.bluePen.provider(),
          color: SolidColors.seeMore,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          MyStrings.editProfilePhoto,
          style: textTheme.bodySmall,
        )
      ],
    );
  }
}

class ProfileScreenPhoto extends StatelessWidget {
  const ProfileScreenPhoto({
    super.key,
    required this.phoneSize,
  });

  final Size phoneSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: phoneSize.width / 3.76,
      height: phoneSize.height / 7.18,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: Assets.images.profileAvatar.provider(),
          )),
    );
  }
}

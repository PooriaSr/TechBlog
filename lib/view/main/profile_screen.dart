import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_components.dart';
import 'package:tech_blog/constant/storage_constant.dart';
import 'package:tech_blog/controller/register_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/constant/my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.textTheme,
    required this.bodyMargin,
  });

  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ProfileScreenPhoto(),
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
        const GreyDividerTechBlog(),
        ProfileScreenFavoriteBlogs(textTheme: textTheme),
        const GreyDividerTechBlog(),
        ProfileScreenFavoritePodcasts(textTheme: textTheme),
        const GreyDividerTechBlog(),
        ProfileScreenLogOut(textTheme: textTheme),
        SizedBox(
          height: Get.height / 6,
        )
      ],
    );
  }
}

class ProfileScreenLogOut extends StatelessWidget {
  const ProfileScreenLogOut({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      splashFactory: NoSplash.splashFactory,
      child: SizedBox(
        height: Get.height / 18,
        width: Get.width * 0.66,
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
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      splashFactory: NoSplash.splashFactory,
      child: SizedBox(
        height: Get.height / 18,
        width: Get.width * 0.66,
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
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      splashFactory: NoSplash.splashFactory,
      child: SizedBox(
        height: Get.height / 18,
        width: Get.width * .66,
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
    return Get.find<RegisterController>().toggleLogin() == true
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
    return Get.find<RegisterController>().toggleLogin() == true
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 3.76,
      height: Get.height / 7.18,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: Assets.images.profileAvatar.provider(),
          )),
    );
  }
}

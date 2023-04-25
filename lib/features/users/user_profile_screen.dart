import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:woodtok/constants/gaps.dart';
import 'package:woodtok/constants/sizes.dart';
import 'package:woodtok/features/users/widgets/persistent_tab_bar.dart';
import 'package:woodtok/features/users/widgets/user_profile_follow.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text("주노"),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.gear,
                      size: Sizes.size20,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      foregroundImage: NetworkImage(
                          "https://i.pinimg.com/564x/07/aa/a9/07aaa98dd45f1c670e755a0bc0ee6ec0.jpg"),
                      child: Text("주노"),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "@주노",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.h5,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: Sizes.size16,
                          color: Colors.blue.shade500,
                        )
                      ],
                    ),
                    Gaps.v24,
                    SizedBox(
                      height: Sizes.size48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const UserProfileFollow(
                            topText: "97",
                            underText: "Following",
                          ),
                          VerticalDivider(
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                            indent: Sizes.size12,
                            endIndent: Sizes.size12,
                          ),
                          const UserProfileFollow(
                            topText: "10M",
                            underText: "Followers",
                          ),
                          VerticalDivider(
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                            indent: Sizes.size12,
                            endIndent: Sizes.size12,
                          ),
                          const UserProfileFollow(
                            topText: "194.3M",
                            underText: "Likes",
                          ),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 0.75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size18,
                                horizontal: Sizes.size60),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Sizes.size2),
                              ),
                            ),
                            child: const Text(
                              "Follow",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Gaps.h4,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size10,
                              vertical: Sizes.size12,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(Sizes.size2),
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.youtube,
                              size: Sizes.size28,
                            ),
                          ),
                          Gaps.h4,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size18,
                              vertical: Sizes.size18,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(Sizes.size2),
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.caretDown,
                              size: Sizes.size16,
                            ),
                          )
                        ],
                      ),
                    ),
                    Gaps.v14,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size32,
                      ),
                      child: Text(
                        "All highlights and where to watch live matches on FIFA+ I wonder how it would loook",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size12,
                        ),
                        Gaps.h4,
                        Text(
                          "https://nomadcoders.co",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: Sizes.size2,
                  mainAxisSpacing: Sizes.size2,
                  childAspectRatio: 9 / 14,
                ),
                itemBuilder: (context, index) => Stack(
                  children: [
                    Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 9 / 14,
                          child: Image.asset(
                            fit: BoxFit.cover,
                            "assets/images/woodtok_img.jpg",
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: SizedBox(
                        width: Sizes.size48,
                        height: Sizes.size16,
                        child: Container(
                          padding: const EdgeInsets.all(Sizes.size2),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(Sizes.size2),
                            ),
                          ),
                          child: const Text(
                            "Pinned",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(
                        Icons.photo_rounded,
                        color: Colors.white,
                        size: Sizes.size20,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Row(
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.play,
                            size: Sizes.size16,
                            color: Colors.white,
                          ),
                          Gaps.h8,
                          Text(
                            "3.1M",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16 - Sizes.size1,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Center(
                child: Text("Page two"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

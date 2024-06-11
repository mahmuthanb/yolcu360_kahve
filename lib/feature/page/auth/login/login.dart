import 'package:flutter/material.dart';
import 'package:yolcu360_kahve/core/base/base_widget.dart';
import 'package:yolcu360_kahve/core/res/assets.gen.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';
import 'package:yolcu360_kahve/feature/page/auth/login/login_vm.dart';
import 'package:route_map/route_map.dart';
import 'package:yolcu360_kahve/feature/page/auth/widgets/social_login_button.dart';
import 'package:yolcu360_kahve/feature/router/app_router.routes.dart';

@RouteMap()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginViewModel, LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AppAssets.images.coffeeMugBg.provider(),
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
            color: AppColors.primarySwatch,
          ),
          padding: const EdgeInsets.only(bottom: AppDimens.xl),
        ),
        Column(
          children: [
            // const Spacer(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.l,
                  vertical: AppDimens.l,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Coffee so good, your taste buds will love it.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'The best grain, the finest roast, the powerful flavor.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // ElevatedButton.icon(
                    //   onPressed: () {},
                    //   icon: AppAssets.images.googleIcon.image(width: 30),
                    //   label: const Text(
                    //     'Continue with Google',
                    //     style: TextStyle(fontSize: 24),
                    //   ),
                    // ),
                    viewModel.isLoading
                        ? const SocialLoginLoading()
                        : SocialLoginButton(
                            AppAssets.images.googleIcon.image(width: 30),
                            'Continue with Google',
                            onTap: () async {
                              await viewModel.verifyLogin(true);
                              HomeRoute()
                                  .pushAndRemoveUntil(context, (p0) => true);
                            },
                          )
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

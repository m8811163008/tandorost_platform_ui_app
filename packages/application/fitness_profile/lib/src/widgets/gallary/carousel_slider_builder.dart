import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_profile_app/src/cubit/fitness_profile_cubit.dart';
import 'package:fitness_profile_app/src/widgets/gallary/add_new_image.dart';
import 'package:fitness_profile_app/src/widgets/gallary/gallary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tandorost_components/tandorost_components.dart';

class CarouselSliderBuilder extends StatelessWidget {
  const CarouselSliderBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FitnessProfileCubit, FitnessProfileState>(
      listenWhen:
          (previous, current) =>
              previous.readUserImageGallaryStatus !=
              current.readUserImageGallaryStatus,
      listener: (context, state) {
        if (state.readUserImageGallaryStatus.isServerConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.readUserImageGallaryStatus.isServerConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        }
      },
      buildWhen:
          (previous, current) => previous.filesDetail != current.filesDetail,
      builder: (context, state) {
        if (state.filesDetail.isEmpty) {
          return Center(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: AppRoundedRectangleBorder(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        context.sizeExtenstion.small,
                      ),
                      child: AddNewImageSelfie(),
                    ),
                  ),
                ),
                AddImageButton.filled(),
              ],
            ),
          );
        }
        return CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: false,
            scrollDirection: Axis.vertical,
          ),
          items:
              state.filesDetail.map((fileDetail) {
                return Builder(
                  builder: (BuildContext context) {
                    return AppRoundedRectangleBorder(
                      child: Image.memory(fileDetail.bytes),
                    );
                  },
                );
              }).toList(),
        );
      },
    );
  }
}

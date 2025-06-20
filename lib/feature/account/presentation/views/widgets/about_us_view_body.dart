import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

import '../../../../../core/constants/app_const.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(
            'نحن في فريوت هَب (FruitHub) نقدم لك أفضل تجربة لطلب الفواكه الطازجة مباشرة إلى باب منزلك. نؤمن بأن الفواكه الصحية يجب أن تكون متاحة بسهولة وسرعة لكل فرد.',
            style: AppTextStyles.semiBold16.copyWith(height: 1.6),
          ),
          const SizedBox(height: 16),
          Text(
            'رؤيتنا هي جعل التسوق للمنتجات الطازجة أمرًا بسيطًا، موثوقًا، وممتعًا. من خلال تطبيقنا، يمكنك تصفح مجموعة واسعة من الفواكه المختارة بعناية، والتمتع بخدمة توصيل سريعة ومريحة.',
            style: AppTextStyles.semiBold16.copyWith(height: 1.6),
          ),
          const SizedBox(height: 16),
          Text(
            'نحن نضمن الجودة، ونسعى دائمًا لإرضاء عملائنا، لأن صحتكم أولويتنا.',
            style: AppTextStyles.semiBold16.copyWith(height: 1.6),
          ),
          const SizedBox(height: 16),
          Text(
            'فريوت هَب ليس مجرد تطبيق، بل هو أسلوب حياة صحي يبدأ من اختيارك للطعام. نحن نعمل مع مزارعين موثوقين لضمان أن كل ثمرة تصل إليك طازجة ومغذية.',
            style: AppTextStyles.semiBold16.copyWith(height: 1.6),
          ),
          const SizedBox(height: 16),
          Text(
            'نسعى جاهدين لتطوير خدماتنا باستمرار من خلال الاستماع لملاحظاتكم واحتياجاتكم. رضاكم هو دافعنا للتطور والتحسين المستمر.',
            style: AppTextStyles.semiBold16.copyWith(height: 1.6),
          ),
          const SizedBox(height: 16),
          Text(
            'انضم إلينا اليوم وابدأ رحلة صحية مليئة بالنكهة والجودة. فريوت هَب، حيث الطزاجة تبدأ.',
            style: AppTextStyles.semiBold16.copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }
}

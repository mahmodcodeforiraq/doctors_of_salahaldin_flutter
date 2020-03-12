import 'package:flutter/material.dart';

class AboutCodeForIraq extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new StateAboutCodeForIraq();
  }
}

class StateAboutCodeForIraq extends State<AboutCodeForIraq> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          shape: RoundedRectangleBorder(
              borderRadius:
                  new BorderRadius.only(bottomRight: Radius.circular(35))),
          title: new Text("عن المبادرة"),
          centerTitle: true,
          backgroundColor: Color(0xff6A4BC3),
          actions: <Widget>[],
        ),
        body: new ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Container(
                  child: new Image.asset(
                    'img/codeforiraq.png',
                    width: 150,
                    height: 150,
                  ),
                  alignment: Alignment.center,
//
                ),
                new Padding(padding: EdgeInsets.only(top: 20)),
                new Text(
                  'Code For Iraq',
                  style: TextStyle(fontSize: 18),
                ),
                new Text('البرمجة من اجل العراق'),
                new Padding(padding: EdgeInsets.only(top: 20)),
                new Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: new Text(
                    'وهي مبادرة إنسانية غير ربحية تهدف الى خدمة المجتمع عن طريق البرمجة Programming. تعتبر “Code For IRAQ” مبادرة تعليمية حقيقية ترعى المهتمين بتعلم تصميم وبرمجة تطبيقات الهاتف الجوال ومواقع الانترنت وبرامج الحاسوب والشبكات والاتصالات ونظم تشغيل الحاسوب باستخدام التقنيات مفتوحة المصدر Open Source ، كما توفر لهم جميع الدروس التعليمية اللازمة وبشكل مجاني تماماً ، حيث يتسنى لطالب العلم أن يكتسب الخبرة العملية أثناء وبعد فترة الدراسة وذلك ليسهل عليه ايجاد الوظيفة وبشكل سريع بعد التخرّج وتهدف هذه المبادرة الى تحويل المجتمع من مجتمع سلبي مستهلك الى مجتمع ايجابي منتج يعتمد بالدرجة الاساس على استثمار العقول والخبرات والمهارات بغض النظر عن العمر او التخصص بل الاهم من ذلك تعتمد على مبدأ المواطنة والمشاركة الفاعلة في تأسيس وبناء المجتمع تدعو هذه المبادرة جميع الطلبة والخريجين والهواة والأساتذة الجامعيين والمهتمين مجال البرمجة وتقنيات المعلومات وكذلك الاختصاصات الاخرى الى التطوع والمشاركة الفعلية لأجل الارتقاء بواقع البلد ، حيث تعتبر فرصة عظيمة لاكتساب الخبرة والمهارة عن طريق تصميم وتنفيذ برامج وتطبيقات خدمية من شأنها خدمة المواطن وذلك ضمن مجاميع عمل نشطة وفعّالة يتعاون فيها جميع الأفراد كفريق واحد يتبادل الاراء والخبرات ويطرح الافكار لتتم مناقشتها وتطبيقها على أرض الواقع ، كما تفتح المجال لجميع المواطنين العراقيين ومن جميع الاختصاصات إلى المشاركة الفاعلة في هذه المشاريع لرفد الفريق بالخبرات والافكار والاراء والمقترحات التي من شأنها خدمة المجتمع بأفضل ما يمكن. لا يخفى على أحد أن لمثل هذه المبادرات دور رئيسي في تحسين ورفع اقتصاد البلد ، حيث يتم فيها إبراز المقدرة الحقيقية والذكاء الحقيقي للمواطن العراقي مما يساعد على استقطاب الخبرات المحلية وتوظيفها بدلاً عن استيراد الخبرات الاجنبية والتي عادة ما تكون مكلفة جداً للشركات والمؤسسات الحكومية والأهلية وجميع القطاعات العاملة في البلد والتي قد لا تظاهي أحيانا خبرة وكفاءة وإخلاص المواطن العراقي ، كما إن سيطرة الشركات والعمالات الأجنبية على سوق العمل العراقي ساهم في تقليص فرص التوظيف بشكل هائل نتج عنه عدد كبير من الافراد العاطلين عن العمل من ذوي الخبرات والشهادات والاختصاصات المختلفة ، وهنا يأتي دور الجامعات والمؤسسات والشركات العراقية في التثقيف والتطوير والمشاركة في تغيير وتحسين القوة الاقتصادية والعلمية للبلد ورفع مكانته بين البلدان الاخرى.',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

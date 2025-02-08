import 'package:dio/dio.dart';
import 'package:final_project/cor/constants.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PaymentController extends GetxController {
  Future<void> makePayment() async {
    // الدفع
    try {
      String? paymentIntentClientSecret =
          await _createPaymentIntent(100, 'usd');
      if (paymentIntentClientSecret == null) return;
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Nesma",
        ),
      );

      await _presentPaymentSheet();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _presentPaymentSheet() async {
    // عرض واجهة الدفع
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      print(e);
    }
  }

  Future<String?> _createPaymentIntent(int amount, String currency) async {
    // إنشاء نية الدفع
    try {
      final Dio dio = Dio();
      var data = {
        'amount': _calculateAmount(amount),
        'currency': currency,
      };

      final response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": "application/x-www-form-urlencoded",
          },
        ),
      );

      if (response.data != null) {
        return response.data["client_secret"];
      }
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }

  String _calculateAmount(int amount) {
    // حساب المبلغ
    return (amount * 100).toString();
  }
}

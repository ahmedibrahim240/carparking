// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:parking_app/modules/payment/payment/cubit/state.dart';
// import 'package:parking_app/models/authentication_request_model.dart';
// import 'package:parking_app/models/order_registration_model.dart';
// import 'package:parking_app/models/payment_reqeust_model.dart';
// import 'package:parking_app/shared/network/local/dio_helper.dart';
// import 'package:parking_app/shared/components/constants.dart';

// class PaymentCubit extends Cubit<PaymentStates> {
//   PaymentCubit() : super(PaymentInitialStates());
//   static PaymentCubit get(context) => BlocProvider.of(context);
//   AuthenticationRequestModel? authTokenModel;
//   Future<void> getAuthToken() async {
//     emit(PaymentAuthLoadingStates());
//     DioHelperPayment.postData(url: ApiContest.getAuthToken, data: {
//       'api_key': ApiContest.paymentApiKey,
//     }).then((value) {
//       authTokenModel = AuthenticationRequestModel.fromJson(value.data);
//       ApiContest.paymentFirstToken = authTokenModel!.token;
//       print('The token 🍅');
//       emit(PaymentAuthSuccessStates());
//     }).catchError((error) {
//       print('Error in auth token 🤦‍♂️');
//       emit(
//         PaymentAuthErrorStates(error.toString()),
//       );
//     });
//   }

//   Future getOrderRegistrationID({
//     required String price,
//     required String firstName,
//     required String lastName,
//     required String email,
//     required String phone,
//   }) async {
//     emit(PaymentOrderIdLoadingStates());
//     DioHelperPayment.postData(url: ApiContest.getOrderId, data: {
//       'auth_token': ApiContest.paymentFirstToken,
//       "delivery_needed": "false",
//       "amount_cents": price,
//       "currency": "EGP",
//       "items": [],
//     }).then((value) {
//       OrderRegistrationModel orderRegistrationModel =
//           OrderRegistrationModel.fromJson(value.data);
//       ApiContest.paymentOrderId = orderRegistrationModel.id.toString();
//       getPaymentRequest(price, firstName, lastName, email, phone);
//       print('The order id 🍅 =${ApiContest.paymentOrderId}');
//       emit(PaymentOrderIdSuccessStates());
//     }).catchError((error) {
//       print('Error in order id 🤦‍♂️');
//       emit(
//         PaymentOrderIdErrorStates(error.toString()),
//       );
//     });
//   }

//   // for final request token

//   Future<void> getPaymentRequest(
//     String priceOrder,
//     String firstName,
//     String lastName,
//     String email,
//     String phone,
//   ) async {
//     emit(PaymentRequestTokenLoadingStates());
//     DioHelperPayment.postData(
//       url: ApiContest.getPaymentRequest,
//       data: {
//         "auth_token": ApiContest.paymentFirstToken,
//         "amount_cents": priceOrder,
//         "expiration": 3600,
//         "order_id": ApiContest.paymentOrderId,
//         "billing_data": {
//           "apartment": "NA",
//           "email": email,
//           "floor": "NA",
//           "first_name": firstName,
//           "street": "NA",
//           "building": "NA",
//           "phone_number": phone,
//           "shipping_method": "NA",
//           "postal_code": "NA",
//           "city": "NA",
//           "country": "NA",
//           "last_name": lastName,
//           "state": "NA"
//         },
//         "currency": "EGP",
//         "integration_id": ApiContest.integrationIdCard,
//         "lock_order_when_paid": "false"
//       },
//     ).then((value) {
//       PaymentRequestModel paymentRequestModel =
//           PaymentRequestModel.fromJson(value.data);
//       ApiContest.finalToken = paymentRequestModel.token;
//       print('Final token 🚀 ${ApiContest.finalToken}');
//       emit(PaymentRequestTokenSuccessStates());
//     }).catchError((error) {
//       print('Error in final token 🤦‍♂️');
//       emit(
//         PaymentRequestTokenErrorStates(error.toString()),
//       );
//     });
//   }

//   Future getRefCode() async {
//     DioHelperPayment.postData(
//       url: ApiContest.getRefCode,
//       data: {
//         "source": {
//           "identifier": "AGGREGATOR",
//           "subtype": "AGGREGATOR",
//         },
//         "payment_token": ApiContest.finalToken,
//       },
//     ).then((value) {
//       ApiContest.refCode = value.data['id'].toString();
//       print('The ref code 🍅${ApiContest.refCode}');
//       emit(PaymentRefCodeSuccessStates());
//     }).catchError((error) {
//       print("Error in ref code 🤦‍♂️");
//       emit(PaymentRefCodeErrorStates(error.toString()));
//     });
//   }
// }

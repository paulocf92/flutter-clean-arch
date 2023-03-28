import 'package:flutter_clean_arch/app/modules/shared/response/response_presentation.dart';

abstract class DeleteUserUseCase {
  Future<ResponsePresentation> call(String id);
}

import 'package:life_manager/app/core/utils/exceptions/exceptions.dart';

class UIException extends AppException {
  UIException(super.message, [super.tag]);
}

class UINoDataException extends UIException {
  UINoDataException(String field, [String? tag])
      : super("Some state field is null", "$tag: field=$field");
}

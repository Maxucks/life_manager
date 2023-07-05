import 'package:life_manager/app/core/utils/exceptions/exceptions.dart';

class StorageException extends AppException {
  StorageException(super.message, [super.tag]);
}

class StorageNoKeyException extends StorageException {
  StorageNoKeyException([String? tag])
      : super("Storage doesn't contain passed key", tag);
}

class StorageNoDataException extends StorageException {
  StorageNoDataException([String? tag])
      : super("Data retrieved by passed key is null", tag);
}

class StorageSaveFailedException extends StorageException {
  StorageSaveFailedException([String? tag])
      : super("Failed to save passed data", tag);
}

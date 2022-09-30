import 'package:cv/cv.dart';

abstract class DbRecord extends CvModelBase {
  final id = CvField<int>(columnId);
}

const String dbName = 'follo_conversations.db';

const int kVersion1 = 1;

String columnId = '_id';
String columnFolloId = 'follo_id';
String columnConversations = 'conversations';
String columnUpdatedDate = 'updatedDate';

String tableConversations = 'Conversations';

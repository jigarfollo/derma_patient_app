import 'package:cv/cv.dart';

import 'db_record.dart';

class DbFolloConversation extends DbRecord {
  final folloId = CvField<String>(columnFolloId);
  final conversations = CvField<String>(columnConversations);
  final updatedDate = CvField<int>(columnUpdatedDate);

  @override
  List<CvField> get fields => [id, folloId, conversations, updatedDate];
}

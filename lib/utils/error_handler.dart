class ErrorHandler {
  String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'already_on_follo':
        return 'Patient already on another follo up';
      case 'auth_expired':
        return 'Auth token expired';
      case 'auth_failure':
        return 'Authentication failure (invalid auth token)';
      case 'dialogflow_unavailable':
        return 'Dialogflow unavailable (missing / deleted)';
      case 'dialogflow_unavailable_age':
        return 'Dialogflow not available for given age criteria';
      case 'dialogflow_unavailable_gender':
        return 'Dialogflow not available for given gender criteria';
      case 'error_contact_support':
        return 'Error occurred, Please contact support';
      case 'cannot_send_message_follo_status':
        return 'Cannot send message to follo up with this status';
      case 'cannot_send_message_outside_session':
        return 'Cannot send message outside 24hours of last patient response';
      case 'invalid_age':
        return 'Invalid age criteria';
      case 'invalid_answer_type':
        return 'Invalid answer type (additional questions)';
      case 'invalid_caregiver_id':
        return 'Invalid caregiver ID';
      case 'invalid_caregiver_role':
        return 'Invalid caregiver role (caregiver signup)';
      case 'invalid_care_team_id':
        return 'Invalid care team ID';
      case 'invalid_clinic_id':
        return 'Invalid clinic ID';
      case 'invalid_comorbidity_id':
        return 'Invalid comorbidity ID';
      case 'invalid_conversation_id':
        return 'Invalid conversation ID';
      case 'invalid_data':
        return 'Unable to unpack data';
      case 'invalid_disease_id':
        return 'Invalid disease ID';
      case 'invalid_mobile_number':
        return 'Invalid mobile number';
      case 'invalid_otp':
        return 'Invalid OTP';
      case 'invalid_page_number':
        return 'Invalid page number (pagination)';
      case 'invalid_question_type':
        return 'Invalid question type (additional questions)';
      case 'invalid_retry_type':
        return 'Invalid retry type for otp resend';
      case 'mobile_number_of_caregiver':
        return 'This mobile number belongs to caregiver (create follo up)';
      case 'try_again':
        return 'Error occurred, Please try again';
      case 'success':
        return 'Success';
      case 'token_obsolete':
        return 'Auth token older than 12 hours, cannot refresh';
      case 'valid_token':
        return 'Valid auth token, cannot refresh';
      case 'active_subscription_exist':
        return 'You alraedy have an active subscription';
      case 'invalid_order_id':
        return 'Invalid order id';

      // New added
      case 'scheduled':
        return 'Follo up registered';
      case 'initiated':
        return 'Follo up started';
      case 'terminated':
        return 'Follo up terminated';
      case 'init_abandoned':
        return 'Follo up abandoned in init state';
      case 'incomplete_abandoned':
        return 'Follo up abandoned incomplete state';
      case 'scheduled_abandoned':
        return 'Follo up abandoned in scheduled state';
      case 'completed':
        return 'Follo up finished';
      case 'no_consent_completed':
        return 'Follo up finished with initial consent as No';
      case 'cannot_send_any_more_messages':
        return 'Cannot send any more messages';
      case 'exceeding_allowed_limit':
        return 'Exceeded allowed follow limit';
      case 'db_error':
        return 'Database error';
      // case 'invalid_package_id':
      //   return '';
      case 'no_package_details_found':
        return 'No package details found';
      case 'no_subscription_found_for_current_care_team_and_clinic':
        return 'No subscription found for current careteam and clinic';
      case 'not_on_any_active_package':
        return 'Not on any active package';
      case 'signature_does_not_match':
        return 'Signature does not match';
      case 'subscription_is_used_or_expired':
        return 'Subscription is used or expired';
      case 'one_or_more_selected_clinic_and_care_team_is_on_active_subscription':
        return 'One or more selected clinic and care team is on active subscription';
      case 'top_up_already_purchased':
        return 'Top up already exists';
      case 'free_package_cant_have_topups':
        return 'You can\'t purchase top up for free package.';

      case 'cannot_edit_follo_in_this_status':
        return 'Cannot edit follo with this status';
      case 'no_conversation_found':
        return 'No conversation found';
      case 'no_dialogflow_found':
        return 'No dialogflow found';
      case 'no_follo_up_found':
        return 'No follo up found';
      case 'no_message_found':
        return 'No message found';
      case 'no_sent_message':
        return 'No sent message';
      case 'unable_to_generate_consent_question':
        return 'Unable to generate consent question';
      case 'invalid_user_id':
        return 'Invalid User ID';
      case 'user_does_not_exist':
        return 'User doesn\'t exist';
      case 'invalid_pin':
        return 'Invalid PIN';
      default:
        return 'Something went wrong';
    }
  }
}

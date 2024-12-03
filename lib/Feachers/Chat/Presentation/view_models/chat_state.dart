import '../views/widgets/single_chat_widgets/enum_message_type.dart';

abstract class ChatState {}

// Initial state when the app starts
class ChatInitial extends ChatState {}

// Loading state for general chat operations
class ChatLoading extends ChatState {}

// Loading state for call operations
class CallLoading extends ChatState {}

// Loading state for video thumbnail generation
class VideoThumbnailLoading extends ChatState {}

// State when audio playback is stopped
class AudioPlaybackStopped extends ChatState {}

// State when bottom add files section is toggled
class openBottomAddFilesState extends ChatState {}

// State when speech recognition stops
class SpeechRecognitionStopped extends ChatState {}

// State when speech recognition is initialized
class SpeechRecognitionInitialized extends ChatState {}

// State when video thumbnails are successfully loaded
class VideoThumbnailLoaded extends ChatState {
  final Map<String, String> thumbnails; // Map video URLs to their thumbnail URLs
  VideoThumbnailLoaded(this.thumbnails);
}

// State to handle scrolling to a specific index in the chat list
class ScrollToIndexState extends ChatState {
  final int index;
  ScrollToIndexState(this.index);
}

// Camera-related permission and operation states
class CameraPermissionDenied extends ChatState {}
class isrRecordCameraIconsHidesChangeState extends ChatState {}

// State when recording is toggled (on/off)
class RecordingStateChanged extends ChatState {
  final bool isRecording;
  RecordingStateChanged(this.isRecording);
}

// Additional camera permission states
class CameraPermissionPermanentlyDenied extends ChatState {}
class CameraPermissionRestricted extends ChatState {}
class CameraPermissionLimited extends ChatState {}
class CameraOperationCancelled extends ChatState {}

// State when a new message is added to the chat
class MessageAddedState extends ChatState {}

// Loading state for adding a new message
class MessageLoadingState extends ChatState {}
class SpeechRecognitionResultState extends ChatState {}

// State when the emoji picker is toggled
class toggleEmojiPickerState extends ChatState {}

// State when the text field's focus changes (for typing or other purposes)
class TextFieldFocusChanged extends ChatState {
  final bool isFocused;
  TextFieldFocusChanged(this.isFocused);
}

// State for permission denial during recording
class RecordingPermissionDenied extends ChatState {}

// State for speech recognition error
class SpeechRecognitionError extends ChatState {}

// State when the duration of recording changes
class RecordingDurationChanged extends ChatState {
  final int duration;
  RecordingDurationChanged(this.duration);
}

// State when recording stops
class RecordingStopped extends ChatState {
  final String filePath;
  RecordingStopped(this.filePath);
}

// State when the recording is deleted
class RecordingDeleted extends ChatState {}

// State when a speech recognition result is available
/*
class SpeechRecognitionResult extends ChatState {}
*/
class DoctorsListUpdated extends ChatState {}

// State when speech recognition starts
// State when speech recognition starts
class SpeechRecognitionStarted extends ChatState {}

// State for typing in the chat
class ChatTypingState extends ChatState {}

// State when message selection changes (for deletion or other actions)
class MessageSelectionChanged extends ChatState {}

// State when messages are deleted
class MessagesDeleted extends ChatState {}

// State for calculating the number of lines in the text field
class calculateTextLinesState extends ChatState {}

// State for message-related errors
class MessageErrorStateState extends ChatState {
  String error;
  MessageErrorStateState(this.error);
}

// State when a poll is updated in the chat
class PollUpdatedState extends ChatState {
  final Map<String, dynamic> pollData;
  PollUpdatedState(this.pollData);
}

// State when contacts permission is denied
class ContactsPermissionDenied extends ChatState {}

// State when messages are copied
class MessagesCopied extends ChatState {}
class uploadMediaLoading extends ChatState {}

// State when contacts are confirmed
class ContactsSelectionConfirmed extends ChatState {}

// State when the search bar visibility is toggled
class SearchBarToggled extends ChatState {
  final bool isVisible;
  SearchBarToggled(this.isVisible);
}

// State when search results are updated based on a keyword
class SearchResultsUpdated extends ChatState {
  final String searchKeyword;
  final List<ChatMessage> searchResults;
  SearchResultsUpdated(this.searchKeyword, this.searchResults);
}

// State for scrolling to a specific search result index
class SearchScrollToIndexState extends ChatState {
  final int index;
  SearchScrollToIndexState(this.index);
}
class SpeechStatusChanged extends ChatState {
  final String index;
  SpeechStatusChanged(this.index);
}

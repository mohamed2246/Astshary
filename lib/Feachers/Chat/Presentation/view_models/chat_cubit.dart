import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta/meta.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../../main.dart';
import '../../../ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import '../../../FindDoctorView/Data/AllDoctorsSpeCityAreaModel.dart';
import '../../Data/Models/LocationModel.dart';
import '../../Data/Models/document_info.dart';
import '../views/widgets/single_chat_widgets/enum_message_type.dart';
import 'chat_state.dart';
import 'dart:async';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path/path.dart' as path;
import 'package:voice_message_package/voice_message_package.dart';




class ChatCubit extends Cubit<ChatState> {


  ChatCubit() : super(ChatInitial());

  // Load chats and store them in the _chatListItems variable


  // Provide direct access to the chat items






  ////////////// code of chat sessions ////////////////////



  /*SpeechToText _speechToText = SpeechToText();
  bool isListening = false;
  String transcription = "";*/

/*
  Future<bool> initSpeech() async {
    bool available = await _speechToText.initialize(
      onError: (error) {
        print('SpeechToText initialization error: $error');
        emit(SpeechRecognitionError());
      },
      onStatus: (status) {
        print('SpeechToText status: $status');
        emit(SpeechStatusChanged(status));
      },
    );

    if (available) {
      emit(SpeechRecognitionInitialized());
      print('Speech recognition initialized.');
      await listAvailableLocales(); // Optional: Show available locales if needed.
    } else {
      emit(SpeechRecognitionError());
      print('Speech recognition initialization failed.');
    }

    return available;
  }
*/


// Inside ChatCubit class

/*
  Future<void> startListening(TextEditingController controller) async {
    if (!_speechToText.isAvailable) {
      bool available = await initSpeech();
      if (!available) {
        return;  // Exit if initialization fails
      }
    }

    if (!_speechToText.isListening) {
      await _speechToText.listen(
        onResult: (result) {
          // Immediately print the recognized words in real-time
          print('Recognized words: ${result.recognizedWords}');

          // Update the transcription in the text field
          controller.text = result.recognizedWords;
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );

          transcription = result.recognizedWords;  // Store transcription
          emit(SpeechRecognitionResult());
        },
        listenFor: Duration(seconds: 30),  // Adjust listen duration as needed
        pauseFor: Duration(seconds: 3),    // Adjust pause duration as needed
        localeId: 'en_US',                 // Set your preferred locale
      );
      isListening = true;
      emit(SpeechRecognitionStarted());
    }
  }
*/


/*
  Future<void> stopListening() async {
    if (isListening) {
      await _speechToText.stop();
      isListening = false;
      emit(SpeechRecognitionStopped());
      print('Stopped listening.');
    }
  }
*/
  /*void errorListener(SpeechRecognitionError error) {
    print('Error: ${error.errorMsg} - ${error.permanent}');
    emit(SpeechRecognitionError());
  }

  void statusListener(String status) {
    print('Status: $status');
    emit(SpeechStatusChanged(status));
  }*/


/*
  Future<void> listAvailableLocales() async {
    List<LocaleName> locales = await _speechToText.locales();
    print('Available locales:');
    for (var locale in locales) {
      print('${locale.localeId} (${locale.name})');
    }
  }
*/


  static ChatCubit get(context) => BlocProvider.of(context);
  late List<ChatMessage> messages;

  late VoiceController voiceController;

  late bool isBottomAddFiles = false;

  final Map<String, String> videoThumbnails = {};
  final Set<String> _loadingUrls = {}; // Track URLs currently being processed

  void LoadListMessageFromApi() {
    messages =[
      ChatMessage(
        type: MessageType.text, content: " مرحبا بك  , من فضلك اذكر اعراض مرضك ", isSender: false ,isLastMesaage: true  ,
        time: DateTime.now().toString(),
      ),
    ];
  }

  bool isChatTyping = false;
  void ChatTyping(bool isTyping ){
    isChatTyping = isTyping ;
    emit(ChatTypingState());
  }

  Future<void> loadVideoThumbnail(String videoUrl) async {
    // Check if thumbnail is already loaded or being loaded
    if (videoThumbnails.containsKey(videoUrl) ||
        _loadingUrls.contains(videoUrl)) {
      return; // Avoid reloading if already loaded or loading
    }

    _loadingUrls.add(videoUrl); // Mark this URL as loading
    emit(VideoThumbnailLoading());

    String thumbnail = await _generateThumbnail(videoUrl);
    _loadingUrls.remove(videoUrl); // Remove from loading set once done

    if (thumbnail.isNotEmpty) {
      videoThumbnails[videoUrl] = thumbnail; // Store the new thumbnail
      emit(VideoThumbnailLoaded(Map.from(videoThumbnails)));
    } else {
      // Handle the case where thumbnail generation fails
      // For simplicity, we're not changing state, but you might want to handle this differently
    }
  }

  Future<void> uploadMedia(File file, String fileType) async {
    area_id = null ;

    BootTyping = true ;
    emit(uploadMediaLoading());
    try {
      var data = FormData.fromMap({
        'file': [
          await MultipartFile.fromFile(file.path, filename: file.path.split('/').last)
        ],
        'language': 'ar',
      });
      var dio = Dio();

      var response = await dio.post(
        'https://admin.asteshary.com/api/chatbot/upload-medical-file',
        data: data,
        options: Options(
          method: 'POST',
          headers: {
            'Content-Type': 'multipart/form-data',  // Ensure multipart form-data
          },
        ),
      );

      if (response.statusCode == 200) {
        String botResponse = response.data['message'];
        print('botResponse ${botResponse}');
        addBotResponseMessage(botResponse);

      } else {
        BootTyping = false ;

        emit(MessageErrorStateState('Failed to upload file: ${response.statusMessage}'));
      }
    } catch (e) {
      BootTyping = false ;

      emit(MessageErrorStateState('Error uploading file: $e'));
    }
  }

  void addBotResponseMessage(String botResponse) {
    // Add response from bot as a message in the chat
    if (botResponse
        .trim()
        .isEmpty) return; // Avoid sending empty messages

    final newMessage = ChatMessage(
      isLastMesaage: false,

      type: MessageType.text,
      time: DateTime.now().toString(),


      content: botResponse,
      isSender: true,
    );

    messages.insert(0, newMessage); // Add the new message at the beginning of the list


    lastWords ='';
    BootTyping = false ;

    emit(MessageAddedState()); // Emit a state to indicate a new message has been added
  }

  Future<String> _generateThumbnail(String videoUrl) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    String fileName = 'thumb_${path.basenameWithoutExtension(
        videoUrl)}_${DateTime
        .now()
        .millisecondsSinceEpoch}.jpg';

    try {
      String? thumbnailPath = await VideoThumbnail.thumbnailFile(
        video: videoUrl,
        thumbnailPath: tempPath,
        imageFormat: ImageFormat.JPEG,
        maxHeight: 100,
        quality: 75,
      );

      return thumbnailPath ?? '';
    } catch (e) {
      print("Error generating thumbnail: $e");
      return '';
    }
  }

  void pickImageFromCamera() async {
    final permissionStatus = await Permission.camera.status;

    switch (permissionStatus) {
      case PermissionStatus.granted:
        emit(MessageLoadingState()); // Emit loading state before opening camera
        _openCamera();
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
        final requestedPermission = await Permission.camera.request();
        if (requestedPermission.isGranted) {
          emit(MessageLoadingState()); // Emit loading state before opening camera
          _openCamera();
        } else {
          emit(CameraPermissionDenied());
        }
        break;
      case PermissionStatus.permanentlyDenied:
        emit(CameraPermissionPermanentlyDenied());
        break;
      case PermissionStatus.provisional:
      // TODO: Handle this case.
        break;
    }
  }

  void _openCamera() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        addImageMessage([pickedFile.path]);
        File imageFile = File(pickedFile.path);
        uploadMedia(imageFile, 'image');
      } else {
        emit(MessageErrorStateState(
            'No image was selected.')); // Handle case where no image is picked
      }
    } catch (e) {
      emit(MessageErrorStateState(
          'An error occurred while picking the image: $e')); // Emit error state with message
    }
  }

  void toggleBottomAddFiles() {
    isBottomAddFiles = !isBottomAddFiles;
    emit(openBottomAddFilesState());
  }

  void CloseBottomAddFiles() {
    isBottomAddFiles = false;
    emit(openBottomAddFilesState());
  }

/*
  void addImageMessage(String imagePath) {
    try {
      final newMessage = ChatMessage(
        type: MessageType.image,
        content: [imagePath],
        isSender: true,
        ImageFromCamera: true
      );

      print('Before adding, last message is: ${messages.last.content}');
      messages.insert(0 ,newMessage);
      print('After adding, new last message is: ${messages.last.content}');
      emit(MessageAddedState()); // Emit success state with the new message
    } catch (e) {
      emit(MessageErrorStateState('Failed to add image message: $e')); // Emit error state with message
    }
  }
*/


  int formfeildLineLength = 1 ;
  void addImageMessage(List<String> imagePaths) {
    final newMessage = ChatMessage(
        time: DateTime.now().toString(),

        type: MessageType.image,
        isLastMesaage: false,

        content: imagePaths,
        isSender: true,
        ImageFromCamera: true
    );

    messages.insert(
        0, newMessage); // Add the new message at the beginning of the list
    emit(MessageAddedState());
    CloseBottomAddFiles();
  }
  int calculateTextLines(String text , BuildContext context) {
    final span = TextSpan(
      text: text,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter-Regular',
      ),
    );

    final tp = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      maxLines: 5, // Respect maxLines
    );

    tp.layout(
      maxWidth: MediaQuery.of(context).size.width * 0.75, // 75% of screen width
    );
    formfeildLineLength = tp.computeLineMetrics().length ==0 ?1 :tp.computeLineMetrics().length ;

    emit(calculateTextLinesState());
    return tp.computeLineMetrics().length; // Return the number of lines


  }



  void addDocumentMessage(DocumentInfo document) {
    final newMessage = ChatMessage(
      time: DateTime.now().toString(),

      type: MessageType.document,
      content: document,
      isLastMesaage: false,

      isSender: true,
    );

    messages.insert(
        0, newMessage); // Add the new message at the beginning of the list
    emit(MessageAddedState());
    CloseBottomAddFiles();

    // Emit a state to indicate a new message has been added
  }


/*
  void toggleRecording() async {
    if (isRecording) {
      // Stop recording
      final path = await recorderController.stop();
      if (path != null) {
        // Handle the recorded file (send the message, save the file, etc.)
        print("Recording saved: $path");
      }
      isRecording = false;
    } else {
      // Start recording
      isRecording = true;
      recorderController.record();
    }
    emit(RecordingStateChanged(isRecording));
  }
*/
  final TextEditingController chatTextFeildController = TextEditingController();

  bool isRecording = false;
  bool isRecorderInitialized = false;
  RecorderController recorderController = RecorderController();
  Timer? recordingTimer;
  int recordingDuration = 0; // Duration in seconds

  //... existing methods ...

  // Call this method to toggle recording on and off
// Inside ChatCubit class

  void toggleRecording(TextEditingController controller) async {
    if (isRecording) {
      // Stop recording
      stopRecording();
    } else {
      // Start recording with the passed controller
      startRecording(controller);
    }
  }



  void startRecording(TextEditingController controller) async {
    // Request microphone permission before recording
    final permissionStatus = await Permission.microphone.request();
    if (permissionStatus != PermissionStatus.granted) {
      emit(RecordingPermissionDenied());
      return;
    }

    // Initialize speech recognition
/*
    bool available = await initSpeech();
*/
    /*if (!available) {
      print('Speech recognition initialization failed.');
      return;
    }*/

    // Start recording the voice message
/*
    await recorderController.record();
*/
    isRecording = true;
    emit(RecordingStateChanged(isRecording));

    // Start speech recognition and pass the controller to update the text field
/*
    await startListening(controller); // Pass the TextEditingController
*/

    // Initialize the timer to track recording duration
    recordingTimer?.cancel();
    recordingDuration = 0;
    recordingTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      recordingDuration++;
      emit(RecordingDurationChanged(recordingDuration));
    });
  }

  // Update this method with the full implementation for stopping the recording
  void stopRecording() async {
    if (!isRecording) return;

/*
    final path = await recorderController.stop();
*/
    recordingTimer?.cancel();
    isRecording = false;
    emit(RecordingStateChanged(isRecording));

    // Stop speech recognition
/*
    await stopListening();
*/

   /* if (transcription.isNotEmpty) {
      // Send the transcription as a chat message
      sendTextMessage(transcription);
      transcription = ''; // Reset transcription
      print('Final transcription sent: $transcription');
    } else {
      print('No transcription available.');
    }*/
  }

  String formatDuration(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
  Future<void> requestMicrophonePermission() async {
    PermissionStatus status = await Permission.microphone.request();
    if (status.isGranted) {
      print('Microphone permission granted.');
    } else {
      print('Microphone permission denied.');
      emit(RecordingPermissionDenied());
    }
  }

  // Call this method when the delete icon is pressed
  void deleteRecording() async {
    if (!isRecording) return;

/*
    await recorderController.stop();
*/
    isRecording = false;
    recordingTimer?.cancel();
    recordingDuration = 0;
    emit(RecordingDeleted());
  }


/*
  void sendTextMessage(String text) {
    if (text
        .trim()
        .isEmpty) return; // Avoid sending empty messages

    final newMessage = ChatMessage(
      isLastMesaage: false,

      type: MessageType.text,
      time: DateTime.now().toString(),


      content: text,
      isSender: true,
    );

    messages.insert(0, newMessage); // Add the new message at the beginning of the list


    lastWords ='';
    emit(MessageAddedState()); // Emit a state to indicate a new message has been added
  }
*/

  DoctorResponse? doctorSpeCityAreaModel ;

  List<Doctor> doctorsList = [];

  String idCokees  = '7';
  bool BootTyping = false;
  void sendTextMessage(String text) async {
    if (text.trim().isEmpty) return; // Avoid sending empty messages
    doctorsList = [];
    // Add the user's message to the chat list
    final userMessage = ChatMessage(
      isLastMesaage: true,
      type: MessageType.text,
      time: DateTime.now().toString(),
      content: text,
      isSender: true,
    );

    messages.insert(0, userMessage);
    lastWords ='';

    emit(MessageAddedState());

    // Now send the message to the backend
    try {
      // Show a loading indicator if necessary
      BootTyping = true ;
      emit(MessageLoadingState());

      // Prepare headers and data
      var headers = {
        'Cookie': 'specialization_id=${idCokees}',
      };
      var data = FormData.fromMap({
        'symptom': text,
      });

      var dio = Dio();
      var response = await dio.request(
        'https://admin.asteshary.com/api/chatbot/symptom-location',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        // Handle the response
        handleResponse(response.data);
      } else {
        // Handle non-200 responses
        BootTyping = false ;

        emit(MessageErrorStateState('Error: ${response.statusMessage}'));
      }
    } catch (e) {
      // Handle errors
      BootTyping = false ;
      print('An error occurred:${e.toString()}');

      emit(MessageErrorStateState('An error occurred: $e'));
    }
  }
  int? area_id ;
  // Add the handleResponse method
  void handleResponse(Map<String, dynamic> responseData) {
    area_id = null ;
    if (responseData.containsKey('message')) {

      // Extract the message from the response
      String responseMessage = responseData['message'] ?? '';


      // Add the response message to the chat list
      final botMessage = ChatMessage(
        isLastMesaage: false,
        type: MessageType.text,
        time: DateTime.now().toString(),
        content: responseMessage,
        isSender: false,
      );

      messages.insert(0, botMessage);
      BootTyping = false;
      emit(MessageAddedState());


      if (responseData.containsKey('specialization')) {
        print("from specialization");

        // No need to decode here, responseData['specialization'] is already a map
        Map<String, dynamic> specializationData = responseData['specialization'];

        // Add the specialization data to the chat list (optional, if needed)
      /*  final specializationMessage = ChatMessage(
          isLastMesaage: false,
          type: MessageType.text,
          time: DateTime.now().toString(),
          content: specializationData.toString(), // convert Map to String for display (optional)
          isSender: false,
        );
        messages.insert(0, specializationMessage);*/
        BootTyping = false;
        emit(MessageAddedState());

        // Create the Specialization object from the map
        Specialization specialization = Specialization.fromJson(specializationData);
        idCokees = specialization.id.toString();
        print('Specialization: ${specialization}');
        print('Idd: ' + specialization.id.toString());
      }
      // Check if the response contains doctors and store them
      if (responseData.containsKey('area_id') ) {
        print("before");
         area_id = responseData['area_id'];
        String city_id = responseData['city_id'];
        int specialization_id = responseData['specialization_id'] ;

        print('area_id  ${area_id.toString()}');


        SpecialtiesCubit.get(navigatorKey.currentState!.context).selectedAreaId =  area_id    ;
        SpecialtiesCubit.get(navigatorKey.currentState!.context).selectedCityId =int.parse(city_id)  ;
        SpecialtiesCubit.get(navigatorKey.currentState!.context).selectedSpecificationId =specialization_id  ;

        // Emit state to notify about the updated doctors list
        BootTyping = false;

        emit(DoctorsListUpdated());
      } else {
        // Handle the case where 'doctors' is null or not a list
        print('No doctors found or invalid format');
      }
      BootTyping = false;
    }
    else {
      // Handle unexpected response
      BootTyping = false;
      emit(MessageErrorStateState('Unexpected response format.'));
    }
  }


  void addLocationMessage(double latitude, double longitude, String adress) {
    final locationInfo = LocationInfo(
        latitude: latitude, longitude: longitude, static_location: adress);
    final newMessage = ChatMessage(
      time: DateTime.now().toString(),

      isLastMesaage: false,

      type: MessageType.location,
      content: locationInfo,
      isSender: true,
      location: adress,
    );

    messages.insert(
        0, newMessage); // Add the new message at the beginning of the list
    emit(
        MessageAddedState()); // Emit a state to indicate a new message has been added
    CloseBottomAddFiles();
  }

  void addPollMessage(Map<String, dynamic> pollData) {
    final newMessage = ChatMessage(
      time: DateTime.now().toString(),

      isLastMesaage: false,

      type: MessageType.poll,
      content: pollData,
      isSender: true, // Assuming the current user is the sender
    );

    messages.insert(0, newMessage); // Add to the start of the list
    emit(MessageAddedState()); // Emit a state to refresh the UI
    CloseBottomAddFiles();
  }


  bool isEmojiPickerVisible = false;
  final FocusNode chatFocusNode = FocusNode();

  void toggleEmojiPicker() {
    isEmojiPickerVisible = !isEmojiPickerVisible;
    if (isEmojiPickerVisible && chatFocusNode.hasFocus) {
      // If opening the emoji picker and the TextField has focus, unfocus it to close the keyboard
      chatFocusNode.unfocus();
    }

    emit(toggleEmojiPickerState());
  }

  void closeEmojiPicker() {
    isEmojiPickerVisible = false;
    emit(toggleEmojiPickerState());
  }


  // Inside the ChatCubit class

  bool isSearchBarVisible = false;

  void toggleSearchBar() {
    isSearchBarVisible = !isSearchBarVisible;
    if (!isSearchBarVisible) {
      searchKeyword = '';
    }
    emit(SearchBarToggled(isSearchBarVisible));
  }

  String searchKeyword = '';


  int _currentSearchIndex = -1;
  List<int> searchResultIndices = [];
  final ScrollController scrollController = ScrollController(); // Add this line

  void searchMessages(String keyword) {
    if (keyword.isEmpty) {
      searchResultIndices.clear();
      _currentSearchIndex = -1;
    } else {
      searchResultIndices = messages.asMap().entries
          .where((entry) => entry.value.type == MessageType.text &&
          (entry.value.content as String).contains(keyword))
          .map((entry) => entry.key)
          .toList();
    }

    searchKeyword = keyword;
    emit(SearchResultsUpdated(keyword, messages));
  }

  void scrollToNextResult() {
    if (searchResultIndices.isNotEmpty) {
      _currentSearchIndex = (_currentSearchIndex + 1) % searchResultIndices.length;
      emit(SearchScrollToIndexState(searchResultIndices[_currentSearchIndex]));
    }
  }

  void scrollToPreviousResult() {
    if (searchResultIndices.isNotEmpty) {
      _currentSearchIndex = (_currentSearchIndex - 1 + searchResultIndices.length) % searchResultIndices.length;
      emit(SearchScrollToIndexState(searchResultIndices[_currentSearchIndex]));
    }
  }

  void scrollToIndex(int index) {
    final keyContext = messages[index].key.currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: Duration(milliseconds: 300),
        alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
      );
    }
  }

// Add these methods for scrolling


  void handleBackAction(BuildContext context) {
    final chatCubit = ChatCubit.get(context);
    if (chatCubit.isBottomAddFiles) {
      print(
          'Before toggling - isBottomAddFiles: ${chatCubit.isBottomAddFiles}');
      chatCubit
          .toggleBottomAddFiles(); // This should toggle the isBottomAddFiles state
      print('After toggling - isBottomAddFiles: ${chatCubit.isBottomAddFiles}');
      print('Closed bottom files panel');
    } else if (ChatCubit.get(context).isEmojiPickerVisible) {
      ChatCubit.get(context).toggleEmojiPicker();
    }else if (ChatCubit.get(context).isSearchBarVisible){
      ChatCubit.get(context).toggleSearchBar();
    } else {
      print('isBottomAddFiles was already false, navigating back');
      // context.read<BottomNavCubit>().showBottomNavBar();
      Navigator.pop(context);
    }
  }



  Set<int> selectedMessageIndices = {};
  bool isSelectionMode = false;

  void toggleMessageSelection(int index) {
    if (selectedMessageIndices.contains(index)) {
      selectedMessageIndices.remove(index);  // Deselect message
      if (selectedMessageIndices.isEmpty) {
        isSelectionMode = false;  // Exit selection mode if no message is selected
      }
    } else {
      selectedMessageIndices.add(index);  // Select message
      isSelectionMode = true;  // Enter selection mode
    }
    emit(MessageSelectionChanged());
  }

  // Deselect all messages
  void clearSelection() {
    selectedMessageIndices.clear();
    isSelectionMode = false;
    emit(MessageSelectionChanged());
  }

  // Delete selected messages
  /*void deleteSelectedMessages() {
    selectedMessageIndices.forEach((index) {
      messages.removeAt(index);  // Remove selected messages from the list
    });
    clearSelection();  // Clear the selection after deleting
    emit(MessagesDeleted());  // Emit a state to indicate messages were deleted
  }*/

  void deleteSelectedMessages() {
    List<ChatMessage> messagesToRemove = selectedMessageIndices
        .map((index) => messages[index])
        .toList(); // Get messages to remove

    // Remove messages from the list
    messages.removeWhere((message) => messagesToRemove.contains(message));

    // Clear the selection
    clearSelection();

    emit(MessagesDeleted()); // Emit a state to indicate messages were deleted
  }


  //////////////////////////////
  Future<void> requestForPermission() async {
    await Permission.microphone.request();
  }

  final SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = "";
  void listenForPermissions() async {
    final status = await Permission.microphone.status;
    switch (status) {
      case PermissionStatus.denied:
        requestForPermission();
        break;
      case PermissionStatus.granted:
        break;
      case PermissionStatus.limited:
        break;
      case PermissionStatus.permanentlyDenied:
        break;
      case PermissionStatus.restricted:
        break;
    }
  }
  void initSpeech() async {
    speechEnabled = await speechToText.initialize();
  }


  /// Each time to start a speech recognition session
  void startListening() async {
    await speechToText.listen(
      onResult: onSpeechResult,
      listenFor: const Duration(seconds: 30),
      localeId: "ar_SA",
      cancelOnError: false,
      partialResults: false,


      listenMode: ListenMode.dictation,
    );
    emit(SpeechRecognitionStarted());
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void stopListening() async {
    await speechToText.stop();

    if (chatTextFeildController.text.isEmpty) {
      ChatTyping(true);
    }else{
      ChatTyping(false);
    }

    emit(SpeechRecognitionStopped());
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void onSpeechResult(SpeechRecognitionResult result) {
      lastWords = "$lastWords${result.recognizedWords} ";
      textSpeechController.text = lastWords;
      print('lastWords ${lastWords}');
    chatTextFeildController.text = lastWords;
  }

  final TextEditingController textSpeechController = TextEditingController();







}

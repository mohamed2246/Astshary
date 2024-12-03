
part of 'specialties_cubit.dart';

@immutable
abstract class SpecialtiesState {}

class SpecialtiesInitial extends SpecialtiesState {}
class NotificationReceivedState extends SpecialtiesState {
  final RemoteMessage message;

  NotificationReceivedState(this.message);
}



class NotificationClearedState extends SpecialtiesState {}
class updateImageClientState extends SpecialtiesState {}
class SpecialtiesLoading extends SpecialtiesState {}
class resetNotificationsListState extends SpecialtiesState {}
class fetchDoctorFromSpeceficBranchLoading extends SpecialtiesState {}
class setSelectedBranchDoctorDetailsIdState extends SpecialtiesState {}
class fetchDoctorFromSpeceficBranchError extends SpecialtiesState {}
class fetchDoctorFromSpeceficBranchSuccess extends SpecialtiesState {}
class searchApiCitySuccess extends SpecialtiesState {}
class searchApiAreaSuccess extends SpecialtiesState {}




class SpecialtiesNotificationReceived extends SpecialtiesState {
  final RemoteMessage message;
  final bool fromBackground;

  SpecialtiesNotificationReceived({required this.message, required this.fromBackground});
}

class SpecialtiesNotificationCleared extends SpecialtiesState {}

class searchApiCitySuccessError extends SpecialtiesState {}
class searchApiAreaSuccessError extends SpecialtiesState {}
class getLinksFromApiLoading extends SpecialtiesState {}
class getNotificationFromApiLoading extends SpecialtiesState {}
class getNotificationFromApiSuccess extends SpecialtiesState {}
class getNotificationFromApiError extends SpecialtiesState {}
class getLinksFromApiSuccess extends SpecialtiesState {}
class getLinksFromApiError extends SpecialtiesState {}
class setIsCitySearchActiveActive extends SpecialtiesState {}
class searchOnTextSearchChangedState extends SpecialtiesState {}
class setIsCitySearchDisActiveActiveActive extends SpecialtiesState {}
class setIsSpecSearchDisActiveActiveActive extends SpecialtiesState {}
class setIsAreaSearchDisActiveActiveActive extends SpecialtiesState {}
class clearFilterState extends SpecialtiesState {}

class fetchReviewsFromSpeceficBranchLoading extends SpecialtiesState {}
class fetchReviewsFromSpeceficBranchError extends SpecialtiesState {}
class fetchReviewsFromSpeceficBranchSuccess extends SpecialtiesState {}

class fetchAllSepcialistsViewLoading extends SpecialtiesState {}
class fetchAllSepcialistsViewError extends SpecialtiesState {}
class fetchAllSepcialistsViewSuccess extends SpecialtiesState {}
class isAnotherPersonToggleState extends SpecialtiesState {}
class loadDataSharePrefState extends SpecialtiesState {}


class fetchDoctorDetailsLoading extends SpecialtiesState {}
class fetchDoctorDetailsError extends SpecialtiesState {}
class fetchDoctorDetailsSuccess extends SpecialtiesState {}

class fetchInsuranceLoginLoading extends SpecialtiesState {}
class fetchInsuranceLoginError extends SpecialtiesState {}
class fetchInsuranceLoginSuccess extends SpecialtiesState {}

class fetchMyAppointmentsRecervationsLoading extends SpecialtiesState {}
class fetchMyAppointmentsRecervationsError extends SpecialtiesState {}
class fetchMyAppointmentsRecervationsSuccess extends SpecialtiesState {}

class postConfirmationLoading extends SpecialtiesState {}
class postConfirmationError extends SpecialtiesState {}
class postConfirmationSuccess extends SpecialtiesState {}
class refreshState extends SpecialtiesState {}

class postLoginProfileApiLoading extends SpecialtiesState {}
class postLoginProfileApiError extends SpecialtiesState {}
class postLoginProfileApiSuccess extends SpecialtiesState {}


class postEdieteProfileApiLoading extends SpecialtiesState {}
class postEdieteProfileApiError extends SpecialtiesState {}
class postEdieteProfileApiSuccess extends SpecialtiesState {}



class RescadaulAppointmentRecervationsLoading extends SpecialtiesState {}
class RescadaulAppointmentRecervationsError extends SpecialtiesState {}
class RescadaulAppointmentRecervationsSuccess extends SpecialtiesState {}

class fetchMyAppointmentLoading extends SpecialtiesState {}
class fetchMyAppointmentError extends SpecialtiesState {}
class fetchMyAppointmentSuccess extends SpecialtiesState {}
class selectDateState extends SpecialtiesState {}
class setGenderPersonOneState extends SpecialtiesState {}
class setLoginInsuranceLState extends SpecialtiesState {}

class getDoctorsFromSpecCityAreaLoading extends SpecialtiesState {}
class getDoctorsFromSpecCityAreaError extends SpecialtiesState {}
class getDoctorsFromSpecCityAreaSuccess extends SpecialtiesState {}

class fetchSearchDoctorsFilterHomeApiLoading extends SpecialtiesState {}
class fetchSearchDoctorsFilterHomeApiError extends SpecialtiesState {}
class fetchSearchDoctorsFilterHomeApiSuccess extends SpecialtiesState {}
class FetchMyAppointmentLoading extends SpecialtiesState {}
class FetchMyAppointmentSuccess extends SpecialtiesState {}
class FetchMyAppointmentError extends SpecialtiesState {}
class ClinicSelected extends SpecialtiesState {}

class fetchRecentSearchDoctorsLoading extends SpecialtiesState {}
class fetchRecentSearchDoctorsError extends SpecialtiesState {}
class fetchRecentSearchDoctorsSuccess extends SpecialtiesState {}

class getDoctorsSliderLoading extends SpecialtiesState {}
class getDoctorsSliderError extends SpecialtiesState {}
class getDoctorsSliderSuccess extends SpecialtiesState {}

class recentSearchRemoveApiState extends SpecialtiesState {}

class getRecomendationDoctorsLoading extends SpecialtiesState {}
class getRecomendationDoctorsError extends SpecialtiesState {}
class getRecomendationDoctorsSuccess extends SpecialtiesState {}

class fetchAllReviewsLoading extends SpecialtiesState {}
class fetchAllReviewsError extends SpecialtiesState {}
class fetchAllReviewsSuccess extends SpecialtiesState {}
class postNotificationOnOfApiLoading extends SpecialtiesState {}
class postNotificationOnOfApiError extends SpecialtiesState {}
class postNotificationOnOfApiSuccess extends SpecialtiesState {}



class ExpandableState extends SpecialtiesState {}

class fetchClinicsSucess extends SpecialtiesState {}

class chooseBranchState extends SpecialtiesState {
  final int selectedIndex;

   chooseBranchState(this.selectedIndex);
}

class fetchClinicsLoading extends SpecialtiesState {}
class setIsHomeSearchDisActiveActiveActive extends SpecialtiesState {}

class fetchClinicsError extends SpecialtiesState {}

class SpecialtiesCityLoaded extends SpecialtiesState {
  final Map<String, List<city.Cities>> cities;

   SpecialtiesCityLoaded(this.cities);
}

class SpecialtiesCitySelected extends SpecialtiesState {
  final int selectedIndex;

   SpecialtiesCitySelected(this.selectedIndex);
}

class SpecialtiesAreasLoaded extends SpecialtiesState {
  final List<String> areas;

   SpecialtiesAreasLoaded(this.areas);
}

class SpecialtiesCityError extends SpecialtiesState {
  final String message;

   SpecialtiesCityError(this.message);
}

class SpecialtiesAreaError extends SpecialtiesState {
  final String message;

   SpecialtiesAreaError(this.message);
}

class SpecialtiesAreaSelected extends SpecialtiesState {}
class toggleswitchValue1State extends SpecialtiesState {}
class SortSetselectedSpecialIndexState extends SpecialtiesState {}
class SortSetselectedRatingIndexState extends SpecialtiesState {}
class SortSetselectedGenderSortState extends SpecialtiesState {}
class CheckValidePromoCodeLoadingState extends SpecialtiesState {}
class isUsePromoCodeToggleState extends SpecialtiesState {}
class CheckValidePromoCodeSuccessState extends SpecialtiesState {}
class CheckValidePromoCodeErrorState extends SpecialtiesState {}
class SortSetselectedExperienceState extends SpecialtiesState {}
class fetchSearchDoctorsFilterHomeApiNoData extends SpecialtiesState {}

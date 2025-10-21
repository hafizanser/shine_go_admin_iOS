//
//  Constants.swift
//  MYBT
//
//  Created by  on 15/02/2021.
//

import UIKit

typealias EmptyCompletionHandler = (()->())

var isUserLogin : Bool {
    if let val = UserDefaults.standard.value(forKey: UserDefaultKeys.isUserLogin) as? Bool {
        return val
    }
    return false
}


var isGuestUser : Bool {
    if let val = UserDefaults.standard.value(forKey: UserDefaultKeys.isGuestUser) as? Bool {
        return val
    }
    return false
}

var DEVICE_TOKEN : String {
    if let token = UserDefaults.standard.value(forKey: K.KFCM_TOKEN) as? String {
        return token
    }
    return ""
}


struct Storyboards {
    static let MAIN = UIStoryboard(name: "Main", bundle: nil)
    static let ADMIN = UIStoryboard(name: "AdminHome", bundle: nil)
    static let STRIPEACCOUNT = UIStoryboard(name: "StripeAccount", bundle: nil)
    static let WEBVIEW = UIStoryboard(name: "Webview", bundle: nil)
    static let AUTH = UIStoryboard(name: "Auth", bundle: nil)
    static let TUTORIAL = UIStoryboard(name: "Tutorial", bundle: nil)
    static let POPUPS = UIStoryboard(name: "Popups", bundle: nil)
    static let SETTINGS = UIStoryboard(name: "Setting", bundle: nil)

    

}

extension Notification.Name {
    static let DISMISS_POPUP_VC = NSNotification.Name("DISMISS_POPUP_VC")
    static let NETWORK_ARRIVE = NSNotification.Name.init(rawValue: "networkArrive")
    static let NOTIFICATION_CLICK = NSNotification.Name("NOTIFICATION_CLICK")
    static let NEW_GAME_ADDED = NSNotification.Name("NEW_GAME_ADDED")
    static let IAP_PURCHASING_START = NSNotification.Name("IAP_PURCHASING_START")
    static let IAP_PURCHASING_END = NSNotification.Name("IAP_PURCHASING_END")

    static let MESSAGE_RECEIVED = NSNotification.Name("MESSAGE_RECEIVED")
    static let NOTIFICATION_CLICKED = NSNotification.Name("NOTIFICATION_CLICKED")
    static let GET_BOUGHT = NSNotification.Name("GET_BOUGHT")
    static let IS_GUEST_USER = NSNotification.Name("IS_GUEST_USER")

    
    static let START_IAP_PURCHASING_START = NSNotification.Name("START_IAP-PURCHASING_NOTIFICATION")
    
    static let CANECEL_BOUGHT = NSNotification.Name("CANECEL_BOUGHT")
    static let RESTORE_IAP = NSNotification.Name("RESTORE_IAP")
    static let BOUGHT_SUCCESSFULLY = NSNotification.Name("BOUGHT_SUCCESSFULLY")
    static let OPEN_PAY_NOW_VC = NSNotification.Name("OPEN_PAY_NOW_VC")
    static let CANCEL_SUBSCRIPTION = NSNotification.Name("CANCEL_SUBSCRIPTION")
    static let BOUGHT_SUCCESSFULLY_INDIVUAL = NSNotification.Name("BOUGHT_SUCCESSFULLY_INDIVUAL")
    static let START_WRITING = NSNotification.Name("START_WRITING")
    static let END_EDITING = NSNotification.Name("END_EDITING")
    static let DELETE_IMAGE = NSNotification.Name("DELETE_IMAGE")
    static let END_CONTENT_EDITING = NSNotification.Name("END_CONTENT_EDITING")
    static let OPEN_DETAIL_REVIEW_VC = NSNotification.Name("OPEN_DETAIL_REVIEW_VC")
    static let DIVING_SESSION = NSNotification.Name("PassBLEValue")
    static let PASS_BLE_VALUES = NSNotification.Name("PassBLEValueForDivingScreen")
    static let PASS_Graph_VALUES = NSNotification.Name("PassGraphData")

}
struct Icons {
    static let FEAATURED_PRODUCTS_PLACEHOLDER = UIImage(named: "img_featured_products_placeholder")!
    static let LOGO_PLACEHOLDER_DETAILS = UIImage(named: "ic_logo_placeholder_details")!
    static let LOGO_PLACEHOLDER_POSTS = UIImage(named: "ic_logo_placeholder_posts")!
    static let LOGO_PLACEHOLDER_CATEGORIES = UIImage(named: "ic_logo_placeholder_categories")!
    static let BG_RADIO_SELECTED = UIImage(named: "ic_radio_selected")!
    static let TICK_BLUE_SELECTED = UIImage(named: "ic_tick_info")!
    static let PROFILE_PLACEHOLDER = UIImage(named: "ic_profile_placeholder")
    static let BG_RADIO = UIImage(named: "ic_radio")!
    static let BG_SPLASH = UIImage(named: "bg_splash")!
    static let back_icon = UIImage(named: "ic_back")!
    static let BG_PLAN_SELECT = UIImage(named: "bg_plan_select")!
    static let ATTACH_TASK_PLACEHOLDER = UIImage(named: "bg_attach")!
    static let ITEM_PLACEHOLDER = UIImage(named: "placeholder")
    static let PLAN_PLACEHOLDER = UIImage(named: "placeholder_img")
    static let SEARCH_ICON = UIImage(systemName: "magnifyingglass")

    static let BG_LEARNING = UIImage(named: "bg_learning")!
    static let BG_OPTIONS = UIImage(named: "bg_options")!
    static let BG_SAVED_SESSION = UIImage(named: "bg_saved")!
    static let BG_CREATE_SESSION = UIImage(named: "ic_sessions")!

    static let TICK_SELECTED = UIImage(named: "tick_filed")!
    static let TICK_UNSELECTED = UIImage(named: "ic_untick_field")!
    
    static let PLAY_ICON = UIImage(named: "play")!
    static let PAUSE_ICON = UIImage(named: "ic_puse")!

    static let ANSWER_TICK_ICON = UIImage(named: "ic_tick")!
    static let ANSWER_WRONG_ICON = UIImage(named: "ic_cross")!

    static let APPLE = UIImage(named: "apple")!
    static let BANANA = UIImage(named: "banana")!
    static let RECTANGLE_PLACEHOLDER = UIImage(named: "profile_placeholders")
    static let FLAG_PLACEHOLDER = UIImage(named: "ic_flag_australia")!

    
}

struct Fonts {
    static let SARABUN_MED_12 = UIFont(name: "Sarabun-Medium", size: 12)
    static let MONTSERRAT_REGULAR_20 = UIFont(name: "Montserrat-Regular", size: 20)!
    static let MY_RIAD_REGULAR = UIFont(name: "Galvgi", size: 19.0)
    static let MY_RIAD_REGULAR_19 = UIFont(name: "MyriadPro-Regular", size: 19.0)
    static let MY_RIAD_REGULAR_20 = UIFont(name: "MyriadPro-Regular", size: 20.0)
    static let MY_RIAD_REGULAR_21 = UIFont(name: "MyriadPro-Regular", size: 21.0)
    static let MY_RIAD_REGULAR_22 = UIFont(name: "MyriadPro-Regular", size: 22.0)
    static let MY_RIAD_REGULAR_23 = UIFont(name: "MyriadPro-Regular", size: 23.0)
    static let MY_RIAD_REGULAR_24 = UIFont(name: "MyriadPro-Regular", size: 24.0)
    
    static let POPPINS_MEDIUM_TWO = UIFont(name: "Poppins-Medium", size: 13.2)
    static let POPPINS_REGULAR = UIFont(name: "Poppins-Regular", size: 13.2)
    static let POPPINS_MEDIUM = UIFont(name: "Poppins-Medium", size: 15.2)
    static let POPPINS_SEMIBOLD = UIFont(name: "Poppins-Medium", size: 15.2)
    static let POPPINS_SEMIBOLD_11 = UIFont(name: "Poppins-SemiBold", size: 11.2)
    static let POPPINS_REGULAR_11 = UIFont(name: "Poppins-Regular", size: 11.2)

    static let MONTSERRAT_MEDIUM_12 = UIFont(name: "Montserrat-Medium", size: 12)
    static let MONTSERRAT_BOLD_16 = UIFont(name: "Montserrat-Bold", size: 16)
    static let MONTSERRAT_MEDIUM_4 = UIFont(name: "Montserrat-Medium", size: 6)

    static let ROBOTO_MED_12 = UIFont(name: "Roboto-SemiBold", size: 12)


}



struct K {
    static let CREATOR_SUBSCRIPTION_PLAN_ID = "price_1JSYaQFeIF6WMynjPMdqTFBs"
    static let PUBLISH_WORKOUT_VISIBILITY_PUBLIC = "public"
    static let PUBLISH_WORKOUT_VISIBILITY_PRIVATE = "private"
    static let PRIVACY_POLICY = "https://www.bioceuticamilano.com/policies/privacy-policy"
    static let TERMS_N_CONDITIONS = "https://www.bioceuticamilano.com/policies/terms-of-service"
    static let REFUND_POLICY = "https://www.bioceuticamilano.com/policies/refund-policy"
    static let OUR_WEBSITE = "https://www.bioceuticamilano.com"
    static let FAQ = "https://www.bioceuticamilano.com/pages/faq"
    static let SHIPPING_POLICY = "https://www.bioceuticamilano.com/policies/shipping-policy"
    static let WRITE_MESSAGE = "Message"
    static let SUPPORT_WHATSAPP = "+923124361300"

    static let ABOUT_US = "https://gainlyapp.com/about/"
    static let ADVERTISEMENT_URL = "https://www.ikincieldenal.com/ilan-verme-kurallari-2"
    static let CARD_ADDEDD_SUCCESS = "Card has been added successfuly"
    static let AD_DESCRIPTION = "Write Ad Description"
    static let ANNOUNCEMENT_NOTES = "Write Announcement Notes"
    static let MEDIA_FILE_KEY = "photos[]"
    static let Terms_Conditions = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    static let Privacy_Policy = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    static let Platform_Rules = "1.    Respectful Conduct:\n\t→    Users must maintain respect when discussing or reviewing purchased itineraries.\n\t→    Any feedback or comments should be constructive and polite.\n\n2.    Content Guidelines:\n\t→    Content related to custom-made itineraries should adhere to community standards.\n\t→    Subscriptions provide enhanced features; users should respect terms outlined in their subscription plans.\n\n3.    Intellectual Property:\n\t→    Users should not share or distribute custom itineraries obtained through the app without proper authorization.\n\t→    Respect copyrights and trademarks related to location features.\n\n4.    Security Measures:\n\t→    Users must not attempt to manipulate location features for fraudulent activities.\n\t→    Protect personal information when using location-based services.\n\n5.    Privacy Protection:\n\t→    Custom itineraries may involve personal preferences; users must not disclose others’ preferences without consent.\n\t→    Location information is sensitive; its usage is subject to strict privacy protection.\n\n6.    Spam and Misleading Content:\n\t→    Advertisements for custom itineraries or subscriptions should be transparent and not misleading.\n\t→    Users should not spam others with promotional content related to locations or subscriptions.\n\n7.    User Engagement:\n\t→    Encourage users to share positive experiences with purchased itineraries.\n\t→    Foster a community that discusses travel and location-based experiences in a supportive manner.\n\n8.    Compliance with Laws:\n\t→    Purchases and subscriptions must comply with relevant consumer protection laws.\n\t→    Location features should adhere to privacy laws and regulations.\n\n9.    Reporting Violations:\n\t→    Users are encouraged to report any misuse of location features or inappropriate content related to custom itineraries.\n\t→    The app will promptly investigate and address reported violations.\n\n10.    Updates and Changes:\n\t→    Changes to location features, subscription plans, or purchasing options will be communicated to users.\n\t→    Users should stay informed about updates to ensure a seamless experience with custom itineraries and subscriptions."
    static let Data_Privacy = "Manchester is a vibrant city located in the northwest of England, known for its rich industrial heritage, diverse culture, and thriving arts and music scenes. It's one of the largest and most populous cities in the United Kingdom, often regarded as the unofficial capital of the North."
    static let Subscription = "Manchester is a vibrant city located in the northwest of England, known for its rich industrial heritage, diverse culture, and thriving arts and music scenes. It's one of the largest and most populous cities in the United Kingdom, often regarded as the unofficial capital of the North."
    static let WRITE_DESCRIPTION = "Write Description here..."
    static let EMPTY_FEEDBACK = "Please Enter Feedback."
    static let SAVED_SUCCESSFULLY = "Your ad has been successfully saved as an unpublished draft"


    
    static let ENTER_CONTENT_TEST = "Enter Content"

    static let AVAILABLE_TO_SUBSCRIBER = "0"
    static let AVAILABLE_TO_BUY = "0"
    static let GENDER_TYPE = ["Male","Female","Non-Binary","Transgender","Intersex","I prefer not to say"]
    static let SOCIAL_MEDIA_PLATFORM = ["Facebook","Whatsapp","Youtube","Instagram","TikTok","Snapchat","Pinterest","Reddit","LinkedIn","Twitter"]
    
    static let WATER_DEPTH_ARRAY = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40"]
    
    static let OXYGEN_ARRAY = ["21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40"]
    
    static let WEBSITE_SPECIFIC_KEY = "watchgang.com"
    
    
    static let PUBLISH_WORKOUT_SUBSCRIPTION_NONE = "none"
    static let PUBLISH_WORKOUT_SUBSCRIPTION_ONE_TIME = "one-time"
    static let PUBLISH_WORKOUT_SUBSCRIPTION_SUBSCRIPTION = "subscription"
    
    static let PLACE_HOLDER_QUESTION = "Choose from the list or write here.."
    static let PLACE_HOLDER_GOAL = "What's your goal"

    
    static let URL_SCHEME_KEY = "com.epcards.ep.payments"
    static let FREE_PLAN_ID = "price_000000000000000000000000"
    static let EXPIRED_THREE_DAYS_FREE_TRIAL = "Your 3 days free trial has been expired. Subscribe to a plan to continue using Sense2Cents application."
    static let LOADING_KEY = "loading..."
    static let ALERT = "Alert"
    static let OK = "OK"
    static let TASK_TITLE = "Please enter task title."
    static let TASK_IMAGE = "Please attach task image."
    static let TASK_PRICE = "Please enter price."
    static let TASK_DATE_TIME = "Please choose task date & time."
    static let TASK_ADD_CHILD = "Please add a child."
    static let CANCEL_SUBSCRIPTION = "Are you sure you want to cancel creator subscription? After cancellation you will lose access to the creator function."
    static let HANG_ON = "Hang On!"
    static let HOLD_ON = "Hold On!"
    static let IMAGE = "image"
    static let TAX_IMAGE = "tex_certificate"

    
    static let SUBMIT_TASK_IMAGE = "task_complete_image"
    static let ERROR = "Error"
    static let ARE_YOU_SURE = "Are you sure?"
    static let EMPTY_DONATE_COMPANY = "Please choose the donate organization"
    static let SUCCESS = "Success"
    static let API_BASE_URL_TYPE = "APIBaseURLType"
    static let DEVICE_TOKEN = "deviceToken"
    static let KFCM_TOKEN = "fcmToken"
    static let MESSAGE_ID = "gcm.message_ID"
    static let CANCEL_TEXT = "Cancel"
    static let SETTINGS_TEXT = "Settings"
    static let NOTIFICATION_COUNT_KEY = "NOTIFICATION_COUNT"
    static let NAME_KEY = "name"
    static let IMAGE_URL = "imageUrl"
    static let TEXT = "text"
    static let TYPE_KEY = "type"
    static let TYPE_ID_KEY = "typeId"
    static let DATA = "data"
    static let IS_READ = "isRead"
    static let SENDER_ID = "senderId"
    static let LATITUDE = "latitude"
    static let LONGITUDE = "longitude"
    static let EGIFT_CARD_MODEL = "eGiftCardModel"
    static let NOTIFICATION_USERINFO = "notificationUserInfo"
    static let TRUE = "true"
    static let FALSE = "false"
    static let SELECTED_MY_CARDS_TAB = "selectedMyCardsTab"
    static let IS_CONNECTED = "isConnected"
    static let IS_DARK_THEME_KEY = "isDarkTheme"
    static let PROFILE_PICTURE = "profilePicture"
    static let SUPPORT_PHONE_NUMBER_ABROAD = "9723386714"


}

struct UserDefaultKeys {
    static let isUserLogin = "isUserLogin"
    static let isGuestUser = "isGuestUser"
    
    static let currentCityID = "currentCityID"
    static let selectedCityID = "selectedCityID"

    static let simpleCoupon = "simpleCoupon"
    static let simpleDiscount = "simpleDiscount"
    
    static let subscriptionCoupon = "subscriptionCoupon"
    static let subscriptionDiscount = "subscriptionDiscount"
    static let isLive = "isLive"
    static let USER_DEFAULT = UserDefaults.standard
    
    static let email = "email"
    static let popUpOpened = "popUpOpened"
    static let isRateOurAppDone = "isRateOurAppDone"

    static let name = "name"
    static let isSubscribed = "isSubscribed"
    static let subscriptionType = "subscriptionType"
    static let subscriptionID = "subscriptionID"

    static let isTutorialOpened = "isTutorialOpened"

    static let id = "id"
    static let memberUniqueId = "memberUniqueId"
    static let emailD = "email"
    static let nameD = "name"
    static let googleId = "googleId"
    static let facebookId = "facebookId"
    static let appleId = "appleId"
    static let divingMode = "divingMode"
    static let divingType = "divingType"
    static let divingLevel = "divingLevel"
    static let profilePhoto = "profilePhoto"
    static let currentAddress = "currentAddress"
    static let currentLat = "currentLat"
    static let currentLng = "currentLng"
    static let isMailConfirm = "isMailConfirm"
    static let loginLimit = "loginLimit"
    static let isEnabled = "isEnabled"
    static let isTemporaryPassword = "isTemporaryPassword"
    static let languageId = "languageId"
    static let unitId = "unitId"
    static let activityMedalId = "activityMedalId"
    static let CURRENT_BUYING_ID = "CURRENT_BUYING_ID"
    static let CURRENT_BUYING_SUBSSCRIPTION_ID = "CURRENT_BUYING_SUBSSCRIPTION_ID"
    static let CURRENT_BUYING_IAP_ID = "CURRENT_BUYING_IAP_ID"
    static let IS_SOCIAL_LOGIN = "isSocialLogin"
    static let PACKAGE_BOUGHT_ID = "packageBoughtId"
    static let GPS_PERMISSION = "gps_permission"
    static let PROJECT_ID = "PROJECT_ID"
    static let SELECTED_PROJECT = "SELECTED_PROJECT"

}


struct DateFormats {
    static let yyyyMMdd = "yyyy/MM/dd"
    static let MMMMdyyyy = "MMMM d, yyyy"
    static let MMMddyyyy = "MMM dd, yyyy"
    static let MMyy = "MM/yy"
    static let yyyy_MM_dd = "yyyy-MM-dd"
    static let EMMMdyyyy = "E, MMM d, yyyy"
    static let MMMdyyyy = "MMM d, yyyy"
    static let MMMd = "MMM d"
    static let dMMMMyyy = "d MMMM yyyy"
    static let mm_dd_yyyy = "MM-dd-yyyy"
    static let TIME_FORMAT = "h:mm a"
    static let yyyy_MM_dd_T_HH_mm = "yyyy-MM-dd'T'HH:mm"
    static let DATE_TIME_FORMAT = "yyyy-MM-dd'T'HH:mm:ss"
    static let MY_CARDS_DATE_FORMAT = "MMM dd, yyyy - hh:mm a"
    static let EN_US_POSIX = Locale(identifier: "en_US_POSIX")
    static let UTC_TIME_ZONE = TimeZone(abbreviation: "UTC")
    static let MONTH_FORMAT = "MM"
    static let YEAR_FORMAT = "yyyy"
}




struct Alerts {
    static let OTP_VALIDATION = "Please enter a valid OTP with exactly 6 digits."
    static let LOG_OUT = "Are you sure you want to Logout."
    static let EMPTY_PAYMENT_METHOD = "Please add the payment method."
    static let EMPTY_FEEDBACK = "Please Enter Feedback."
    static let EMPTY_COMPANY_NAME = "Please Enter You Company Name."
    static let EMPTY_Email_Address = "Please enter E-Mail Addres."
    static let EMPTY_CARD_DATA = "Please Add Credit Card."
    static let EMPTY_PROVINCE_TYPE = "Please Choose Province."
    static let GO_BACK = "Are You Sure You Want To Go Back?"
    static let UNFVRT = "Are You Sure You Want To Un-Favourite this Ad?"
    static let REMOVE_POST_FROM_FOLDER = "Are You Sure You Want To Remove this Ad From Folder?"
    static let EMPTY_CATEGORY_TYPE = "Please Choose Category."
    static let EMPTY_TAX_IMAGE = "Please Upload Tax Certificate Image."
    static let EMPTY_ADDRESS = "Please Enter You Address."
    static let EMPTY_TAX_ID = "Please Enter Tax ID."
    static let SUBSCRIPTION = "To manage this, you must first acquire a subscription."
    static let DELETE_ACC = "Are You Sure You Want To Delete Your Account?"
    static let EMPTY_CONFIRM_PASSWORD = "Please re-enter to confirm your Password."
    static let EMPTY_IMAGES = "Please Upload All the Images"
    static let EMPTY_CONTENT = "Please Enter Content"
    static let EMPTY_INQUIRY_TYPE = "Please Select Inquiry Type"
    static let EMPTY_CARD_TITLE = "Please Enter Card Title"
    static let EMPTY_CARD_Number = "Please Enter Card Number"
    static let CARD_LENGTH_VALIDATION = "Card Number Must Equal to 12 Digits."
    static let EMPTY_CARD_HOLDERNAME = "Please Enter Card Holder Name"
    static let EMPTY_EXPIRY = "Please Enter Card Expiry"
    static let CHOOSE_EXPIRY = "Please Choose Expiry Date"
    static let EMPTY_CVV = "Please Enter Card CVV"
    static let EMPTY_POSTAL_CODE = "Please Enter Postal Code"
    static let VALID_EMAIL = "Please enter a valid E-Mail Address."
    static let EMPTY_PHONE_NUMBER = "Please Enter Phone Number."
    static let PHONE_NUMBER_LENGTH_VALIDATION = "Please Enter A Valid Phone Number."
    static let EMPTY_OTP = "Please Enter OTP."
    static let OTP_LENGHT_VALIDATION = "OTP Must be Equal to 6 Digits."
    static let EMPTY_TR_ID_NUMBER = "Please Enter Phone Number."
    static let EMPTY_PROVICE = "Please Enter Phone Number."
    
    static let EMPTY_COUNTRY_CODE = "Please Enter Country Code."
    static let EMPTY_VERIFICATION_CODE = "Please Enter Valid Code."
    static let EMPTY_PASSWORD = "Please Enter Password."
    static let EMPTY_CURRENT_PASSWORD = "Please Enter currrent password."
    static let EMPTY_CONFIRM_NEW_PASSWORD = "Please Enter confirm new Password."
    static let DONT_MATCH_PASSWORD = "Your Password Doesn't Match."
    static let EMPTY_PLAN_NAME = "Please Enter Plan Name."
    static let EMPTY_FOLDER_NAME = "Please Enter Folder Name."
    static let EMPTY_SITUATION_NAME = "Please Enter Situation Name."
    static let VALID_PASSWORD = "Password must contain at least one uppercase letter, one number, and one special character."
    static let EMPTY_MESSAGE = "Please Enter Message."

    static let EMPTY_PERCENTAGE_OFF = "Please Enter Percentage off %."
    static let EMPTY_PROMO_CODE = "Please Enter Promo Code."
    static let PROMO_CODE_INVALID = "Please Enter valid Promo Code."
    static let EMPTY_PROMO_CODE_START = "Please Enter Promo Start Date."
    static let EMPTY_PROMO_CODE_END = "Please Enter Promo End Date."
    static let EMPTY_USERNAME = "Please Enter Uusername."
    static let EMPTY_OLD_PASSWORD = "Please Enter old Password."
    static let EMPTY_NEW_PASSWORD = "Please Enter new Password."
    static let PASSWORD_NOT_MATCH = "Password not match."
    static let NUMBER_NOT_MATCH = "Phone Number not match."
    static let POSTAL_CODE_LENGTH_VALIDATION = "Password Must Equal or Greater than 8 Characters."
    static let PASSWORD_LENGTH_VALIDATION = "Password Must Equal or Greater than 8 Characters."
    static let CONFIRM_PASSWORD_LENGTH_VALIDATION = "Password Must Equal or Greater than 8 Characters."
    static let TR_ID_LENGTH_VALIDATION = "Password Must Equal or Greater than 8 Characters."
    static let PASSWORD_LENGTH_CURRENT_VALIDATION = "Current Password Must Equal or Greater than 8 Characters."
    static let PASSWORD_LENGTH_NEW_VALIDATION = "New Password Must Equal or Greater than 8 Characters."
    static let PASSWORD_LENGTH_CONFRIM_NEW_VALIDATION = "Confrim New Password Must Equal or Greater than 8 Characters."
    static let NUMBER_LENGTH_VALIDATION = "Please Enter Valid Phone Number."
    static let EMPTY_NAME = "Please Enter Name."
    static let EMPTY_CHILD_NAME = "Please Enter Child NickName."
    static let EMPTY_FULL_NAME = "Please Enter FullName."
    static let EMPTY_FIRST_NAME = "Please Enter First Name."
    static let EMPTY_LAST_NAME = "Please Enter Last Name."
    static let EMPTY_EMAIL_ADDRESS = "Please Enter Email."
    static let EMPTY_TAG_IDENTIFIER = "Please Enter Identifier."
    static let EMPTY_PLAN_SUBSCRIPTION_FEES = "Please Enter Monthly Subscription Fees."
    static let EMPTY_WORKOUT_NAME = "Please Enter Workout Name."
    static let EMPTY_PROJECT_NAME = "Please Enter Project Name."
    static let EMPTY_COLOR_NAME = "Please Choose Color."
    static let EMPTY_ICON_NAME = "Please Choose Icon."

    static let EMPTY_MEMBERSHIP_TYPE = "Please Choose Membership Type."
    static let EMPTY_AD_TITLE = "Please Enter Advertisement Title."
    static let EMPTY_AD_DESCRIPTION = "Please Enter Advertisement Description."
    static let EMPTY_AD_PRICE = "Please Enter Advertisement Price."
    static let EMPTY_AD_SITUATION = "Please Choose Product Situation."
    static let EMPTY_AD_URL = "Please Add Advertisement Youtube Video URL."
    static let EMPTY_AD_ANNOUNCEMENT_NOTES = "Please Enter Announcement Notes."
    static let EMPTY_AD_ADDRESS = "Please Enter Address."
    static let EMPTY_AD_PHOTOS = "Please Add Advertisement Photos."

    static let EMPTY_AD_ADVERTISING_RULE = "Please Approve Advertisement Rules."

    static let EMPTY_WORKOUT_CATEGORY_NAME = "Please Enter Custom Category Name."
    static let EMPTY_WORKOUT_EXCERCISE_NAME = "Please Enter Custom Exercise Name."
    static let EMPTY_WORKOUT_DESCRIPTION = "Please Enter Workout Description."
    static let EMPTY_WORKOUT_CATEGORY_DESCRIPTION = "Please Enter Description."
    static let EMPTY_FOLDER_DESCRIPTION = "Please Enter Folder Description."
    static let EMPTY_PRICE = "Please Enter Price."
    static let EMPTY_EQUIPMENTS = "Please select the types of equipment that might be used in this plan."
    static let NO_UPLOAD_IMAGE = "Please Upload Workout Image."
    static let NO_UPLOAD_IMAGE_CATEGORY = "Please Upload Image."
    
    static let EMPTY_PROMO_PERCENTAGE = "Please enter Promo Percentage."
    static let EMPTY_PROMO_START_DATE = "Please enter Promo Start Date."
    static let EMPTY_PROMO_END_DATE = "Please enter Promo End Date."

    static let EMPTY_CARD_NUMBER  = "Please Enter Your Card Numbers."
        static let EMPTY_CARD_HOLDER  = "Please Enter Your Card Holder Name."
        static let EMPTY_CARD_EXPIRY  = "Please Enter Expiration Date."
        static let EMPTY_CARD_CVV  = "Please Enter 3 Digits Back On the Card."
        static let EMPTY_CARD_HOLDER_NAME  = "Please Enter Name On the Card."
        static let EMPTY_ZIP_CODE  = "Please Enter Zip Code."
    static let EMPTY_WEIGHT = "Please enter weight in pounds."
    static let EMPTY_REPTYPE = "Please enter REPS value."
    static let EMPTY_REPTYPE_TYPE = "Please choose REPS Type."
    
    static let EMPTY_DISTANCE = "Please Enter Distance."

    
    static let EMPTY_GENDER = "Please Enter Gender."
    static let EMPTY_DOB = "Please Enter date of birth."
    static let EMPTY_COUNTRY = "Please Enter Country."
    static let EMPTY_CITY = "Please Enter City."

    static let EMPTY_TITLE = "Please Enter Title"

    
    static let UPLOAD_MEDIA_ERROR = "Please Upload photo"
    static let UPLOAD_MEDIA_UPLOAD_WAIT_ERROR = "Wait, your media is still uploading..."
    static let CAMERA_NOT_SUPPORTED_TEXT = "Camera not supported"
    static let CAMERA_PRIVACY_SETTINGS_TEXT = "To enable access, go to Settings > Privacy > Camera and turn on Camera access for this app."
    static let INVALID_CODE_PLEASE_ENTER_CODE_TEXT = "Invalid code. Please enter correct code"
    static let NOT_AVAILABLE_BALANCE = "The amount you are requesting to transfer is greater than your available balance."
    static let NO_CHILD_IMAGE = "Please add child image or avatar."
    static let NO_MEMBER_IMAGE = "Please add image or avatar."
    static let UPDATE_PROFILE = "Profile updated successfully"
    static let LAST_ACCOUNT = "You cannot delete the last account."
    
}


struct Colors {

    static let GRAY_TEXT = UIColor(named: "dim_text")!
    static let PASSWORD_GRAY_COLOR = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
    static let TABBAR_GRAY_COLOR = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
    static let WHITE_COLOR = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let GRAY_COLOR = #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.7647058824, alpha: 1)
    static let DARK_GREY = #colorLiteral(red: 0.4235294118, green: 0.4235294118, blue: 0.4235294118, alpha: 1)
    static let BLACK_COLOR = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    static let UNSELECTED_TABBAR = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
    static let TEXTFIELD_UNSELECTED_COLOR = #colorLiteral(red: 0.7176470588, green: 0.7176470588, blue: 0.7176470588, alpha: 1)
    static let TEXTFIELD_SELECTED_COLOR = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    static let FULL_BLACK_COLOR = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    static let BORDER_COLOR = #colorLiteral(red: 0.7450980392, green: 0.7450980392, blue: 0.7450980392, alpha: 1)
    static let PLACEHOLDER_COLOR = #colorLiteral(red: 0.5176470588, green: 0.5176470588, blue: 0.5176470588, alpha: 1)

    static let BORDER_COLOR_POPUP = #colorLiteral(red: 0.8078431373, green: 0.831372549, blue: 0.8549019608, alpha: 1)
    static let BASE_COLOR_PINK = #colorLiteral(red: 0.8745098039, green: 0.2078431373, blue: 0.5098039216, alpha: 1)
    static let BLUE_COLOR_APP = #colorLiteral(red: 0.09803921569, green: 0.5529411765, blue: 0.9803921569, alpha: 1)

    static let SELECTED_COLOR = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    static let UNSELECTED_COLOR = #colorLiteral(red: 0.5254901961, green: 0.5568627451, blue: 0.5882352941, alpha: 1)

    static let UNSELECTED_COLOR_VIEW = #colorLiteral(red: 0.8705882353, green: 0.8862745098, blue: 0.9019607843, alpha: 1)
    
    static let GRAY_06 = #colorLiteral(red: 0.5960784314, green: 0.6352941176, blue: 0.7019607843, alpha: 1)
    static let GRAY_05 = #colorLiteral(red: 0.8078431373, green: 0.831372549, blue: 0.8549019608, alpha: 1)
    static let GRAY_10 = #colorLiteral(red: 0.1294117647, green: 0.1450980392, blue: 0.1607843137, alpha: 1)

    static let GRAY_02 = #colorLiteral(red: 0.9450980392, green: 0.9529411765, blue: 0.9607843137, alpha: 1)
    static let GRAY_07 = #colorLiteral(red: 0.5254901961, green: 0.5568627451, blue: 0.5882352941, alpha: 1)
    static let GRAY_08 = #colorLiteral(red: 0.2862745098, green: 0.3137254902, blue: 0.3411764706, alpha: 1)
    static let Blue_07 = #colorLiteral(red: 0.09803921569, green: 0.5529411765, blue: 0.9803921569, alpha: 1)
    
    
    static let STEP_GRAY_COLOR = #colorLiteral(red: 0.7803921569, green: 0.7921568627, blue: 0.8078431373, alpha: 1)
    static let BUTTON_TITLE_UNSELCTED = #colorLiteral(red: 0.6901960784, green: 0.6901960784, blue: 0.6901960784, alpha: 1)
    static let GRAY_HEADER_SUDS = #colorLiteral(red: 0.7254901961, green: 0.7254901961, blue: 0.7254901961, alpha: 1)
    static let PURPLE_HEADER_SUDS = #colorLiteral(red: 0.3647058824, green: 0.1058823529, blue: 1, alpha: 1)
    static let GRAY_UNSELECTED_SUDS = #colorLiteral(red: 0.8705882353, green: 0.8862745098, blue: 0.9098039216, alpha: 1)
    static let GRAY_BASE_COLOR = #colorLiteral(red: 0.5490196078, green: 0.5764705882, blue: 0.6745098039, alpha: 1)
    static let BUTTON_UNSELECTED_QR = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
    
    static let BASE_COLOR_RED = #colorLiteral(red: 0.9960784314, green: 0, blue: 0.1411764706, alpha: 1)
    static let BASE_COLOR_BLUE = #colorLiteral(red: 0.07450980392, green: 0.4274509804, blue: 0.7176470588, alpha: 1)
    static let BORDER_COLOR_GRAY = #colorLiteral(red: 0.568627451, green: 0.568627451, blue: 0.568627451, alpha: 1)
    static let BASE_COLOR_GRAY = #colorLiteral(red: 0.5490196078, green: 0.5764705882, blue: 0.6745098039, alpha: 1)
    static let BASE_COLOR_LIGHT_BLACK = #colorLiteral(red: 0.06274509804, green: 0.07450980392, blue: 0.1490196078, alpha: 0.64)
    static let BASE_COLOR_BLACK = #colorLiteral(red: 0.06274509804, green: 0.07450980392, blue: 0.1490196078, alpha: 1)
    static let BASE_COLOR_GREEN = #colorLiteral(red: 0.2196078431, green: 0.6156862745, blue: 0.4117647059, alpha: 1)

// static let BORDER_COLOR_GRAY = #colorLiteral(red: 0.568627451, green: 0.568627451, blue: 0.568627451, alpha: 1)
    
    static let GRAY_01 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

    static let VOILET_01 = #colorLiteral(red: 0.2549019608, green: 0.1019607843, blue: 0.6156862745, alpha: 1)
    static let ERROR_STATUS = #colorLiteral(red: 1, green: 0.2039215686, blue: 0.2039215686, alpha: 1)


    
    static let BROWN_COLOR = #colorLiteral(red: 0.5176470588, green: 0.2196078431, blue: 0, alpha: 1)
    static let ORANGE_COLOR = #colorLiteral(red: 1, green: 0.4235294118, blue: 0, alpha: 1)
    static let GOLDEN_COLORS = #colorLiteral(red: 0.9725490196, green: 0.6274509804, blue: 0.1411764706, alpha: 1)
    static let YELLOW_COLOR = #colorLiteral(red: 0.9921568627, green: 0.768627451, blue: 0.2156862745, alpha: 1)
    static let LIGHT_YELLOW_COLOR = #colorLiteral(red: 1, green: 0.8274509804, blue: 0.4392156863, alpha: 1)
    static let CHARDON_COLOR = #colorLiteral(red: 1, green: 0.9215686275, blue: 0.8666666667, alpha: 1)
    static let BLUE_COLOR = #colorLiteral(red: 0.1098039216, green: 0.2274509804, blue: 0.462745098, alpha: 1)

    static let RED_COLOR = #colorLiteral(red: 0.7098039216, green: 0.1921568627, blue: 0.2431372549, alpha: 1)
    static let LIGHT_RED_COLOR = #colorLiteral(red: 0.9882352941, green: 0.3294117647, blue: 0.3294117647, alpha: 1)
    static let GREEN_COLOR = #colorLiteral(red: 0, green: 0.7333333333, blue: 0.2549019608, alpha: 1)
    static let SKY_BLUE_COLOR = #colorLiteral(red: 0.3137254902, green: 0.9254901961, blue: 0.9333333333, alpha: 1)
    static let YELLOW_ORANGE_COLOR = #colorLiteral(red: 1, green: 0.7215686275, blue: 0.5176470588, alpha: 1)
    static let DARK_YELLOW_COLOR = #colorLiteral(red: 0, green: 0.4170854986, blue: 0.5711632371, alpha: 1)
    static let GRAPH_COLOR = #colorLiteral(red: 0.3960784314, green: 0.462745098, blue: 1, alpha: 1)
    static let LIGHT_GRAY_COLOR = #colorLiteral(red: 0.8666666667, green: 0.8784313725, blue: 0.8941176471, alpha: 1)
    static let BUTTON_THEME_COLOR = #colorLiteral(red: 0.9450980392, green: 0.431372549, blue: 0.1333333333, alpha: 1)
    static let BUTTON_UNSELECTED_COLOR = #colorLiteral(red: 0.5058823529, green: 0.5176470588, blue: 0.5294117647, alpha: 1)
    
    static let BUTTON_THEME_UNSELECTED_COLOR = #colorLiteral(red: 0.5647058824, green: 0.5647058824, blue: 0.5647058824, alpha: 1)
    static let BUTTON_APP_THEME_COLOR = #colorLiteral(red: 0.2352941176, green: 0.462745098, blue: 0.6901960784, alpha: 1)
    
    static let BUTTON_APP_TITLE_COLOR = #colorLiteral(red: 0.1529411765, green: 0.5529411765, blue: 0.7843137255, alpha: 1)
    
    
    
    
    static let BUTTON_ALL_PLAN_UNSELECTED_COLORS = #colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.3921568627, alpha: 1)
    static let BUTTON_ALL_PLAN_UNSELECTED_TITLE_COLORS = #colorLiteral(red: 0.6745098039, green: 0.662745098, blue: 0.6588235294, alpha: 1)
    
    
    static let SUBSCRIPTION_PLAN_1_COLOR = #colorLiteral(red: 0.6039215686, green: 0.7333333333, blue: 0.2235294118, alpha: 1)
    static let SUBSCRIPTION_PLAN_2_COLOR = #colorLiteral(red: 0.337254902, green: 0.6823529412, blue: 0.7490196078, alpha: 1)
    static let SUBSCRIPTION_PLAN_3_COLOR = #colorLiteral(red: 0.8901960784, green: 0.4549019608, blue: 0.2196078431, alpha: 1)
    static let SUBSCRIPTION_PLAN_4_COLOR = #colorLiteral(red: 0.8078431373, green: 0.7019607843, blue: 0.231372549, alpha: 1)
    
    //MARK: - IBActions
    static let UN_SELECTED_PLAN_ROUND =  CGColor(red: 218/255, green: 218/255, blue: 218/255, alpha: 1.0)
    static let SELECTED_PLAN_ROUND = CGColor(red: 154/255, green: 2215/255, blue: 230/255, alpha: 1.0)
    static let SELECTED_PLAN_BACKGROUND = #colorLiteral(red: 0.968627451, green: 0.9843137255, blue: 0.9882352941, alpha: 1)
    
    
    
}




//
//  C-URL+Credentials.swift
//  easypeasy
//
//  Created by Codelps on 07/10/2020.
//

import Foundation

struct BaseUrl {
    static let DEV = "https://codelps.com/bioceutica/public"
    static let STAGING = ""
    static let LIVE = ""
}

var APIBaseUrl : Int {
    return UserDefaults.standard.value(forKey: K.API_BASE_URL_TYPE) as? Int ?? APIUrlType.dev.rawValue
}

var apiURL : String {
    let value = APIBaseUrl
    switch value {
    case APIUrlType.dev.rawValue:
        return "\(BaseUrl.DEV)/api"
    case APIUrlType.staging.rawValue:
        return "\(BaseUrl.STAGING)/api"
    default:
        return "\(BaseUrl.LIVE)/api"
    }
}

var apiImageBaseUrl :String {
    let value = APIBaseUrl
    switch value {
    case APIUrlType.dev.rawValue:
        return "\(BaseUrl.DEV)"
    case APIUrlType.staging.rawValue:
        return "\(BaseUrl.STAGING)"
    default:
        return "\(BaseUrl.LIVE)"
    }
}


var buildStr : String {
    let value = APIBaseUrl
    switch value {
    case APIUrlType.dev.rawValue:
        return "Development"
    case APIUrlType.staging.rawValue:
        return "Client Staging"
    default:
        return "Live"
    }
}


struct API {
    
    struct Account {
        
        var login : String {
            return "\(apiURL)/login"
        }
        var logout : String {
            return "\(apiURL)/log-out"
        }
        var deleteAccount : String {
            return "\(apiURL)/user"
        }
        var updateAccount : String {
            return "\(apiURL)/accounts/update"
        }
        var updateProject : String {
            return "\(apiURL)/projects/update"
        }
        var purchasePlan : String {
            return "\(apiURL)/purchase-subscription"
        }
        var updateUserProfile : String {
            return "\(apiURL)/update-user"
        }
        var cancelPurchasedPlan : String {
            return "\(apiURL)/cancel-subscription"
        }
        var Cities : String {
            return "\(apiURL)/cities"
        }
        var updateUser : String {
            return "\(apiURL)/update-user"
        }
        var membershipTypes : String {
            return "\(apiURL)/types"
        }
        var signUp : String {
            return "\(apiURL)/signup"
        }
        var changePassword : String {
            return "\(apiURL)/new-password"
        }
        var updatePassword : String {
            return "\(apiURL)/reset-password"
        }
        var forgotPassword : String {
            return "\(apiURL)/password"
        }
        var socialLogin : String {
            return "\(apiURL)/social-login"
        }
        var updateProfile : String {
            return "\(apiURL)/update-user"
        }
        var folders : String {
            return "\(apiURL)/folders"
        }
        var resendOTP : String {
            return "\(apiURL)/resend-otp"
        }
        var reportAd : String {
            return "\(apiURL)/post-report"
        }
        var favorites : String {
            return "\(apiURL)/get-fav-posts"
        }
        var verifyOTP : String {
            return "\(apiURL)/verify-otp"
        }
        
    }
    
    struct dashboard {
        
        var getPosts : String {
            return "\(apiURL)/get-posts"
        }
        var project : String {
            return "\(apiURL)/projects"
        }
        var addCard : String {
            return "\(apiURL)/credit-card"
        }
        var addProject : String {
            return "\(apiURL)/projects/create"
        }
        var deleteProject : String {
            return "\(apiURL)/projects/delete"
        }
        var deleteAccount : String {
            return "\(apiURL)/accounts/delete"
        }
        var deleteProfit : String {
            return "\(apiURL)/profits/delete"
        }
        var deleteExpense : String {
            return "\(apiURL)/expenses/delete"
        }
        var addAccount : String {
            return "\(apiURL)/accounts/create"
        }
        var addExpense : String {
            return "\(apiURL)/expenses/create"
        }
        var addProfit : String {
            return "\(apiURL)/profits/create"
        }
        var getAccount : String {
            return "\(apiURL)/accounts"
        }
        var dashboard : String {
            return "\(apiURL)/dashboard"
        }
        var address : String {
            return "\(apiURL)/address"
        }
        var getCart : String {
            return "\(apiURL)/cart"
        }
        var createOrder : String {
            return "\(apiURL)/order/create"
        }
        var wishList : String {
            return "\(apiURL)/wishlist"
        }
        var history : String {
            return "\(apiURL)/history"
        }
        var categories : String {
            return "\(apiURL)/categories"
        }
        var products : String {
            return "\(apiURL)/products"
        }
        var getPlans : String {
            return "\(apiURL)/plans"
        }
        var createFolder : String {
            return "\(apiURL)/create-folder"
        }
        
        var searchPosts : String {
            return "\(apiURL)/search-post"
        }
        
        var catSearchPosts : String {
            return "\(apiURL)/cat-search-post"
        }
        
        var createSituation : String {
            return "\(apiURL)/create-situation"
        }
        
        var subCategories : String {
            return "\(apiURL)/sub-category"
        }
        
        var situations : String {
            return "\(apiURL)/situations"
        }
        
        var postDetails : String {
            return "\(apiURL)/get-post"
        }
        
        var addToFolder : String {
            return "\(apiURL)/folder-post"
        }
        
        var exploreDetails : String {
            return "\(apiURL)/explore-detail"
        }
        
        var likeUnlike : String {
            return "\(apiURL)/post-like"
        }
        
        var itineraries : String {
            return "\(apiURL)/all-packages"
        }
        
        var postStatus : String {
            return "\(apiURL)/update-post"
        }
        
        var createPost : String {
            return "\(apiURL)/create-post"
        }
        
        var savedList : String {
            return "\(apiURL)/favourate-explore-list"
        }
        
        var deleteFolder : String {
            return "\(apiURL)/delete-folder"
        }
        
        var postRemoveFolder : String {
            return "\(apiURL)/delete-folder-post"
        }
        
        var myAds : String {
            return "\(apiURL)/my-ads"
        }
        
        var folderPosts : String {
            return "\(apiURL)/get-folder-post"
        }
        
        var userAds : String {
            return "\(apiURL)/user-ads"
        }
        
    }
    
    struct Itineraries {
        
        var itineraries : String {
            return "\(apiURL)/all-packages"
        }
        
        var itinerariesDetails : String {
            return "\(apiURL)/package_detail"
        }
        
        var favoratePackage : String {
            return "\(apiURL)/favorate-package"
        }
    }
    
    struct subscriptionPlans {
        
        var allPlans : String {
            return "\(apiURL)/all-plans"
        }
        
        var cancelSubscription : String {
            return "\(apiURL)/cancel-subscription"
        }
        
    }
    
    struct DivePointReview {
        
        var getSiteNameSearch : String {
            return "\(apiURL)/home/search/"
        }
        
        var waterTypeList : String {
            return "\(apiURL)/log/watertype/list"
        }
        
        var divingTypes : String {
            return "\(apiURL)/log/divingtype/list"
        }
        
        var waterEntryTypes : String {
            return "\(apiURL)/log/waterentry/list"
        }
        
        var addDiveType : String {
            return "\(apiURL)/log/divingtype/create"
        }
        
        var createDiveSite : String {
            return "\(apiURL)/divesite/create"
        }
        
        
    }
    
    
    
    
    struct Home {
        
        var isLive : String {
            return "\(apiURL)/status"
        }
        

        
        var homeList : String {
            return "\(apiURL)/home/list"
        }
        
        var getCoupon : String {
            return "\(apiURL)/promo-code"
        }
        var creditCard : String {
            return "\(apiURL)/credit-card"
        }
        
        var addCard : String {
            return "\(apiURL)/credit-card"
        }
        
        var Feedback : String {
            return "\(apiURL)/feedback"
        }
        
        var gtCities : String {
            return "\(apiURL)/cities-list"
        }
        
        var bannersList : String {
            return "\(apiURL)/home-explore-city-banner"
        }
        
        var getExploreByCities : String {
            return "\(apiURL)/cities-explore-list"
        }
        
        var getPackageByCities : String {
            return "\(apiURL)/explore-package"
        }
        
        var getNearbyExplore : String {
            return "\(apiURL)/explore-nearBy"
        }
        
        var getExploreByDistance : String {
            return "\(apiURL)/explore-nearBy-distance"
        }
        
        
        
        
    }
    
    struct Store {
        
        var packageList : String {
            return "\(apiURL)/store/package-list"
        }
        
        var packageFeatureList : String {
            return "\(apiURL)/store/package-feature-list"
        }
        
        var individualFeatureList : String {
            return "\(apiURL)/store/individual-feature-list"
        }
        
        var individualFeaturePurchase : String {
            return "\(apiURL)/store/individual-feature-purchase"
        }
        
        var subscriptionCancel : String {
            return "\(apiURL)/store/subscription-cancel"
        }
        
        var currentPackageList : String {
            return "\(apiURL)/store/current-package"
        }
        
        var createStoreDistributer : String {
            return "\(apiURL)/store/storedistributer-create"
        }
        
        var createGiftCode : String {
            return "\(apiURL)/store/giftcode-create"
        }
        
        var getGiftCode : String {
            return "\(apiURL)/store/get-giftcodes"
        }
        
        var storePaymentHistory : String {
            return "\(apiURL)/store/store-payment-history"
        }
        
        
    }
    
    struct Reviews {
        
        
        var createComment : String {
            return "\(apiURL)/reviews/comment/create"
        }
        
        
        var divesiteReviews : String {
            return "\(apiURL)/reviews/divesite-reviews"
        }
        
        var divesiteReviewsDivesiteDetail : String {
            return "\(apiURL)/reviews/divesite-reviews-divesitedetail"
        }
        
        var divesiteList : String {
            return "\(apiURL)/reviews/divesite-list"
        }
        
        var reviewComment : String {
            return "\(apiURL)/reviews/review-comments"
        }
        
        var childComment : String {
            return "\(apiURL)/reviews/child-comments"
        }
        
        var likeUnlikeReview : String {
            return "\(apiURL)/reviews/like-unlike"
        }
        
        var myReview : String {
            return "\(apiURL)/reviews/my-reviews"
        }
        
        var userReviews : String {
            return "\(apiURL)/reviews/user-reviews"
        }
        
        var diveSiteReviewDetails : String {
            return "\(apiURL)/reviews/divesite-review-detail"
        }
        
    }
    
    struct DiveSite {
        
        var diveSiteLogbookDetails : String {
            return "\(apiURL)/divesite"
        }
        
        var nearbyDiveSite : String {
            return "\(apiURL)/divesite/nearby-divesite"
        }
        
        var getSiteNameSearch : String {
            return "\(apiURL)/home/search"
        }
        
        var tokenData : String {
            return "\(apiURL)/member/tokenData"
        }
        
        var suggestionTypes : String {
            return "\(apiURL)/mypage/suggestion/listSuggestionType"
        }
        
        var createSuggestion : String {
            return "\(apiURL)/mypage/suggestion/createSuggestion"
        }
        
    }
    
    struct DeleteAccount {
        
        var AccountDeleteReasons : String {
            return "\(apiURL)/mypage/deleteaccount/reasons"
        }
        
        var DeleteMember : String {
            return "\(apiURL)/member/deleteMember"
        }
        
        var AccountWithdrawalVerification : String {
            return "\(apiURL)/member/accountWithdrawalVerification"
        }
        
    }
    
    struct CancelSubscription {
        
        var cancelReason : String {
            return "\(apiURL)/mypage/cancelsubscription/reasons"
        }
        
        var addCancelReason : String {
            return "\(apiURL)/mypage/cancelsubscription/addReason"
        }
        
        
    }
    
    struct DeviceSettings {
        
        var listDeviceSettings : String {
            return "\(apiURL)/deviceSettings/listDeviceSettings"
        }
        
        var underWaterNotification : String {
            return "\(apiURL)/deviceSettings/createUnderWaterNotification"
        }
        
        var diveConditions : String {
            return "\(apiURL)/deviceSettings/listDiveCondition"
        }
        
        var oxygenPercentage : String {
            return "\(apiURL)/deviceSettings/listOxygenPercentage"
        }
        
        var waterDepth : String {
            return "\(apiURL)/deviceSettings/listWaterDepth"
        }
        
        var divePlanner : String {
            return "\(apiURL)/deviceSettings/getDivePlanner"
        }
        
        
        
    }
    
    struct Member {
        
        var changepassword : String {
            return "\(apiURL)/member/changePassword"
        }
        
        
    }
    
    struct FAQ {
        
        var listFAQCategory : String {
            return "\(apiURL)/mypage/faq/listFAQCategories"
        }
        
        var listFAQ : String {
            return "\(apiURL)/mypage/faq/listFAQs"
        }
        
        var singleFAQInfo : String {
            return "\(apiURL)/mypage/faq/singleFAQInfo"
        }
        
    }
    
    struct paymentCharge {
        
        var checkoutPage : String {
            return "\(apiURL)/checkout-package"
        }
        
        var verifyCoupon : String {
            return "\(apiURL)/verify-promo"
        }
        
        var verifyTransaction : String {
            return "\(apiURL)/verify-transaction"
        }
        
        var initiateTransaction : String {
            return "\(apiURL)/initiate-transaction"
        }
        
        var purchaseSubscription : String {
            return "\(apiURL)/purchase-subscription"
        }
        
    }
}

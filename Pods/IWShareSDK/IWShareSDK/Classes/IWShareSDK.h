//
//  IWShareSDK.h
//  Pods
//
//  Created by 秦传龙 on 2021/1/12.
//

#ifndef IWShareSDK_h
#define IWShareSDK_h

#import "IWShareBasePlateform.h"
#import "IWShareManager.h"
#import "IWShareCoordinator.h"
#import "IWShareValue.h"
#import "IWShare.h"

#if __has_include("IWDTPlatform.h")
#import "IWDTPlatform.h"
#endif

#if __has_include("IWWxSessionPlatform.h")
#import "IWWxSessionPlatform.h"
#endif

#if __has_include("IWWxTimelinePlatform.h")
#import "IWWxTimelinePlatform.h"
#endif

#if __has_include("IWWxFavoritePlatform.h")
#import "IWWxFavoritePlatform.h"
#endif

#if __has_include("IWWxPlatform.h")
#import "IWWxPlatform.h"
#endif

#if __has_include("IWQQSharePlatform.h")
#import "IWQQSharePlatform.h"
#endif

#if __has_include("IWQQFriendsPlatform.h")
#import "IWQQFriendsPlatform.h"
#endif

#if __has_include("IWQQZoneSharePlatform.h")
#import "IWQQZoneSharePlatform.h"
#endif


#endif /* IWShareSDK_h */

#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "DTOpenAPI.h"
#import "DTOpenAPIObject.h"
#import "DTOpenKit.h"
#import "IWDTPlatform.h"
#import "IWQQShareApiHandle.h"
#import "IWQQSharePlatform.h"
#import "IWQQFriendsPlatform.h"
#import "IWQQZoneSharePlatform.h"
#import "QQApiInterface.h"
#import "QQApiInterfaceObject.h"
#import "sdkdef.h"
#import "TencentOAuth.h"
#import "TencentOpenApiUmbrellaHeader.h"
#import "IWWxShareApiHandler.h"
#import "IWWxFavoritePlatform.h"
#import "IWWxSessionPlatform.h"
#import "IWWxTimelinePlatform.h"
#import "IWWxPlatform.h"
#import "IWShareBasePlateform.h"
#import "IWShareCoordinator.h"
#import "IWShareManager.h"
#import "IWShareValue.h"
#import "IWShare.h"
#import "IWShareBundle.h"
#import "IWShareTool.h"
#import "IWUICollectionViewCell.h"
#import "IWUIShareFooterView.h"
#import "IWUIShareHeaderView.h"
#import "IWUIShareView.h"
#import "IWShareSDK.h"

FOUNDATION_EXPORT double IWShareSDKVersionNumber;
FOUNDATION_EXPORT const unsigned char IWShareSDKVersionString[];


//
//  IWShareValue.h
//  Pods
//
//  Created by 秦传龙 on 2021/1/13.
//

#ifndef IWShareValue_h
#define IWShareValue_h

#define IWShareSDKDeprecated(DESCRIPTION) __attribute__((deprecated(DESCRIPTION)))


typedef void(^ShareResultCompletion)(NSInteger result, NSString *errorMsg);

typedef NS_ENUM(NSInteger, IWShareType) {
    IWShareTypeText, // 文本类型
    IWShareTypeImage, // 图片类型
    IWShareTypeWeb, // 网页类型
    
};

typedef NSString *IWSharePlatform NS_TYPED_ENUM;

static IWSharePlatform const IWSharePlatformDingTalk = @"IWSharePlatformDingTalk"; // 钉钉
static IWSharePlatform const IWSharePlatformWechatSessoin = @"IWSharePlatformWechatSessoin"; // 微信好友
static IWSharePlatform const IWSharePlatformWechatTimeline = @"IWSharePlatformWechatTimeline"; // 朋友圈
static IWSharePlatform const IWSharePlatformWechatFavorite = @"IWSharePlatformWechatFavorite"; // 微信收藏
static IWSharePlatform const IWSharePlatformQQFriends IWShareSDKDeprecated("QQ好友分享暂不支持") = @"IWSharePlatformQQFriends"; // QQ好友
static IWSharePlatform const IWSharePlatformQQZone IWShareSDKDeprecated("QQ好友分享暂不支持") = @"IWSharePlatformQQZone"; // qq空间



typedef NSString *IWSharePlatformKey NS_TYPED_ENUM;

static IWSharePlatformKey const IWSharePlatformAppIdKey = @"IWSharePlatformAppIdKey";
static IWSharePlatformKey const IWSharePlatformClassNameKey = @"IWSharePlatformClassNameKey";
static IWSharePlatformKey const IWSharePlatformUniversalLinkKey = @"IWSharePlatformUniversalLinkKey";

#endif /* IWShareValue_h */

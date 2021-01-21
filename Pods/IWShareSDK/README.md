# IWShareSDK iOS

IWShareSDK是一个集成多个平台于一体的分享第三方库，支持项目按需引入指定平台，目前已集成微信(朋友圈、好友、收藏)、钉钉分享等平台。后续根据项目需要可能会扩展其他平台。

# 使用方法

### 工程配置



### 引入方式
#### 通过`cocoapods`方式引入

如果你的项目中只需要接入钉钉分享，那么你可以在`podfile`中写入`pod 'IWShareSDK', :subspecs => ['DT']`, `DT`代表钉钉平台，更多平台介绍可查看如下表格。

| 平台 | subspec | LSApplicationQueriesSchemes(白名单) |   备注
|--------|--------|--------|--------|
|   钉钉    |    DT   |     dingtalk、dingtalk-open、dingtalk-sso      | |
|   微信    |    WX   |   weixinULAPI、weixin、wechat ||
|   QQ     |     QQ  |   暂不支持   |暂不支持|

`podfile`文件示例
> pod 'IWShareSDK', :subspecs => ['WX', 'DT'] // 引入全部文件

### 代码实例
```
// AppDelegate
#import <IWShareSDK/IWShareSDK.h>
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[IWShareManager manager] registerAppIdWithPlatformMsg:@[
                 @{
                                                                             IWSharePlatformAppIdKey:@"dingoaybjbkrf0yfu9w",
                                                                             IWSharePlatformClassNameKey: NSStringFromClass([IWDTPlatform class])
                },
                 @{
                     IWSharePlatformAppIdKey:@"wxdc948fe1c020a",
                     IWSharePlatformClassNameKey: NSStringFromClass([IWWxPlatform class]),
                     IWSharePlatformUniversalLinkKey: @"https://xxxx/2020/"
                 }
                ]];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {

	// 如果有其他跳转需要自行处理
    return [IWShareCoordinator handleOpenURL:url];
}

```

##### 1、分享文字
```
// 分享位置
[IWShare shareTextToPlatforms:@[IWSharePlatformDingTalk, IWSharePlatformWechatFavorite, IWSharePlatformWechatTimeline, IWSharePlatformWechatSessoin] text:@"分享一段文字" resultCompletion:^(NSInteger result, NSString *errorMsg) {
            NSLog(@"分享文字页面结果：%@ - %ld", errorMsg, result);
}];

```
##### 2、分享图片
```
// 分享位置
[IWShare shareImageToPlatforms:@[IWSharePlatformDingTalk, IWSharePlatformWechatFavorite, IWSharePlatformWechatTimeline] imageData:UIImagePNGRepresentation(image) thumbData:UIImagePNGRepresentation(image) resultCompletion:^(NSInteger result, NSString *errorMsg) {
            NSLog(@"分享Image页面结果：%@ - %ld", errorMsg, result);
        }];
```

##### 2、分享Web
```
// 分享位置
[IWShare shareWebToPlatforms:@[IWSharePlatformDingTalk, IWSharePlatformWechatFavorite,IWSharePlatformWechatTimeline]
                              webURL:@"http://www.dingtalk.com/"
                               title:@"钉钉"
                            thumbURL:@"https://static.dingtalk.com/media/lALOGp__Tnh4_120_120.png"
                         description:@"钉钉，是一个工作方式。为企业量身打造统一办公通讯平台"
                    resultCompletion:^(NSInteger result, NSString *errorMsg) {
            NSLog(@"分享结果:%ld, error:%@",result, errorMsg);
        }];
```














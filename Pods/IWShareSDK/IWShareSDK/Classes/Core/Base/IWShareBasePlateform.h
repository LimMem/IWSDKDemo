//
//  IWShareBasePlateform.h
//  Pods
//
//  Created by 秦传龙 on 2021/1/12.
//

#import <Foundation/Foundation.h>
#import "IWShareValue.h"

NS_ASSUME_NONNULL_BEGIN

@interface IWShareBasePlateform : NSObject

/// 私有方法，给指定平台子类调用
@property (nonatomic, assign) IWShareType shareType;
@property (nonatomic, copy, readonly) UIImage *platformIcon;
@property (nonatomic, copy, readonly) NSString *platformName;
@property (copy, nonatomic) ShareResultCompletion resultCompletion;
@property (nonatomic, strong) id cl; // 当前分享的类

- (BOOL)share;
+ (void)registerAppId:(NSString *)appId universalLink:(NSString *)universalLink;
- (BOOL)isInstalled;
- (BOOL)handleOpenURL:(NSURL *)url; // 返回回调处理

@end

NS_ASSUME_NONNULL_END

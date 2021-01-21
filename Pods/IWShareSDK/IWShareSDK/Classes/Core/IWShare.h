//
//  IWShare.h
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/19.
//

#import <Foundation/Foundation.h>
#import "IWShareValue.h"

NS_ASSUME_NONNULL_BEGIN

@interface IWShare : NSObject

/// 分享H5到指定平台
+ (instancetype)shareWebToPlatforms:(NSArray <IWSharePlatform> *)platforms
                             webURL:(NSString *)webURL
                              title:(NSString *)title
                           thumbURL:(NSString *)thumbURL
                        description:(NSString *)description
                   resultCompletion:(ShareResultCompletion)resultCompletion;

/// 分享Image到指定平台
+ (instancetype)shareImageToPlatforms:(NSArray<IWSharePlatform> *)platforms
                            imageData:(NSData *)imageData
                            thumbData:(NSData *)thumbData
                     resultCompletion:(ShareResultCompletion)resultCompletion;

/// 分享Text到指定平台
+ (instancetype)shareTextToPlatforms:(NSArray <IWSharePlatform> *)platforms
                                text:(NSString *)text
                    resultCompletion:(ShareResultCompletion)resultCompletion;

@end

NS_ASSUME_NONNULL_END

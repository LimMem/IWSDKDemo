//
//  IWShareManager.h
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/12.
//

#import <Foundation/Foundation.h>
#import "IWShareValue.h"

NS_ASSUME_NONNULL_BEGIN

@class IWShareBasePlateform;
@interface IWShareManager : NSObject

@property (nonatomic, copy) NSArray *classNames;
@property (nonatomic, copy) NSArray *appIds;

+ (instancetype)manager;

/**
 key: className、appId、universalLink  
 */
- (BOOL)registerAppIdWithPlatformMsg:(NSArray<NSDictionary<IWSharePlatformKey, id> *> *)platformMsgs;

@end

NS_ASSUME_NONNULL_END

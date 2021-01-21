//
//  IWShareCoordinator.h
//  FBSnapshotTestCase
//
//  Created by 秦传龙 on 2021/1/13.
//

#import <Foundation/Foundation.h>
#import "IWShareValue.h"

@class IWShareBasePlateform;
NS_ASSUME_NONNULL_BEGIN

@interface IWShareCoordinator : NSObject

/**
 分享结果回调
 */
@property (copy, nonatomic) ShareResultCompletion resultCompletion;

@property (nonatomic, assign) IWShareType shareType;

@property (nonatomic, copy) void (^shareResult)(NSInteger code, NSError *error);

- (void)addPlatform:(IWShareBasePlateform *)platform;

- (BOOL)show;

- (BOOL)close;

+ (BOOL)handleOpenURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END

//
//  IWShareCoordinator.m
//  FBSnapshotTestCase
//
//  Created by 秦传龙 on 2021/1/13.
//

#import "IWShareCoordinator.h"
#import "IWShareBasePlateform.h"
#import "IWUIShareView.h"
#import "IWShareTool.h"
#import <objc/message.h>

static NSArray *sharePlatforms = nil;
static NSInteger currentIndex = 0;

@interface IWShareCoordinator ()

@property (nonatomic, strong) NSMutableArray<IWShareBasePlateform *> *platformList;

@property (nonatomic, strong) IWUIShareView *shareView;

@end

@implementation IWShareCoordinator

- (void)addPlatform:(IWShareBasePlateform *)platform {
    if (platform) {
        if ([self isAddPlatform:platform]) {
            [self.platformList addObject:platform];
        } else {
            NSLog(@"应用未安装");
        }
        sharePlatforms = self.platformList;
    }
}

- (BOOL)isAddPlatform:(IWShareBasePlateform *)platform {
    if (platform.isInstalled) {
        if ([platform isKindOfClass:NSClassFromString(@"IWQQZoneSharePlatform")]) {
            if (self.shareType == IWShareTypeText) {
                return NO;
            }
        }
        return YES;
    }
    
    return NO;
}

- (NSMutableArray<IWShareBasePlateform *> *)platformList {
    if (!_platformList) {
        _platformList = [NSMutableArray new];
    }
    return _platformList;
}

// 防止因调用顺序颠倒 导致block为空
- (void)setResultCompletion:(ShareResultCompletion)resultCompletion {
    _resultCompletion = resultCompletion;
    if (self.shareView) {
        self.shareView.resultCompletion = self.resultCompletion;
    }
}

- (BOOL)show {
    if (self.platformList.count > 0) {
        self.shareView = [[IWUIShareView alloc] init];
        self.shareView.shareType = self.shareType;
        self.shareView.platformList = self.platformList;
        self.shareView.resultCompletion = self.resultCompletion;
        [self.shareView setDidSelectIndex:^(NSInteger index) {
            currentIndex = index;
        }];
        [self.shareView reloadData];
        [self.shareView show];
        return YES;
    }
    
    return NO;
}

- (BOOL)close {
    sharePlatforms = @[];
    currentIndex = 0;
    [self.shareView close];
    return YES;
}

+ (BOOL)handleOpenURL:(NSURL *)url {
    if (sharePlatforms.count <= currentIndex) {
        return NO;
    }
    id cl = sharePlatforms[currentIndex];
    BOOL (*handleOpenURL)(id, SEL, NSURL *) = (BOOL(*)(id, SEL, NSURL *))objc_msgSend;
    return handleOpenURL(cl, @selector(handleOpenURL:), url);
}

+ (id)searchClassNameWithURL:(NSURL *)url {
    NSString *className = [IWShareTool classNameWithOpenURL:url];
    for (int i = 0; i < sharePlatforms.count; i++) {
        IWShareBasePlateform *platform = sharePlatforms[i];
        if ([platform isKindOfClass:NSClassFromString(className)]) {
            return platform;
        }
    }
    return nil;
}

@end

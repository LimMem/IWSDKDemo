//
//  IWUIShareHeaderView.m
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/13.
//

#import "IWUIShareHeaderView.h"

@implementation IWUIShareHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self __init];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = self.bounds;
}

- (void)__init {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor colorWithRed:6/255.0f green:4/255.0f blue:30/255.0f alpha:1];
    [self addSubview:self.titleLabel];
}


@end

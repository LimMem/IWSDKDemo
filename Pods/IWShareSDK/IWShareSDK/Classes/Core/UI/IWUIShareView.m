//
//  IWUIShareView.m
//  FBSnapshotTestCase
//
//  Created by 秦传龙 on 2021/1/12.
//

#import "IWUIShareView.h"
#import "IWUICollectionViewCell.h"
#import "IWUIShareFooterView.h"
#import "IWShareBasePlateform.h"
#import "IWUIShareHeaderView.h"
#import "IWShareBundle.h"
#import "IWShareTool.h"


static CGFloat const spaceV = 20;
static CGFloat const headerHeight = 55;
static CGFloat const footerHeight = 62;
static CGFloat const itemHeight = 66;
static NSInteger const col = 4; // 列数

static NSString *const IWFooterKind = @"IWUIShareFooterView";
static NSString *const IWHeaderKind = @"IWUIShareHeaderView";
static NSString *const IWUICollectionViewCellId = @"IWUICollectionViewCell";

@interface IWUIShareView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, assign) CGFloat backgroundViewHeight;

@end


@implementation IWUIShareView

#pragma mark --- liftcyle
- (instancetype)init {
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (!self) {
        return self;
    }
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    self.backgroundViewHeight = footerHeight + headerHeight;
    [self __initUI];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [self close];
}

#pragma mark -- privte Method
- (void)initCollectionViewFrame {
    self.collectionView.frame = CGRectMake(0, CGRectGetHeight(self.frame) - self.backgroundViewHeight, CGRectGetWidth(self.frame), self.backgroundViewHeight);
    self.collectionView.transform = CGAffineTransformMakeTranslation(0, self.backgroundViewHeight);
}

- (void)setCollectionViewCornerRadius {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.collectionView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(20, 20)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.collectionView.bounds;
    shapeLayer.path = bezierPath.CGPath;
    self.collectionView.layer.mask = shapeLayer;
}

- (void)calculateHeight {
    CGFloat allHeight = 0;
    if (self.platformList.count > 0) {
        CGFloat row = (self.platformList.count - 1) / col + 1;
        allHeight = row * itemHeight + (row - 1) * spaceV;
    }
    
    // 安全区域适配
    if (@available(iOS 11.0, *)) {
        allHeight += [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom;
    }
    self.backgroundViewHeight += allHeight;
}

- (void)__initUI {
    [self addSubview:self.collectionView];
}

#pragma mark --- public Method
- (void)show {
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [self calculateHeight];
    [self initCollectionViewFrame];
    [self setCollectionViewCornerRadius];
    [self reloadData];
    [UIView animateWithDuration:0.2 animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.12];
        self.collectionView.transform = CGAffineTransformIdentity;
    }];
}

- (void)close {
    [UIView animateWithDuration:0.15 animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        self.collectionView.transform = CGAffineTransformMakeTranslation(0, self.backgroundViewHeight);;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

- (void)reloadData {
    [self.collectionView reloadData];
}


#pragma mark --- UICollectionView && UICollectionViewDataSource && UICollectionViewDelegateFlowLayout
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.platformList.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IWShareBasePlateform *platform = self.platformList[indexPath.row];
    
    IWUICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IWUICollectionViewCellId forIndexPath:indexPath];
    cell.imageView.image = platform.platformIcon;
    cell.titleLabel.text = platform.platformName;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIEdgeInsets sectionInsets = [self collectionView:collectionView layout:collectionViewLayout insetForSectionAtIndex:indexPath.section];
    CGFloat insetWidth = (CGRectGetWidth(collectionView.frame)  - sectionInsets.left - sectionInsets.right);
    CGFloat averageWidth = insetWidth / col;
    //    由于精度问题 会导致各个item之间存在间隙 解决方式
    CGFloat lastColWidth = insetWidth - averageWidth * (col - 1);
    if (indexPath.row % col == col - 1) {
        // 最后一列
        return CGSizeMake(lastColWidth, itemHeight);
    }
    return CGSizeMake(averageWidth, itemHeight);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(CGRectGetWidth(collectionView.frame), footerHeight);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(CGRectGetWidth(collectionView.frame), headerHeight);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    __weak typeof(self) weakSelf = self;
    if (indexPath.row == 0) {
        if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
            IWUIShareFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:IWFooterKind forIndexPath:indexPath];
            footerView.footerTap = ^{
                [weakSelf close];
            };
            return footerView;
        } else if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            IWUIShareHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:IWHeaderKind forIndexPath:indexPath];
            headerView.titleLabel.text = @"分享到";
            return headerView;
        }
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [self close];
    if (self.didSelectIndex) {
        self.didSelectIndex(indexPath.row);
    }
    // 点击事件
    IWShareBasePlateform *platform = self.platformList[indexPath.row];
    platform.resultCompletion = self.resultCompletion;
    platform.shareType = self.shareType;
    
    [platform share];
}


#pragma mark -- lazyLoading
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[IWUIShareFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:IWFooterKind];
        [_collectionView registerClass:[IWUIShareHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:IWHeaderKind];
        [_collectionView registerClass:[IWUICollectionViewCell class] forCellWithReuseIdentifier:IWUICollectionViewCellId];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.minimumLineSpacing = spaceV;
    }
    return _flowLayout;
}

- (void)dealloc {
    NSLog(@"页面释放");
}

@end

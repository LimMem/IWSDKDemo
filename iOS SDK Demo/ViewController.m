//
//  ViewController.m
//  iOS SDK Demo
//
//  Created by 秦传龙 on 2021/1/20.
//

#import "ViewController.h"
#import <IWShareSDK/IWShareSDK.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    self.dataSource = @[@{
                            @"text": @"分享文字",
    },
                        @{
                            @"text": @"分享图片",
                        },
                        @{
                            @"text": @"分享H5页面",
                        }];
}

- (void)createUI {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:self.tableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dict = self.dataSource[indexPath.row];
    
    return;
    NSString *text = dict[@"text"];
    if ([text isEqualToString:@"分享文字"]) {
        [IWShare shareTextToPlatforms:@[IWSharePlatformDingTalk, IWSharePlatformWechatFavorite, IWSharePlatformWechatTimeline, IWSharePlatformWechatSessoin] text:@"分享一段文字" resultCompletion:^(NSInteger result, NSString *errorMsg) {
            NSLog(@"分享文字页面结果：%@ - %ld", errorMsg, (long)result);
        }];
    } else if ([text isEqualToString:@"分享图片"]) {
        UIImage *image = [UIImage imageNamed:@"1.jpg"];

        [IWShare shareImageToPlatforms:@[IWSharePlatformDingTalk, IWSharePlatformWechatFavorite, IWSharePlatformWechatTimeline] imageData:UIImagePNGRepresentation(image) thumbData:UIImagePNGRepresentation(image) resultCompletion:^(NSInteger result, NSString *errorMsg) {
            NSLog(@"分享Image页面结果：%@ - %ld", errorMsg, (long)result);
        }];
    } else if ([text isEqualToString:@"分享H5页面"]) {
        [IWShare shareWebToPlatforms:@[IWSharePlatformDingTalk, IWSharePlatformWechatFavorite,IWSharePlatformWechatTimeline]
                              webURL:@"http://www.dingtalk.com/"
                               title:@"钉钉"
                            thumbURL:@"https://static.dingtalk.com/media/lALOGp__Tnh4_120_120.png"
                         description:@"钉钉，是一个工作方式。为企业量身打造统一办公通讯平台"
                    resultCompletion:^(NSInteger result, NSString *errorMsg) {
            NSLog(@"分享结果:%ld, error:%@",(long)result, errorMsg);
        }];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.dataSource[indexPath.row][@"text"];
    return cell;
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [IWShare shareTextToPlatforms:@[IWSharePlatformDingTalk] text:@"我是一段分享文字" resultCompletion:^(NSInteger result, NSString *errorMsg) {
            
    }];
}


@end

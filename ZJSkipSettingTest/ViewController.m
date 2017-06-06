//
//  ViewController.m
//  ZJSkipSettingTest
//
//  Created by DFHZ on 2017/6/6.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *settingArr;
}
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    settingArr = @[@{@"title":@"无线局域网",@"subTitle":@"App-Prefs:root=WIFI"},
                   @{@"title":@"蓝牙",@"subTitle":@"App-Prefs:root=Bluetooth"},
                   @{@"title":@"蜂窝移动数据",@"subTitle":@"App-Prefs:root=MOBILE_DATA_SETTINGS_ID"},
                   @{@"title":@"个人热点",@"subTitle":@"App-Prefs:root=INTERNET_TETHERING"},
                   @{@"title":@"运行商",@"subTitle":@"App-Prefs:root=Carrier"},
                   @{@"title":@"通知",@"subTitle":@"App-Prefs:root=NOTIFICATIONS_ID"},
                   @{@"title":@"通用",@"subTitle":@"App-Prefs:root=General"},
                   @{@"title":@"通用-关于本机",@"subTitle":@"App-Prefs:root=General&path=About"},
                   @{@"title":@"通用-键盘",@"subTitle":@"App-Prefs:root=General&path=Keyboard"},
                   @{@"title":@"通用-辅助功能",@"subTitle":@"App-Prefs:root=General&path=ACCESSIBILITY"},
                   @{@"title":@"通用-语言与地区",@"subTitle":@"App-Prefs:root=General&path=INTERNATIONAL"},
                   @{@"title":@"通用-还原",@"subTitle":@"App-Prefs:root=Reset"},
                   @{@"title":@"墙纸",@"subTitle":@"App-Prefs:root=Wallpaper"},
                   @{@"title":@"Siri",@"subTitle":@"App-Prefs:root=SIRI"},
                   @{@"title":@"隐私",@"subTitle":@"App-Prefs:root=Privacy"},
                   @{@"title":@"隐私-麦克风",@"subTitle":@"App-Prefs:root=Privacy&path=MICROPHONE"},
                   @{@"title":@"隐私-定位",@"subTitle":@"App-Prefs:root=Privacy&path=LOCATION"},
                   @{@"title":@"Safari",@"subTitle":@"App-Prefs:root=SAFARI"},
                   @{@"title":@"音乐",@"subTitle":@"App-Prefs:root=MUSIC"},
                   @{@"title":@"音乐-均衡器",@"subTitle":@"App-Prefs:root=MUSIC&path=com.apple.Music:EQ"},
                   @{@"title":@"照片与相机",@"subTitle":@"App-Prefs:root=Photos"},
                   @{@"title":@"FaceTime",@"subTitle":@"App-Prefs:root=FACETIME"}];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return settingArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"systemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *dict = settingArr[indexPath.row];
    cell.textLabel.text = dict[@"title"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = settingArr[indexPath.row];
    NSString * urlString = dict[@"subTitle"];
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlString]]) {
        
        if ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0) {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{@"title":@"",@"subTitle":@""} completionHandler:nil];
        } else {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
        }
        
    }
}

@end

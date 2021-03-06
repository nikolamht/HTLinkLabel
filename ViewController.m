//
//  ViewController.m
//  HTLinkLabel
//
//  Created by 老板 on 16/8/18.
//  Copyright © 2016年 老板. All rights reserved.
//

#import "ViewController.h"
#import "HTLinkLabel.h"
#import "LabelCell.h"
@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    HTLinkLabel * test = [[HTLinkLabel alloc] init];
//    test.translatesAutoresizingMaskIntoConstraints = NO;
//    test.backgroundColor = [UIColor redColor];
//    test.numberOfLines = 2;
//    test.lineBreakMode = NSLineBreakByWordWrapping;
//    test.text = @"ceshi";
//    [self.view addSubview:test];
//    
//    HTAttributedString * attributedStr = [[HTAttributedString alloc] init];
////    attributedStr.AttributedString = [[NSMutableAttributedString alloc] initWithString:@"www.baidu.com"];
//    
//    
//    
//    NSMutableAttributedString * attrString = nil;
//    
//    @autoreleasepool {
//        NSString * string = @"www.baidu.com\n百度";
//        
//        attrString = [[NSMutableAttributedString alloc] initWithString:string];
//        
//        [attrString addAttribute:NSForegroundColorAttributeName
//         
//                           value:[UIColor whiteColor]
//         
//                           range:NSMakeRange(0, 4)];
//        
//        [attrString addAttribute:NSFontAttributeName
//         
//                           value:[UIFont systemFontOfSize:40]
//         
//                           range:NSMakeRange(0, attrString.length)];
//        
////        [attrString addAttribute:NSBackgroundColorAttributeName
////         
////                           value:[UIColor blueColor]
////         
////                           range:NSMakeRange(0, attrString.length)];
//        
//        
//    }
//    
//    attributedStr.AttributedString = attrString;
//    
//    HTLink *link = [[HTLink alloc] init];
//    link.linkRange = NSMakeRange(0, 6);
//    link.linkValue = @"www.baidu.com\n百度";
//    
//    attributedStr.links = @[link];
//    test.AttributedString = attributedStr;
//    
//    NSMutableArray *ctr = [[NSMutableArray alloc] init];
//    
//    [ctr addObject:[NSLayoutConstraint constraintWithItem:test
//                                                attribute:NSLayoutAttributeCenterX
//                                                relatedBy:NSLayoutRelationEqual
//                                                   toItem:self.view
//                                                attribute:NSLayoutAttributeCenterX
//                                               multiplier:1
//                                                 constant:0.0]];
//    
//    [ctr addObject:[NSLayoutConstraint constraintWithItem:test
//                                                attribute:NSLayoutAttributeCenterY
//                                                relatedBy:NSLayoutRelationEqual
//                                                   toItem:self.view
//                                                attribute:NSLayoutAttributeCenterY
//                                               multiplier:1
//                                                 constant:0.0]];
//    
//    [self.view addConstraints:ctr];
//    
//    NSLog(@"%f-%f",test.frame.size.width,test.frame.size.height);
    
    
    UITableView * tableview = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableview.dataSource = self;
    tableview.delegate = self;
    [tableview registerClass:[LabelCell class] forCellReuseIdentifier:@"reuseid"];
    [self.view addSubview:tableview];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * reuseid = @"reuseid";
    
    LabelCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseid forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[LabelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    HTAttributedString * attributedStr = [[HTAttributedString alloc] init];
    
    NSMutableAttributedString * attrString = nil;
    
    @autoreleasepool {
        NSString * string = [NSString stringWithFormat:@"🎦%ld--www.baidu.com\n百度",indexPath.row];
        
        attrString = [[NSMutableAttributedString alloc] initWithString:string];
        
        [attrString addAttribute:NSFontAttributeName
         
                           value:[UIFont systemFontOfSize:30]
         
                           range:NSMakeRange(0, attrString.length)];
        
        [attrString addAttribute:NSForegroundColorAttributeName
         
                           value:[UIColor darkGrayColor]
         
                           range:NSMakeRange(0, 3)];
        
        [attrString addAttribute:NSForegroundColorAttributeName
         
                           value:[UIColor grayColor]
         
                           range:NSMakeRange(4, 3)];
        
        [attrString addAttribute:NSForegroundColorAttributeName
         
                           value:[UIColor greenColor]
         
                           range:NSMakeRange(8, 3)];
        
    }
    
    
    attributedStr.AttributedString = attrString;
    
    HTLink *link1 = [[HTLink alloc] init];
    link1.linkRange = NSMakeRange(0, 5);
    link1.linkValue = @"www.baidu.com\n百度";
    
    HTLink *link2 = [[HTLink alloc] init];
    link2.linkRange = NSMakeRange(10, 9);
    link2.linkValue = @"www.baidu.com\n百度";
    
    attributedStr.links = @[link1,link2];
    cell.htlabel.AttributedString = attributedStr;
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

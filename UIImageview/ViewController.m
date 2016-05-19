//
//  ViewController.m
//  UIImageview
//
//  Created by Karma on 16/5/19.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   /*
    + (nullable UIImage *)imageNamed:(NSString *)name;      // 从Assets文件夹中加载图片
    + (nullable UIImage *)imageWithContentsOfFile:(NSString *)path; //从Supporting File文件夹中加载图片
    */
    //第一种
//    self.imageView.image=[UIImage imageNamed:@"校徽"];
    //第二种
    NSString *imagePath=[[NSBundle mainBundle]pathForResource:@"校徽@2x" ofType:@"jpg"];
    self.imageView.layer.cornerRadius=35;
    self.imageView.image=[UIImage imageWithContentsOfFile:imagePath];
    //设置为yes，就可以使用圆角
    self.imageView.layer.masksToBounds=YES;
    self.imageView.layer.borderColor=[[UIColor redColor]CGColor];
    self.imageView.layer.borderWidth=5;
    
    //添加图片的点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.imageView addGestureRecognizer:tap];
    self.imageView.userInteractionEnabled = YES;
}
-(void)tap:(UITapGestureRecognizer *)gesture{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"单击了" message:@"1"preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

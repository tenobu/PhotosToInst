//
//  ViewController.m
//  PhotosToInst
//
//  Created by 寺内 信夫 on 2014/10/31.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)button_Camera_Action:(id)sender
{

}

- (IBAction)button_CameraRoll_Action:(id)sender
{

	UIImage *image = self.imageView.image;
	
	NSString *savePath = [NSHomeDirectory() stringByAppendingPathComponent: 
}

@end

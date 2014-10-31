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

@property (retain, nonatomic) UIDocumentInteractionController *dic;

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

	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	
	[picker setDelegate: self];
	
	picker.sourceType    = UIImagePickerControllerSourceTypeCamera;
	picker.allowsEditing = YES;
	
	[self presentViewController: picker animated: YES completion: nil];
	
}

- (IBAction)button_CameraRoll_Action:(id)sender
{

	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	
	[picker setDelegate: self];
	
	picker.sourceType    = UIImagePickerControllerSourceTypePhotoLibrary;
	picker.allowsEditing = YES;
	
	[self presentViewController: picker animated: YES completion: nil];

}

- (void)shareInstagram
{
	
	UIImage *image = self.imageView.image;
	
	NSString *savePath = [NSHomeDirectory() stringByAppendingPathComponent: @"Documents/Test.ig"];
	
	[UIImagePNGRepresentation(image) writeToFile: savePath atomically: YES];
	
	CGRect rect = CGRectMake( 0, 0, 0, 0 );
	NSString *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent: @"Documents/Test.ig"];
	NSURL *igImageHookFile = [[NSURL alloc] initWithString: [NSString stringWithFormat: @"file://%@", jpgPath]];
							  
	self.dic.UTI = @"com.instagran.photo";
	self.dic = [self setupControllerWithURL: igImageHookFile usingDelegate: self];
	self.dic = [UIDocumentInteractionController interactionControllerWithURL: igImageHookFile];
	
	[self.dic presentOpenInMenuFromRect: rect inView: self.view animated: YES];
	
	NSURL *instagramURL = [NSURL URLWithString: @"instagram://media?id=MEDIA_ID"];
	
	if ( [[UIApplication sharedApplication] canOpenURL: instagramURL] ) {
		
		[self.dic presentOpenInMenuFromRect: rect inView:<#(UIView *)#>self.View animated: YES];
		
	} else {
		
		NSLog( @"No Instagram Found" );
		
	}
	
}

- (UIDocumentInteractionController *)setupControllerWithURL: (NSURL *)fileURL usingDelegate: (id < UIDocumentInteractionControllerDelegate >)
{

	
}

@end

//
//  LBSSViewController.m
//  Library Barcode Secure System
//
//  Created by Chloe Baker on 12/7/13.
//  Copyright (c) 2013 CBaker. All rights reserved.
//

#import "LBSSViewController.h"
#import "User.h"
#import "BarViewController.h"

@interface LBSSViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userIDTextField;
@property (weak, nonatomic) IBOutlet UITextField *userBarcodeTextField;
@property (nonatomic)  User *user;
@property (weak, nonatomic) IBOutlet UIView *cameraView;

@end

@implementation LBSSViewController

- (IBAction)btnCamera:(id)sender {
    [self.userIDTextField resignFirstResponder];
    [self.userBarcodeTextField resignFirstResponder]; //makes the keyboard go away
    self.userBarcodeTextField.text=nil; //makes the text in the textfield blank
    
    AVCaptureSession *session = [[AVCaptureSession alloc] init]; //initializes session
    
    AVCaptureDevice *camera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo]; //sets camera equal to the devault device with video
    
    NSError *outError = nil;
    AVCaptureDeviceInput *cameraInput = [AVCaptureDeviceInput deviceInputWithDevice:camera error:&outError]; //creates the input
    if (cameraInput) {
        [session addInput:cameraInput];
    } else {
        NSLog(@"Error: %@", outError);
    }
    // [session addInput: cameraInput]; //adds input to the session
    
    AVCaptureMetadataOutput *barcodeOutput = [[AVCaptureMetadataOutput alloc] init]; //creates "security guard"
    [barcodeOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()]; //tells "guard" to tell when they see a code 39 barcode
    [session addOutput: barcodeOutput]; //adds output to the session
    barcodeOutput.metadataObjectTypes = @[AVMetadataObjectTypeCode39Code]; //tells "guard" to look for code 39 protocol
    
    [session startRunning];
    
    AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    previewLayer.frame = self.cameraView.bounds;
    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;  // Assume you want the preview layer to fill the view.
    [self.cameraView.layer addSublayer:previewLayer]; //dsiplays feed on view
    
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection //method that gets called when there is a code39 barcode to be passed
{
    
    for (AVMetadataObject *metadata in metadataObjects) {
        NSString *foundString = [(AVMetadataMachineReadableCodeObject *)metadata stringValue];
        self.userBarcodeTextField.text = foundString;
    }
}


- (IBAction)approveButton:(id)sender { //send data to libary database
    NSLog(@"approveButtonPressed");
    
    [self.userIDTextField resignFirstResponder];
    [self.userBarcodeTextField resignFirstResponder];
    
    NSLog(@"%@", self.userIDTextField.text);
    NSLog(@"%@", self.userBarcodeTextField.text);
    
    self.user.userID = self.userIDTextField.text;
    self.user.barcodeNumber = self.userBarcodeTextField.text;
    
    if (self.user.isAuthentic) {
        
    NSLog(@"#yoloswag");
    [self performSegueWithIdentifier:@"switchScreen" sender: self];
    }
    else {
    NSLog(@"LOL you thought");
    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Invalid Information"
                                                message:@"Please enter correct ID and Barcode"
                                                delegate:self                                           cancelButtonTitle:@"OK"                                                 otherButtonTitles:nil];
    [theAlert show];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"switchScreen"])
    {
        BarViewController *otherBarViewController = segue.destinationViewController;
        otherBarViewController.user = self.user;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.userIDTextField.placeholder= @"ID";
    self.userBarcodeTextField.placeholder=@"Barcode";
}


- (User *) user
{
    if (!_user) _user = [[User alloc] init];
    return _user;
}


@end

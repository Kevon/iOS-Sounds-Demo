//
//  ViewController.m
//  Sounds
//
//  Created by Kevin on 8/15/16.
//  Copyright © 2016 Kevin Skompinski. All rights reserved.
//

#import "ViewController.h"
@import AudioToolbox;
@import AVFoundation.AVAudioPlayer;

@interface ViewController ()

@property (assign, nonatomic) SystemSoundID beep1;
@property (assign, nonatomic) SystemSoundID beep2;
@property (assign, nonatomic) SystemSoundID beep3;
@property (assign, nonatomic) SystemSoundID beep4;

@property (strong, nonatomic) AVAudioPlayer *player;

@property (assign, nonatomic) BOOL beep1Good;
@property (assign, nonatomic) BOOL beep2Good;
@property (assign, nonatomic) BOOL beep3Good;
@property (assign, nonatomic) BOOL beep4Good;

@property (assign, nonatomic) BOOL songGood;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *sound1Path = [[NSBundle mainBundle] pathForResource:@"zach_stone_friday_night" ofType:@"mp3"];
    NSURL *url1 = [NSURL fileURLWithPath:sound1Path];
    
    NSString *sound2Path = [[NSBundle mainBundle] pathForResource:@"zach_stone_halfsies" ofType:@"mp3"];
    NSURL *url2 = [NSURL fileURLWithPath:sound2Path];
    
    NSString *sound3Path = [[NSBundle mainBundle] pathForResource:@"zach_stone_pay_me_back" ofType:@"mp3"];
    NSURL *url3 = [NSURL fileURLWithPath:sound3Path];
    
    NSString *sound4Path = [[NSBundle mainBundle] pathForResource:@"zach_stone_teenage_demographic" ofType:@"mp3"];
    NSURL *url4 = [NSURL fileURLWithPath:sound4Path];
    
    NSString *songPath = [[NSBundle mainBundle] pathForResource:@"lovecrimes" ofType:@"mp3"];
    NSURL *songURL = [NSURL fileURLWithPath:songPath];
    
    
    OSStatus statusReport = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url1, &_beep1);
    
    if(statusReport == kAudioServicesNoError){
        self.beep1Good = YES;
    } else{
        self.beep1Good = NO;
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Couldn't load beep 1." message:@"Beep 1 problem." preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    
     statusReport = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url2, &_beep2);
    
    if(statusReport == kAudioServicesNoError){
        self.beep2Good = YES;
    } else{
        self.beep2Good = NO;
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Couldn't load beep 2." message:@"Beep 2 problem." preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    
     statusReport = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url3, &_beep3);
    
    if(statusReport == kAudioServicesNoError){
        self.beep3Good = YES;
    } else{
        self.beep3Good = NO;
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Couldn't load beep 3." message:@"Beep 3 problem." preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    
     statusReport = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url4, &_beep4);
    
    if(statusReport == kAudioServicesNoError){
        self.beep4Good = YES;
    } else{
        self.beep4Good = NO;
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Couldn't load beep 4." message:@"Beep 4 problem." preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    NSError *err;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:songURL error:&err];
    
    if(!self.player){
        self.songGood = NO;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Couldn't load song." message:[err localizedDescription] preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else{
        self.songGood = YES;
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playSound1:(id)sender {
    if(self.beep1Good){
        AudioServicesPlaySystemSound(self.beep1);
    }
}

- (IBAction)playSound2:(id)sender {
    if(self.beep2Good){
        AudioServicesPlaySystemSound(self.beep2);
    }
}

- (IBAction)playSound3:(id)sender {
    if(self.beep3Good){
        AudioServicesPlaySystemSound(self.beep3);
    }
}

- (IBAction)playSound4:(id)sender {
    if(self.beep4Good){
        AudioServicesPlaySystemSound(self.beep4);
    }
}

- (IBAction)startMedia:(id)sender {
    if(self.songGood){
        [self.player play];
    }
    
}

- (IBAction)stopMedia:(id)sender {
    if(self.songGood){
        [self.player stop];
    }
}


- (void) dealloc{
    if(self.beep1Good){
        AudioServicesDisposeSystemSoundID(self.beep1);
    }
    if(self.beep2Good){
        AudioServicesDisposeSystemSoundID(self.beep2);
    }
    if(self.beep3Good){
        AudioServicesDisposeSystemSoundID(self.beep3);
    }
    if(self.beep4Good){
        AudioServicesDisposeSystemSoundID(self.beep4);
    }
}


@end

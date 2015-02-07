//
//  YOSFontViewController.h
//  Fontopaedia
//
//  Created by Yosnier on 07/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YOSFontViewController : UIViewController

@property (strong,nonatomic) UIFont *font;

@property (weak, nonatomic) IBOutlet UILabel *lblFamilyName;
@property (weak, nonatomic) IBOutlet UITextView *tvText;


-(id)initWithFont:(UIFont *) aFont;


@end

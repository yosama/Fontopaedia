//
//  YOSFontViewController.m
//  Fontopaedia
//
//  Created by Yosnier on 07/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "YOSFontViewController.h"

@interface YOSFontViewController ()

@end

@implementation YOSFontViewController


-(id)initWithFont:(UIFont *) aFont {
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        
        _font = aFont;
        
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}


-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self syncModelToView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



-(void) syncModelToView {
    
    self.tvText.font = self.font;    
    self.title = [self.font fontName];
}


@end

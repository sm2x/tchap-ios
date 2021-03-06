/*
 Copyright 2017 Vector Creations Ltd
 Copyright 2019 New Vector Ltd
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "FallbackViewController.h"
//#import "ThemeService.h"
#import "RiotDesignValues.h"

#import "GeneratedInterface-Swift.h"

@interface FallbackViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation FallbackViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.titleLabel.textColor = ThemeService.shared.theme.textSecondaryColor;
    self.titleLabel.textColor = kRiotSecondaryTextColor;
    self.titleLabel.text = NSLocalizedStringFromTable(@"share_extension_auth_prompt", @"Vector", nil);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  CCViewController.m
//  Random Battles
//
//  Created by Jerrod Putman on 2/7/12.
//  Copyright (c) 2012 Tiny Tim Games. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "CCViewController.h"


@implementation CCViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    CCDirector *director = [CCDirector sharedDirector];

    // If the director's OpenGL view hasn't been set up yet, then we should create it now. If you would like to prevent this "lazy loading", you should initialize the director and set its view elsewhere in your code.
    if([director isViewLoaded] == NO)
    {
        director.view = [self createDirectorGLView];
        [self didInitializeDirector];
    }

    director.delegate = self;
    
    // Add the director as a child view controller.
    [self addChildViewController:director];
    
    // Add the director's OpenGL view, and send it to the back of the view hierarchy so we can place UIKit elements on top of it.
    [self.view addSubview:director.view];
    [self.view sendSubviewToBack:director.view];
    
    // Ensure we fulfill all of our view controller containment requirements.
    [director didMoveToParentViewController:self];
}


- (void)viewDidUnload
{
    [super viewDidUnload];

    [[CCDirector sharedDirector] setDelegate:nil];
}


#pragma mark - Setting up the director

- (CCGLView *)createDirectorGLView
{
    // Create a default OpenGL view.
    CCGLView *glView = [CCGLView viewWithFrame:[[[UIApplication sharedApplication] keyWindow] bounds]
                                   pixelFormat:kEAGLColorFormatRGB565
                                   depthFormat:0
                            preserveBackbuffer:NO
                                    sharegroup:nil
                                 multiSampling:NO
                               numberOfSamples:0];
    
    return glView;
}


- (void)didInitializeDirector
{
    CCDirector *director = [CCDirector sharedDirector];

    // Set up some common director properties.
    [director setAnimationInterval:1.0f/60.0f];
    [director enableRetinaDisplay:YES];
}


@end

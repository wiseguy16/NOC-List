//
//  DetailViewController.m
//  NOC List
//
//  Created by Ben Gohlke on 1/28/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

//
// 17. By the empty circle to the left of this IBOutlet, it looks like this property is not connected to its storyboard
//     object. How do we do that?
//
@property (weak, nonatomic) IBOutlet UILabel *coverNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *realNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *accessLevelLabel;

//
// 18. We need properties for the other two labels here so we can reference them in code.
//     Hint: follow the pattern you see above with coverNameLabel.
//

// Why is this here?
- (void)configureView; // This is here to expose the method to other classes importing the header

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    // What does this do?
    [super viewDidLoad]; // This set up the view in memory before displaying to the user. It also gives the developer a chance to customize any changes before displaying to the user.
    
    //
    // 22. We need to make sure to call the configureView method so the detail view will be populated with the agent's data.
    //     How do we do that?
    //
    [self configureView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Managing the detail view

- (void)setAgent:(Agent *)newAgent
{
    if (_agent != newAgent)
    {
        _agent = newAgent;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // What is being checked here?
    if (self.agent) // This is to is an agent object does exist.
    {
        //
        // 19. We need to set the title of this view to "Agent #", where # is the agent's last name (use the cover name). But
        //     the Agent object only has a name property with the first and last name in a single string. How do we get just
        //     the last name?
        //
        //     (hint: We did something similar to this in HW 1)
        //
    //    self.title = self.agent.coverName; // FIX THIS!!!!
        
        
        //
        // 20. Once we have the last name of the agent from the code above, how do we set the view's title to the right
        //     string?
        //
        self.title = self.agent.coverName; // FIX THIS!!!
        
        
        //
        // 21. We need to set the three labels in our view to the agent's cover name, real name, and access label.
        //
        //     The level label will be a little trickier, because the level property is an NSInteger. We also want that label
        //     to read "Level #". How do we do that?
        //
        self.coverNameLabel.text = self.agent.coverName;
        self.realNameLabel.text = self.agent.realName;
        self.accessLevelLabel.text = [NSString stringWithFormat:@"Level #%ld",(long)self.agent.accessLevel];
        
        
        
    }
}

@end
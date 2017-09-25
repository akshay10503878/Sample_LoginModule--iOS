//
//  LoginCell.m
//  Auidable
//
//  Created by akshay bansal on 8/7/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import "LoginCell.h"


@interface LoginCell()
{
    UIImageView *logoImageView;
    UITextField *emailTextField;
    UITextField *passwordTextField;
    UIButton *loginButton;

}

@end


@implementation LoginCell

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    
    if (self) {
        [self setupViews];
    }
    

    return self;
}
-(void)setupViews{


    logoImageView=[[UIImageView alloc] init];
    [logoImageView setImage:[UIImage imageNamed:@"logo"]];
    logoImageView.translatesAutoresizingMaskIntoConstraints=false;
    [self addSubview:logoImageView];

    
    emailTextField=[[UITextField alloc] init];
    emailTextField.translatesAutoresizingMaskIntoConstraints=false;
    emailTextField.placeholder=@"Enter Email";
    emailTextField.layer.borderColor=[UIColor lightGrayColor].CGColor;
    emailTextField.layer.borderWidth=1;
    emailTextField.keyboardType=UIKeyboardTypeEmailAddress;
    emailTextField.translatesAutoresizingMaskIntoConstraints=false;
    UIView *emailTextFieldPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    emailTextField.leftView = emailTextFieldPaddingView;
    emailTextField.leftViewMode = UITextFieldViewModeAlways;
    [self addSubview:emailTextField];
    

    passwordTextField=[[UITextField alloc] init];
    passwordTextField.translatesAutoresizingMaskIntoConstraints=false;
    passwordTextField.placeholder=@"Enter Password";
    passwordTextField.layer.borderColor=[UIColor lightGrayColor].CGColor;
    passwordTextField.layer.borderWidth=1;
    passwordTextField.keyboardType=UIKeyboardTypeASCIICapable;
    passwordTextField.secureTextEntry=true;
    passwordTextField.translatesAutoresizingMaskIntoConstraints=false;
    UIView *passwordTextFieldPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    passwordTextField.leftView = passwordTextFieldPaddingView;
    passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    [self addSubview:passwordTextField];
    
    
    loginButton=[[UIButton alloc] initWithFrame:CGRectZero];
    [loginButton setTitle:@"Log In" forState:UIControlStateNormal];
    loginButton.backgroundColor=[UIColor colorWithRed:247.0/255.0 green:154.0/255.0 blue:27.0/255.0   alpha:1];
    loginButton.translatesAutoresizingMaskIntoConstraints=false;
    [self addSubview:loginButton];
    
    
    [logoImageView.topAnchor constraintEqualToAnchor:self.centerYAnchor constant:-230].active=YES;
    [logoImageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active=YES;
    [logoImageView.widthAnchor constraintEqualToConstant:160].active=YES;
    [logoImageView.heightAnchor constraintEqualToConstant:160].active=YES;
    
    [emailTextField.topAnchor constraintEqualToAnchor:logoImageView.bottomAnchor constant:8].active=YES;
    [emailTextField.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:32].active=YES;
    [emailTextField.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-32].active=YES;
    [emailTextField.heightAnchor constraintEqualToConstant:50].active=YES;
    
    
    [passwordTextField.topAnchor constraintEqualToAnchor:emailTextField.bottomAnchor constant:8].active=YES;
    [passwordTextField.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:32].active=YES;
    [passwordTextField.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-32].active=YES;
    [passwordTextField.heightAnchor constraintEqualToConstant:50].active=YES;
    
    
    
    [loginButton.topAnchor constraintEqualToAnchor:passwordTextField.bottomAnchor constant:16].active=YES;
    [loginButton.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:32].active=YES;
    [loginButton.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-32].active=YES;
    [loginButton.heightAnchor constraintEqualToConstant:50].active=YES;
    
}

@end

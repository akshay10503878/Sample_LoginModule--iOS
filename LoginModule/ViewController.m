//
//  ViewController.m
//  Auidable
//
//  Created by akshay bansal on 8/5/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import "ViewController.h"
#import "PageCell.h"
#import "PageInfo.h"
#import "LoginCell.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView *cv ;
    NSArray<PageInfo *> *pages;
    UIPageControl *pageControl;
    UIButton *skipButton;
    UIButton *nextButton;
    NSLayoutConstraint *pageControlBottomAnchor;
    NSLayoutConstraint *nextButtonTopAnchor;
    NSLayoutConstraint *skipButtonTopAnchor;
}

//@property(nonatomic,strong)UIButton *skipbutton;

#define cellID  @"cellid"
#define LogincellID  @"loginCellid"

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    [self observeKeyboardNotification];
    
    PageInfo *firstPage=[[PageInfo alloc] initWithTitle:@"Share a Great Listen" imageName:@"page1" message:@"It's free to send your books to people in your life. Every recipent's book is on us."];
    PageInfo *secondPage=[[PageInfo alloc] initWithTitle:@"Send from your library" imageName:@"page2.png" message:@"Tap the more menue next to any book. Choose \"Send This Book\""];
    
    PageInfo *thirdPage=[[PageInfo alloc] initWithTitle:@"Send from your player" imageName:@"page3" message:@"Tap the more menue in the upper corner. Choose \"Send This Book\""];
    pages=[[NSArray alloc] initWithObjects:firstPage,secondPage,thirdPage, nil];
    
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing=0;
    cv =[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    cv.translatesAutoresizingMaskIntoConstraints=false;
    cv.backgroundColor=[UIColor whiteColor];
    cv.translatesAutoresizingMaskIntoConstraints=false;
    cv.pagingEnabled=TRUE;
    cv.delegate=self;
    cv.dataSource=self;
    [cv registerClass:[PageCell class] forCellWithReuseIdentifier:cellID];
    [cv registerClass:[LoginCell class] forCellWithReuseIdentifier:LogincellID];
    cv.showsHorizontalScrollIndicator=false;
    
    [self.view addSubview:cv];
    
    pageControl=[[UIPageControl alloc] initWithFrame:CGRectZero];
    pageControl.numberOfPages=pages.count+1;
    pageControl.pageIndicatorTintColor=[UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor=[UIColor colorWithRed:247.0/255.0 green:154.0/255.0 blue:27.0/255.0   alpha:1];
    pageControl.translatesAutoresizingMaskIntoConstraints=false;
    [self.view addSubview:pageControl];
    
    
    
    skipButton =  [UIButton buttonWithType:UIButtonTypeSystem];
    [skipButton setTitle:@"Skip" forState:UIControlStateNormal];
    [skipButton setTitleColor:[UIColor colorWithRed:247.0/255.0 green:154.0/255.0 blue:27.0/255.0   alpha:1] forState:UIControlStateNormal];
    skipButton.translatesAutoresizingMaskIntoConstraints=false;
    [skipButton addTarget:self action:@selector(skip) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:skipButton];
    
    
    nextButton =  [UIButton buttonWithType:UIButtonTypeSystem];
    [nextButton setTitle:@"Next" forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor colorWithRed:247.0/255.0 green:154.0/255.0 blue:27.0/255.0   alpha:1] forState:UIControlStateNormal];
    nextButton.translatesAutoresizingMaskIntoConstraints=false;
    [nextButton addTarget:self action:@selector(nextPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
    
    
    
    
    
    // Creating the same constraints using Layout Anchors
    [cv.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:0.0].active=YES;
    [cv.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0].active = YES;
    [cv.topAnchor constraintEqualToAnchor:self.view.topAnchor].active=YES;
    [cv.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active=YES;
    
    
    
    [pageControl.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:0].active=YES;
    [pageControl.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:0].active=YES;
    pageControlBottomAnchor=[pageControl.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0];
    pageControlBottomAnchor.active=YES;
    [pageControl.heightAnchor constraintEqualToConstant:30].active=YES;

    
    
    
    [skipButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:0].active=YES;
    skipButtonTopAnchor= [skipButton.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:16];
    skipButtonTopAnchor.active=YES;
    [skipButton.widthAnchor constraintEqualToConstant:80].active=YES;
    [skipButton.heightAnchor constraintEqualToConstant:50].active=YES;
    
    [nextButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:0].active=YES;
    nextButtonTopAnchor=[nextButton.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:16];
    nextButtonTopAnchor.active=YES;
    [nextButton.widthAnchor constraintEqualToConstant:80].active=YES;
    [nextButton.heightAnchor constraintEqualToConstant:50].active=YES;
    
    
}



-(void)observeKeyboardNotification{


    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide) name:UIKeyboardWillHideNotification object:nil];

}

-(void)keyboardShow{

    [UIView animateWithDuration:0.5f delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
    
        self.view.frame=CGRectMake(0, -50, self.view.frame.size.width, self.view.frame.size.height);
    
    } completion:nil];

}

-(void)keyboardHide{
    
    [UIView animateWithDuration:0.5f delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
    } completion:nil];
    
}


-(void)moveControlConstraintsOffScreen{
    
    pageControlBottomAnchor.constant=40;
    nextButtonTopAnchor.constant=-40;
    skipButtonTopAnchor.constant=-40;
    
}




-(void)nextPage{
    
    if (pageControl.currentPage == pages.count) {
        return;
    }

    
    if (pageControl.currentPage==pages.count-1) {
        
        [self moveControlConstraintsOffScreen];
        
        [UIView animateWithDuration:0.5f delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            [self.view layoutIfNeeded];
            
        } completion:nil];

    }
    
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:pageControl.currentPage+1 inSection:0];

                            
    [cv scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    pageControl.currentPage+=1;
}


-(void)skip{
    
    pageControl.currentPage=pages.count-1;
    [self nextPage];

}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];

}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    
    pageControl.currentPage=targetContentOffset->x/self.view.frame.size.width;
    
    if (pageControl.currentPage==pages.count) {
        [self moveControlConstraintsOffScreen];
    }
    else
    {
        pageControlBottomAnchor.constant=0;
        nextButtonTopAnchor.constant=16;
        skipButtonTopAnchor.constant=16;
    
    }
    
    [UIView animateWithDuration:0.5f delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
    
        [self.view layoutIfNeeded];
        
    } completion:nil];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return pages.count + 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == pages.count) {
        
        UICollectionViewCell *loginCell=[collectionView dequeueReusableCellWithReuseIdentifier:LogincellID forIndexPath:indexPath];
        return loginCell;
    }
    

    PageCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    ;
    
    
    PageInfo *page=[pages objectAtIndex:indexPath.row];
    cell.page=page;

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [cv.collectionViewLayout invalidateLayout];
    
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:pageControl.currentPage inSection:0];
    dispatch_async(dispatch_get_main_queue(), ^{
    
        [cv scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        [cv reloadItemsAtIndexPaths:@[indexPath]];
        
    });
    

}

@end

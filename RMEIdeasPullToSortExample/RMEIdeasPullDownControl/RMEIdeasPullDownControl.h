//
//  RMEIdeasPullDownControl.h
//  RememberMe
//
//  Created by Osagie Zogie-Odigie on 01/06/2013.
//  Copyright (c) 2013 Osagie Zogie-Odigie. All rights reserved.
//

#import <UIKit/UIKit.h>


@class RMEIdeasPullDownControl;

@protocol RMEIdeasPullDownControlProtocol <NSObject>
- (void) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl selectedControlAtIndex:(NSUInteger)controlIndex;


@end

@protocol RMEIdeasPullDownControlDataSource <NSObject>

@required

- (NSUInteger) numberOfButtonsRequired:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl;
- (UIImage*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl imageForControlAtIndex:(NSUInteger)controlIndex;
- (UIImage*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl selectedImageForControlAtIndex:(NSUInteger)controlIndex;
- (NSString*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl titleForControlAtIndex:(NSUInteger)controlIndex;

@end

@interface RMEIdeasPullDownControl : UIView

- (void) selectControlAtIndex:(NSInteger)controlIndex;
- (id)initWithDataSource:(id<RMEIdeasPullDownControlProtocol>)dataSource
                delegate:(id<RMEIdeasPullDownControlProtocol>)delegate
        clientScrollView:(UIScrollView*)clientScrollView;

@end

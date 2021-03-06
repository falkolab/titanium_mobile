/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2010-2015 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiUIiOSProxy.h"
#import "TiUtils.h"
#import "Webcolor.h"
#ifdef USE_TI_UIIOS

#ifdef USE_TI_UIIOSPREVIEWCONTEXT
#import "TiUIiOSPreviewContextProxy.h"
#import "TiUIiOSPreviewActionProxy.h"
#import "TiUIiOSPreviewActionGroupProxy.h"
#endif

#ifdef USE_TI_UIIOSMENUPOPUP
#import "TiUIiOSMenuPopupProxy.h"
#endif

#ifdef USE_TI_UIIOSLIVEPHOTOVIEW
#import "TiUIiOSLivePhotoViewProxy.h"
#endif

#ifdef USE_TI_UIIOSTRANSITIONANIMATION
#import "TiUIiOSTransitionAnimationProxy.h"
#endif

#ifdef USE_TI_UIIOSATTRIBUTEDSTRING
#import "TiUIAttributedStringProxy.h"
#endif

#ifdef USE_TI_UIIOSADVIEW
#import "TiUIiOSAdViewProxy.h"
#import <iAd/iAd.h>
#endif

#ifdef USE_TI_UIIOS3DMATRIX
#import "Ti3DMatrix.h"
#endif

#ifdef USE_TI_UIIOSCOVERFLOWVIEW
#import "TiUIiOSCoverFlowViewProxy.h"
#endif

#ifdef USE_TI_UIIOSTOOLBAR
#import "TiUIiOSToolbarProxy.h"
#endif

#ifdef USE_TI_UIIOSTABBEDBAR
#import "TiUIiOSTabbedBarProxy.h"
#endif

#if defined(USE_TI_UIIPADDOCUMENTVIEWER) || defined(USE_TI_UIIOSDOCUMENTVIEWER)
#import "TiUIiOSDocumentViewerProxy.h"
#endif

#ifdef USE_TI_UIIOSNAVIGATIONWINDOW
#import "TiUIiOSNavWindowProxy.h"
#endif

#ifdef USE_TI_UIIOSSPLITWINDOW
#import "TiUIiOSSplitWindowProxy.h"
#endif

#ifdef USE_TI_UIIOSANIMATOR
#import "TiAnimatorProxy.h"
#ifdef USE_TI_UIIOSSNAPBEHAVIOR
#import "TiSnapBehavior.h"
#endif
#ifdef USE_TI_UIIOSPUSHBEHAVIOR
#import "TiPushBehavior.h"
#endif
#ifdef USE_TI_UIIOSGRAVITYBEHAVIOR
#import "TiGravityBehavior.h"
#endif
#ifdef USE_TI_UIIOSANCHORATTACHMENTBEHAVIOR
#import "TiAnchorAttachBehavior.h"
#endif
#ifdef USE_TI_UIIOSVIEWATTACHMENTBEHAVIOR
#import "TiViewAttachBehavior.h"
#endif
#ifdef USE_TI_UIIOSCOLLISIONBEHAVIOR
#import "TiCollisionBehavior.h"
#endif
#ifdef USE_TI_UIIOSDYNAMICITEMBEHAVIOR
#import "TiDynamicItemBehavior.h"
#endif
#endif

#ifdef USE_TI_UIIOSAPPLICATIONSHORTCUTS
#import "TiUIiOSApplicationShortcutsProxy.h"
#endif

#if defined(USE_TI_UIIOSLIVEPHOTOBADGE) || defined(USE_TI_UIIOSLIVEPHOTOVIEW)
#import <PhotosUI/PhotosUI.h>
#endif

#ifdef USE_TI_UIIOSBLURVIEW
#import "TiUIiOSBlurViewProxy.h"
#endif

@implementation TiUIiOSProxy

#define FORGET_AND_RELEASE(x) \
{\
[self forgetProxy:x]; \
RELEASE_TO_NIL(x); \
}


-(NSString*)apiName
{
    return @"Ti.UI.iOS";
}

-(NSNumber*)forceTouchSupported
{
    return NUMBOOL([TiUtils forceTouchSupported]);
}

-(NSNumber*)SCROLL_DECELERATION_RATE_NORMAL
{
    return NUMFLOAT(UIScrollViewDecelerationRateNormal);
}

-(NSNumber*)SCROLL_DECELERATION_RATE_FAST
{
    return NUMFLOAT(UIScrollViewDecelerationRateFast);
}

-(NSNumber*)CLIP_MODE_DEFAULT
{
    return NUMINT(0);
}
-(NSNumber*)CLIP_MODE_ENABLED
{
    return NUMINT(1);
}
-(NSNumber*)CLIP_MODE_DISABLED
{
    return NUMINT(-1);
}

#ifdef USE_TI_UILISTVIEW
-(NSNumber*) ROW_ACTION_STYLE_DEFAULT
{
    if ([TiUtils isIOS8OrGreater]) {
        return NUMINTEGER(UITableViewRowActionStyleDefault);
    }
    return nil;
}
-(NSNumber*) ROW_ACTION_STYLE_DESTRUCTIVE
{
    if ([TiUtils isIOS8OrGreater]) {
        return NUMINTEGER(UITableViewRowActionStyleDestructive);
    }
    return nil;
}
-(NSNumber*) ROW_ACTION_STYLE_NORMAL
{
    if ([TiUtils isIOS8OrGreater]) {
        return NUMINTEGER(UITableViewRowActionStyleNormal);
    }
    return nil;
}
#endif

#ifdef USE_TI_UIIOSPREVIEWCONTEXT
-(NSNumber*) PREVIEW_ACTION_STYLE_DEFAULT
{
    if ([TiUtils isIOS9OrGreater]) {
        return NUMINTEGER(UIPreviewActionStyleDefault);
    }
    return nil;
}
-(NSNumber*) PREVIEW_ACTION_STYLE_DESTRUCTIVE
{
    if ([TiUtils isIOS9OrGreater]) {
        return NUMINTEGER(UIPreviewActionStyleDestructive);
    }
    return nil;
}
-(NSNumber*) PREVIEW_ACTION_STYLE_SELECTED
{
    if ([TiUtils isIOS9OrGreater]) {
        return NUMINTEGER(UIPreviewActionStyleSelected);
    }
    return nil;
}
#endif


- (void)dealloc
{
#ifdef USE_TI_UIIPHONEANIMATIONSTYLE
    RELEASE_TO_NIL(_animationStyleProxy);
#endif
#ifdef USE_TI_UIIOSROWANIMATIONSTYLE
    RELEASE_TO_NIL(_RowAnimationStyle);
#endif
#ifdef USE_TI_UIIOSALERTDIALOGSTYLE
    RELEASE_TO_NIL(_AlertDialogStyle);
#endif
#if defined(USE_TI_UIIOSTABLEVIEWCELLSELECTIONSTYLE) || defined (USE_TI_UIIOSLISTVIEWCELLSELECTIONSTYLE)
    RELEASE_TO_NIL(_TableViewCellSelectionStyle);
    RELEASE_TO_NIL(_ListViewCellSelectionStyle);
#endif
#if defined(USE_TI_UIIOSTABLEVIEWSCROLLPOSITION) || defined(USE_TI_UIIOSLISTVIEWSCROLLPOSITION)
    RELEASE_TO_NIL(_TableViewScrollPosition);
    RELEASE_TO_NIL(_ListViewScrollPosition);
#endif
#if defined(USE_TI_UIIOSTABLEVIEWSTYLE) || defined(USE_TI_UIIOSLISTVIEWSTYLE)
    RELEASE_TO_NIL(_TableViewStyle);
    RELEASE_TO_NIL(_ListViewStyle);
#endif
#ifdef USE_TI_UIIOSPROGRESSBARSTYLE
    RELEASE_TO_NIL(_ProgressBarStyle);
#endif
#ifdef USE_TI_UIIOSSCROLLINDICATORSTYLE
    RELEASE_TO_NIL(_ScrollIndicatorStyle);
#endif
#ifdef USE_TI_UIIOSSTATUSBAR
    RELEASE_TO_NIL(_StatusBar);
#endif
#ifdef USE_TI_UIIOSSYSTEMBUTTONSTYLE
    RELEASE_TO_NIL(_SystemButton);
#endif
#ifdef USE_TI_UIIOSSYSTEMBUTTONSTYLE
    RELEASE_TO_NIL(_SystemButtonStyle);
#endif
#ifdef USE_TI_UIIOSSYSTEMICON
    RELEASE_TO_NIL(_SystemIcon);
#endif

    [super dealloc];
}

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
#ifdef USE_TI_UIIPHONEANIMATIONSTYLE
    FORGET_AND_RELEASE(_animationStyleProxy);
#endif

#ifdef USE_TI_UIIOSROWANIMATIONSTYLE
    FORGET_AND_RELEASE(_RowAnimationStyle);
#endif
#ifdef USE_TI_UIIOSALERTDIALOGSTYLE
    FORGET_AND_RELEASE(_AlertDialogStyle);
#endif
#if defined(USE_TI_UIIOSTABLEVIEWCELLSELECTIONSTYLE) || defined (USE_TI_UIIOSLISTVIEWCELLSELECTIONSTYLE)
    FORGET_AND_RELEASE(_TableViewCellSelectionStyle);
    FORGET_AND_RELEASE(_ListViewCellSelectionStyle);
    
#endif
    
#if defined(USE_TI_UIIOSTABLEVIEWSCROLLPOSITION) || defined(USE_TI_UIIOSLISTVIEWSCROLLPOSITION)
    FORGET_AND_RELEASE(_TableViewScrollPosition);
    FORGET_AND_RELEASE(_ListViewScrollPosition);
#endif
#if defined(USE_TI_UIIOSTABLEVIEWSTYLE) || defined(USE_TI_UIIOSLISTVIEWSTYLE)
    FORGET_AND_RELEASE(_TableViewStyle);
    FORGET_AND_RELEASE(_ListViewStyle);
#endif
    
#ifdef USE_TI_UIIOSPROGRESSBARSTYLE
    FORGET_AND_RELEASE(_ProgressBarStyle);
#endif
#ifdef USE_TI_UIIOSSCROLLINDICATORSTYLE
    FORGET_AND_RELEASE(_ScrollIndicatorStyle);
#endif
#ifdef USE_TI_UIIOSSTATUSBAR
    FORGET_AND_RELEASE(_StatusBar);
#endif
#ifdef USE_TI_UIIOSSYSTEMBUTTONSTYLE
    FORGET_AND_RELEASE(_SystemButtonStyle);
#endif
    
#ifdef USE_TI_UIIOSSYSTEMBUTTON
  FORGET_AND_RELEASE(_SystemButton);
#endif
#ifdef USE_TI_UIIOSSYSTEMICON
    FORGET_AND_RELEASE(_SystemIcon);
#endif
    [super didReceiveMemoryWarning:notification];
}

#ifdef USE_TI_UIIOSALERTDIALOGSTYLE
-(TIUIiOSAlertDialogStyleProxy*)AlertDialogStyle
{
    if (_AlertDialogStyle == nil) {
       _AlertDialogStyle = [[TIUIiOSAlertDialogStyleProxy alloc] _initWithPageContext:[self pageContext]];
    }
    return _AlertDialogStyle;
}
#endif

#ifdef USE_TI_UIIOSANIMATIONSTYLE
-(TiUIiOSAnimationStyleProxy*)AnimationStyle
{
    if (_animationStyleProxy == nil) {
        _animationStyleProxy = [[TiUIiOSAnimationStyleProxy alloc]_initWithPageContext:[self pageContext]];
    }
    return _animationStyleProxy;
}
#endif


#if defined(USE_TI_UIIOSTABLEVIEWCELLSELECTIONSTYLE) || defined (USE_TI_UIIOSLISTVIEWCELLSELECTIONSTYLE)
-(TiUIiOSTableViewCellSelectionStyleProxy*)TableViewCellSelectionStyle
{
    if (_TableViewCellSelectionStyle == nil) {
        _TableViewCellSelectionStyle = [[TiUIiOSTableViewCellSelectionStyleProxy alloc]_initWithPageContext:[self pageContext]];
    }
    return _TableViewCellSelectionStyle;
}

-(TiUIiOSTableViewCellSelectionStyleProxy*)ListViewCellSelectionStyle
{
    if (_ListViewCellSelectionStyle == nil) {
        _ListViewCellSelectionStyle = [[TiUIiOSTableViewCellSelectionStyleProxy alloc]_initWithPageContext:[self pageContext]];
    }
    return _ListViewCellSelectionStyle;
}
#endif

#if defined(USE_TI_UIIOSTABLEVIEWSCROLLPOSITION) || defined(USE_TI_UIIOSLISTVIEWSCROLLPOSITION)
-(TiUIiOSTableViewScrollPositionProxy*)TableViewScrollPosition
{
    if (_TableViewScrollPosition == nil) {
        _TableViewScrollPosition = [[TiUIiOSTableViewScrollPositionProxy alloc]_initWithPageContext:[self pageContext]];
    }
    return _TableViewScrollPosition;
}

-(TiUIiOSTableViewScrollPositionProxy*)ListViewScrollPosition
{
    if (_ListViewScrollPosition == nil) {
        _ListViewScrollPosition = [[TiUIiOSTableViewScrollPositionProxy alloc]_initWithPageContext:[self pageContext]];
    }
    return _ListViewScrollPosition;
}
#endif

#if defined(USE_TI_UIIOSTABLEVIEWSTYLE) || defined(USE_TI_UIIOSLISTVIEWSTYLE)
-(TiUIiOSTableViewStyleProxy*)TableViewStyle
{
    if (_TableViewStyle == nil) {
    _TableViewStyle = [[TiUIiOSTableViewStyleProxy alloc]_initWithPageContext:[self pageContext]];
    }
    return _TableViewStyle;
}

-(TiUIiOSTableViewStyleProxy*)ListViewStyle
{
    if (_ListViewStyle == nil) {
        _ListViewStyle = [[TiUIiOSTableViewStyleProxy alloc]_initWithPageContext:[self pageContext]];
    }
    return _ListViewStyle;
}
#endif

#ifdef USE_TI_UIIOSANIMATIONSTYLE
-(TiUIiOSProgressBarStyleProxy*)ProgressBarStyle
{
    if (_ProgressBarStyle == nil) {
        _ProgressBarStyle = [[TiUIiOSProgressBarStyleProxy alloc]_initWithPageContext:[self pageContext]];
    }
    return _ProgressBarStyle;
}
#endif

#ifdef USE_TI_UIIOSROWANIMATIONSTYLE
-(TiUIiOSRowAnimationStyleProxy*)RowAnimationStyle
{
    if (_RowAnimationStyle == nil) {
        _RowAnimationStyle = [[TiUIiOSRowAnimationStyleProxy alloc]_initWithPageContext:[self pageContext]];
    }
    return _RowAnimationStyle;
}
#endif

#ifdef USE_TI_UIIOSSCROLLINDICATORSTYLE
-(TiUIiOSScrollIndicatorStyleProxy*)ScrollIndicatorStyle
{
    if (_ScrollIndicatorStyle == nil) {
        _ScrollIndicatorStyle = [[TiUIiOSScrollIndicatorStyleProxy alloc]_initWithPageContext:[self pageContext]];
    }
    return _ScrollIndicatorStyle;
}
#endif

#ifdef USE_TI_UIIOSSTATUSBAR
-(TiUIiOSStatusBarProxy*)StatusBar
{
    if (_StatusBar == nil) {
         _StatusBar = [[TiUIiOSStatusBarProxy alloc]_initWithPageContext:[self pageContext]];
    }
    return _StatusBar;
}
#endif

#ifdef USE_TI_UIIOSSYSTEMBUTTONSTYLE
-(TiUIiOSSystemButtonStyleProxy*)SystemButtonStyle
{
    if (_SystemButtonStyle == nil) {
        _SystemButtonStyle = [[TiUIiOSSystemButtonStyleProxy alloc]_initWithPageContext:[self pageContext]];
    }
    return _SystemButtonStyle;
}
#endif

#ifdef USE_TI_UIIOSSYSTEMBUTTON
-(TiUIiOSSystemButtonProxy*)SystemButton
{
    if (_SystemButton == nil) {
        _SystemButton = [[TiUIiOSSystemButtonProxy alloc]_initWithPageContext:[self pageContext]];
    }
    return _SystemButton;
}
#endif

#ifdef USE_TI_UIIOSSYSTEMICON
-(TiUIiOSSystemIconProxy*)SystemIcon
{
    if (_SystemIcon == nil) {
        _SystemIcon = [[TiUIiOSSystemIconProxy alloc]_initWithPageContext:[self pageContext]];
    }
    return _SystemIcon;
}
#endif

-(void)setAppBadge:(id)value
{
    ENSURE_UI_THREAD(setAppBadge,value);
    if (value == [NSNull null]) {
        [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    } else {
        [[UIApplication sharedApplication] setApplicationIconBadgeNumber:[TiUtils intValue:value]];
    }
}

BEGIN_UI_THREAD_PROTECTED_VALUE(appBadge,NSNumber)
result = [NSNumber numberWithInteger:[[UIApplication sharedApplication] applicationIconBadgeNumber]];
END_UI_THREAD_PROTECTED_VALUE(appBadge)

-(void)setAppSupportsShakeToEdit:(NSNumber *)shake
{
    ENSURE_UI_THREAD(setAppSupportsShakeToEdit,shake);
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:[shake boolValue]];
}

BEGIN_UI_THREAD_PROTECTED_VALUE(appSupportsShakeToEdit,NSNumber)
result = [NSNumber numberWithBool:[[UIApplication sharedApplication] applicationSupportsShakeToEdit]];
END_UI_THREAD_PROTECTED_VALUE(appSupportsShakeToEdit)

#ifdef USE_TI_UIIOSBLURVIEW
- (NSNumber*) BLUR_EFFECT_STYLE_EXTRA_LIGHT
{
    if ([TiUtils isIOS8OrGreater]) {
        return NUMINTEGER(UIBlurEffectStyleExtraLight);
    }
    return nil;
}

- (NSNumber* )BLUR_EFFECT_STYLE_LIGHT
{
    if ([TiUtils isIOS8OrGreater]) {
        return NUMINTEGER(UIBlurEffectStyleLight);
    }
    return nil;
}

- (NSNumber*) BLUR_EFFECT_STYLE_DARK
{
    if ([TiUtils isIOS8OrGreater]) {
        return NUMINTEGER(UIBlurEffectStyleDark);
    }
    return nil;
}
#endif

#ifdef USE_TI_UIIOSMENUPOPUP
MAKE_SYSTEM_PROP(MENU_POPUP_ARROW_DIRECTION_UP, UIMenuControllerArrowUp);
MAKE_SYSTEM_PROP(MENU_POPUP_ARROW_DIRECTION_DOWN, UIMenuControllerArrowDown);
MAKE_SYSTEM_PROP(MENU_POPUP_ARROW_DIRECTION_LEFT, UIMenuControllerArrowLeft);
MAKE_SYSTEM_PROP(MENU_POPUP_ARROW_DIRECTION_RIGHT, UIMenuControllerArrowRight);
MAKE_SYSTEM_PROP(MENU_POPUP_ARROW_DIRECTION_DEFAULT, UIMenuControllerArrowDefault);
#endif

//DEPRECATED, REPLACED IN UIMODULE FOR TI_UIATTRIBUTEDSTRING
#ifdef USE_TI_UIIOSATTRIBUTEDSTRING
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_FONT, AttributeNameFont, @"UI.iOS.ATTRIBUTE_FONT", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_FONT");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_PARAGRAPH_STYLE, AttributeNameParagraphStyle, @"UI.iOS.ATTRIBUTE_PARAGRAPH_STYLE", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_PARAGRAPH_STYLE");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_FOREGROUND_COLOR, AttributeNameForegroundColor,@"UI.iOS.ATTRIBUTE_FOREGROUND_COLOR", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_FOREGROUND_COLOR");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_BACKGROUND_COLOR, AttributeNameBackgroundColor,@"UI.iOS.ATTRIBUTE_BACKGROUND_COLOR", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_BACKGROUND_COLOR");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_LIGATURE, AttributeNameLigature, @"UI.iOS.ATTRIBUTE_LIGATURE", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_LIGATURE");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_KERN, AttributeNameKern, @"UI.iOS.ATTRIBUTE_KERN", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_KERN");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_STRIKETHROUGH_STYLE, AttributeNameStrikethroughStyle, @"UI.iOS.ATTRIBUTE_STRIKETHROUGH_STYLE", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_STRIKETHROUGH_STYLE");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_UNDERLINES_STYLE, AttributeNameUnderlineStyle, @"UI.iOS.ATTRIBUTE_UNDERLINES_STYLE", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_UNDERLINES_STYLE");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_STROKE_COLOR, AttributeNameStrokeColor, @"UI.iOS.ATTRIBUTE_STROKE_COLOR", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_STROKE_COLOR");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_STROKE_WIDTH, AttributeNameStrokeWidth, @"UI.iOS.ATTRIBUTE_STROKE_WIDTH", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_STROKE_WIDTH");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_SHADOW, AttributeNameShadow, @"UI.iOS.ATTRIBUTE_SHADOW", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_SHADOW");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_VERTICAL_GLYPH_FORM, AttributeNameVerticalGlyphForm, @"UI.iOS.ATTRIBUTE_VERTICAL_GLYPH_FORM", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_VERTICAL_GLYPH_FORM");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_WRITING_DIRECTION, AttributeNameWritingDirection, @"UI.iOS.ATTRIBUTE_WRITING_DIRECTION", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_WRITING_DIRECTION");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_TEXT_EFFECT, AttributeNameTextEffect, @"UI.iOS.ATTRIBUTE_TEXT_EFFECT", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_TEXT_EFFECT");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_ATTACHMENT, AttributeNameAttachment, @"UI.iOS.ATTRIBUTE_ATTACHMENT", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_ATTACHEMENT");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_LINK, AttributeNameLink, @"UI.iOS.ATTRIBUTE_LINK", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_LINK");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_BASELINE_OFFSET, AttributeNameBaselineOffset, @"UI.iOS.ATTRIBUTE_BASELINE_OFFSET", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_BASELINE_OFFSET");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_UNDERLINE_COLOR, AttributeNameUnderlineColor, @"UI.iOS.ATTRIBUTE_UNDERLINE_COLOR", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_UNDERLINE_COLOR");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_STRIKETHROUGH_COLOR, AttributeNameStrikethroughColor, @"UI.iOS.ATTRIBUTE_STRIKETHROUGH_COLOR", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_STRIKETHROUGH_COLOR");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_OBLIQUENESS, AttributeNameObliqueness, @"UI.iOS.ATTRIBUTE_OBLIQUENESS", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_OBLIQUENESS");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ATTRIBUTE_EXPANSION, AttributeNameExpansion, @"UI.iOS.ATTRIBUTE_EXPANSION", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_EXPANSION");

-(NSNumber*)ATTRIBUTE_UNDERLINE_STYLE_NONE
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.ATTRIBUTE_UNDERLINE_STYLE_NONE", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_UNDERLINE_STYLE_NONE")
    return NUMINTEGER(NSUnderlineStyleNone);
}
-(NSNumber*)ATTRIBUTE_UNDERLINE_STYLE_SINGLE
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.ATTRIBUTE_UNDERLINE_STYLE_SINGLE", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_UNDERLINE_STYLE_SINGLE")
    return NUMINTEGER(NSUnderlineStyleSingle);
}
-(NSNumber*)ATTRIBUTE_UNDERLINE_STYLE_THICK
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.ATTRIBUTE_UNDERLINE_STYLE_THICK", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_UNDERLINE_STYLE_THICK")
    return NUMINTEGER(NSUnderlineStyleThick);
}
-(NSNumber*)ATTRIBUTE_UNDERLINE_STYLE_DOUBLE
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.ATTRIBUTE_UNDERLINE_STYLE_DOUBLE", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_UNDERLINE_STYLE_DOUBLE")
    return NUMINTEGER(NSUnderlineStyleDouble);
}
-(NSNumber*)ATTRIBUTE_UNDERLINE_PATTERN_SOLID
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.ATTRIBUTE_UNDERLINE_PATTERN_SOLID", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_UNDERLINE_PATTERN_SOLID")
    return NUMINTEGER(NSUnderlinePatternSolid);
}
-(NSNumber*)ATTRIBUTE_UNDERLINE_PATTERN_DOT
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.ATTRIBUTE_UNDERLINE_PATTERN_DOT", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_UNDERLINE_PATTERN_DOT")
    return NUMINTEGER(NSUnderlinePatternDot);
}
-(NSNumber*)ATTRIBUTE_UNDERLINE_PATTERN_DASH
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.ATTRIBUTE_UNDERLINE_PATTERN_DASH", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_UNDERLINE_PATTERN_DASH")
    return NUMINTEGER(NSUnderlinePatternDash);
}
-(NSNumber*)ATTRIBUTE_UNDERLINE_PATTERN_DASH_DOT
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.ATTRIBUTE_UNDERLINE_PATTERN_DASH_DOT", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_UNDERLINE_PATTERN_DASH_DOT")
    return NUMINTEGER(NSUnderlinePatternDashDot);
}
-(NSNumber*)ATTRIBUTE_UNDERLINE_PATTERN_DASH_DOT_DOT
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.ATTRIBUTE_UNDERLINE_PATTERN_DASH_DOT_DOT", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_UNDERLINE_PATTERN_DASH_DOT_DOT")
    return NUMINTEGER(NSUnderlinePatternDashDotDot);
}
-(NSNumber*)ATTRIBUTE_UNDERLINE_BY_WORD
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.ATTRIBUTE_UNDERLINE_BY_WORD", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_UNDERLINE_BY_WORD")
    return NUMINTEGER(NSUnderlineByWord);
}
-(NSNumber*)ATTRIBUTE_WRITING_DIRECTION_NATURAL
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.ATTRIBUTE_WRITING_DIRECTION_NATURAL", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_WRITING_DIRECTION_NATURAL")
    return NUMINTEGER(NSWritingDirectionNatural);
}
-(NSNumber*)ATTRIBUTE_WRITING_DIRECTION_LEFT_TO_RIGHT
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.ATTRIBUTE_WRITING_DIRECTION_LEFT_TO_RIGHT", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_WRITING_DIRECTION_LEFT_TO_RIGHT")
    return NUMINTEGER(NSWritingDirectionLeftToRight);
}
-(NSNumber*)ATTRIBUTE_WRITING_DIRECTION_RIGHT_TO_LEFT
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.ATTRIBUTE_WRITING_DIRECTION_RIGHT_TO_LEFT", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_WRITING_DIRECTION_RIGHT_TO_LEFT")
    return NUMINTEGER(NSWritingDirectionRightToLeft);
}
-(NSNumber*)ATTRIBUTE_WRITING_DIRECTION_EMBEDDING
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.ATTRIBUTE_WRITING_DIRECTION_EMBEDDING", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_WRITING_DIRECTION_EMBEDDING")
    return NUMINTEGER(NSTextWritingDirectionEmbedding);
}
-(NSNumber*)ATTRIBUTE_WRITING_DIRECTION_OVERRIDE
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.ATTRIBUTE_WRITING_DIRECTION_OVERRIDE", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_WRITING_DIRECTION_OVERRIDE")
    return NUMINTEGER(NSTextWritingDirectionOverride);
}
-(NSString *)ATTRIBUTE_LETTERPRESS_STYLE
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.ATTRIBUTE_LETTERPRESS_STYLE", @"3.6.0", @"6.0.0", @"UI.ATTRIBUTE_LETTERPRESS_STYLE")
    return NSTextEffectLetterpressStyle;
}
#endif

#ifdef USE_TI_UIIOSADVIEW
-(NSString*)AD_SIZE_PORTRAIT 
{
    return [TiUIiOSAdViewProxy portraitSize];
}

-(NSString*)AD_SIZE_LANDSCAPE 
{
    return [TiUIiOSAdViewProxy landscapeSize];
}

-(id)createAdView:(id)args
{
	return [[[TiUIiOSAdViewProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif

#ifdef USE_TI_UIIOS3DMATRIX
-(id)create3DMatrix:(id)args
{
	DEPRECATED_REPLACED_REMOVED(@"UI.iOS.create3DMatrix()", @"2.1.0", @"6.0.0", @"UI.create3DMatrix()");
    if (args==nil || [args count] == 0)
	{
		return [[[Ti3DMatrix alloc] init] autorelease];
	}
	ENSURE_SINGLE_ARG(args,NSDictionary);
	Ti3DMatrix *matrix = [[Ti3DMatrix alloc] initWithProperties:args];
	return [matrix autorelease];
}
#endif

#ifdef USE_TI_UIIOSCOVERFLOWVIEW
-(id)createCoverFlowView:(id)args
{
	return [[[TiUIiOSCoverFlowViewProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif

#ifdef USE_TI_UIIOSTOOLBAR
-(id)createToolbar:(id)args
{
	return [[[TiUIiOSToolbarProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif

#ifdef USE_TI_UIIOSATTRIBUTEDSTRING
-(id)createAttributedString:(id)args
{
	DEPRECATED_REPLACED_REMOVED(@"UI.iOS.createAttributedString()", @"3.6.0", @"6.0.0", @"UI.createAttributedString()");
    return [[[TiUIAttributedStringProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif

#ifdef USE_TI_UIIOSTABBEDBAR
-(id)createTabbedBar:(id)args
{
    return [[[TiUIiOSTabbedBarProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif

#if defined(USE_TI_UIIPADDOCUMENTVIEWER) || defined(USE_TI_UIIOSDOCUMENTVIEWER)
-(id)createDocumentViewer:(id)args
{
	return [[[TiUIiOSDocumentViewerProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif

#ifdef USE_TI_UIIOSNAVIGATIONWINDOW
-(id)createNavigationWindow:(id)args
{
    return [[[TiUIiOSNavWindowProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif

#ifdef USE_TI_UIIOSSPLITWINDOW
-(id)createSplitWindow:(id)args
{
    return [[[TiUIiOSSplitWindowProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif

#ifdef USE_TI_UIIOSTRANSITIONANIMATION
-(id)createTransitionAnimation:(id)args;
{
    return [[[TiUIiOSTransitionAnimationProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif

#ifdef USE_TI_UIIOSPREVIEWCONTEXT
-(id)createPreviewAction:(id)args
{
    return [[[TiUIiOSPreviewActionProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}

-(id)createPreviewActionGroup:(id)args
{
    return [[[TiUIiOSPreviewActionGroupProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}

-(id)createPreviewContext:(id)args
{
    return [[[TiUIiOSPreviewContextProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif

#ifdef USE_TI_UIIOSMENUPOPUP
-(id)createMenuPopup:(id)args
{
    return [[[TiUIiOSMenuPopupProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif

#ifdef USE_TI_UIIOSBLURVIEW
-(id)createBlurView:(id)args
{
    return [[[TiUIiOSBlurViewProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif

#ifdef USE_TI_UIIOSLIVEPHOTOVIEW
-(id)createLivePhotoView:(id)args
{
    return [[[TiUIiOSLivePhotoViewProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}

-(NSNumber*) LIVEPHOTO_PLAYBACK_STYLE_FULL
{
    if ([TiUtils isIOS9_1OrGreater]) {
        return NUMINTEGER(PHLivePhotoViewPlaybackStyleFull);
    }
    return nil;
}

-(NSNumber*) LIVEPHOTO_PLAYBACK_STYLE_HINT
{
    if ([TiUtils isIOS9_1OrGreater]) {
        return NUMINTEGER(PHLivePhotoViewPlaybackStyleHint);
    }
    
    return nil;
}
#endif

#ifdef USE_TI_UIIOSLIVEPHOTOBADGE
-(TiBlob*)createLivePhotoBadge:(id)value
{
    if ([TiUtils isIOS9_1OrGreater] == NO) {
        return nil;
    }
    
    ENSURE_ARG_COUNT(value, 1);
    ENSURE_ARRAY(value);
    id option = [value objectAtIndex:0];
    
    UIImage *badge = [PHLivePhotoView livePhotoBadgeImageWithOptions:[TiUtils intValue:option def:PHLivePhotoBadgeOptionsOverContent]];
    
    // Badges only work on devices.
    if (badge == nil) {
        return nil;
    }
    
    TiBlob *image = [[TiBlob alloc] _initWithPageContext:[self pageContext] andImage:badge];
    
    return image;
}
#endif

#ifdef USE_TI_UIIOSLIVEPHOTO_BADGE_OPTIONS_OVER_CONTENT
-(NSNumber*)LIVEPHOTO_BADGE_OPTIONS_OVER_CONTENT
{
    if ([TiUtils isIOS9_1OrGreater]) {
        return NUMINTEGER(PHLivePhotoBadgeOptionsOverContent);
    }
    return NUMINT(0);
}
#endif

#ifdef USE_TI_UIIOSLIVEPHOTO_BADGE_OPTIONS_LIVE_OFF
-(NSNumber*)LIVEPHOTO_BADGE_OPTIONS_LIVE_OFF
{
    if ([TiUtils isIOS9_1OrGreater]) {
        return NUMINTEGER(PHLivePhotoBadgeOptionsLiveOff);
    }
    return NUMINT(0);
}
#endif

#ifdef USE_TI_UIIOSANIMATOR
-(id)createAnimator:(id)args
{
    return [[[TiAnimatorProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#ifdef USE_TI_UIIOSSNAPBEHAVIOR
-(id)createSnapBehavior:(id)args
{
    return [[[TiSnapBehavior alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif
#ifdef USE_TI_UIIOSPUSHBEHAVIOR
-(id)createPushBehavior:(id)args
{
    return [[[TiPushBehavior alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
//TiPushBehavior Constants
MAKE_SYSTEM_PROP(PUSH_MODE_CONTINUOUS, 0);
MAKE_SYSTEM_PROP(PUSH_MODE_INSTANTANEOUS, 1);
#endif

#ifdef USE_TI_UIIOSGRAVITYBEHAVIOR
-(id)createGravityBehavior:(id)args
{
    return [[[TiGravityBehavior alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif

#ifdef USE_TI_UIIOSANCHORATTACHMENTBEHAVIOR
-(id)createAnchorAttachmentBehavior:(id)args
{
    return [[[TiAnchorAttachBehavior alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif

#ifdef USE_TI_UIIOSVIEWATTACHMENTBEHAVIOR
-(id)createViewAttachmentBehavior:(id)args
{
    return [[[TiViewAttachBehavior alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif

#ifdef USE_TI_UIIOSCOLLISIONBEHAVIOR
-(id)createCollisionBehavior:(id)args
{
    return [[[TiCollisionBehavior alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
//TiCollisionBehavior Constants
MAKE_SYSTEM_PROP(COLLISION_MODE_ITEM, 0);
MAKE_SYSTEM_PROP(COLLISION_MODE_BOUNDARY, 1);
MAKE_SYSTEM_PROP(COLLISION_MODE_ALL, 2);
#endif

#ifdef USE_TI_UIIOSDYNAMICITEMBEHAVIOR
-(id)createDynamicItemBehavior:(id)args
{
    return [[[TiDynamicItemBehavior alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}
#endif
#endif

MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ANIMATION_CURVE_EASE_IN_OUT, UIViewAnimationOptionCurveEaseInOut, @"UI.iOS.ANIMATION_CURVE_EASE_IN_OUT", @"2.1.0", @"6.0.0", @"UI.ANIMATION_CURVE_EASE_IN_OUT");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ANIMATION_CURVE_EASE_IN, UIViewAnimationOptionCurveEaseIn, @"UI.iOS.ANIMATION_CURVE_EASE_IN", @"2.1.0", @"6.0.0", @"UI.ANIMATION_CURVE_EASE_IN");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ANIMATION_CURVE_EASE_OUT,UIViewAnimationOptionCurveEaseOut,  @"UI.iOS.ANIMATION_CURVE_EASE_OUT", @"2.1.0", @"6.0.0", @"UI.ANIMATION_CURVE_EASE_OUT");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(ANIMATION_CURVE_LINEAR,UIViewAnimationOptionCurveLinear, @"UI.iOS.ANIMATION_CURVE_LINEAR", @"2.1.0", @"6.0.0", @"UI.ANIMATION_CURVE_LINEAR");

MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(AUTODETECT_NONE,UIDataDetectorTypeNone, @"UI.iOS.AUTODETECT_NONE", @"3.0.0", @"6.0.0", @"UI.AUTOLINK_NONE");
-(NSNumber*)AUTODETECT_ALL
{
    DEPRECATED_REPLACED_REMOVED(@"UI.iOS.AUTODETECT_ALL", @"3.0.0", @"6.0.0", @"UI.AUTOLINK_ALL")
    return NUMUINTEGER(UIDataDetectorTypeAll);
}
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(AUTODETECT_PHONE,UIDataDetectorTypePhoneNumber, @"UI.iOS.AUTODETECT_PHONE", @"3.0.0", @"6.0.0", @"UI.AUTOLINK_PHONE_NUMBERS");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(AUTODETECT_LINK,UIDataDetectorTypeLink, @"UI.iOS.AUTODETECT_LINK", @"3.0.0", @"6.0.0", @"UI.AUTOLINK_URLS");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(AUTODETECT_ADDRESS,UIDataDetectorTypeAddress, @"UI.iOS.AUTODETECT_ADDRESS", @"3.0.0", @"6.0.0", @"UI.AUTOLINK_MAP_ADDRESSES");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED_REMOVED(AUTODETECT_CALENDAR,UIDataDetectorTypeCalendarEvent, @"UI.iOS.AUTODETECT_CALENDAR", @"3.0.0", @"6.0.0", @"UI.AUTOLINK_CALENDAR");

MAKE_SYSTEM_PROP(BLEND_MODE_NORMAL,kCGBlendModeNormal);
MAKE_SYSTEM_PROP(BLEND_MODE_MULTIPLY,kCGBlendModeMultiply);
MAKE_SYSTEM_PROP(BLEND_MODE_SCREEN,kCGBlendModeScreen);
MAKE_SYSTEM_PROP(BLEND_MODE_OVERLAY,kCGBlendModeOverlay);
MAKE_SYSTEM_PROP(BLEND_MODE_DARKEN,kCGBlendModeDarken);
MAKE_SYSTEM_PROP(BLEND_MODE_LIGHTEN,kCGBlendModeLighten);
MAKE_SYSTEM_PROP(BLEND_MODE_COLOR_DODGE,kCGBlendModeColorDodge);
MAKE_SYSTEM_PROP(BLEND_MODE_COLOR_BURN,kCGBlendModeColorBurn);
MAKE_SYSTEM_PROP(BLEND_MODE_SOFT_LIGHT,kCGBlendModeSoftLight);
MAKE_SYSTEM_PROP(BLEND_MODE_HARD_LIGHT,kCGBlendModeHardLight);
MAKE_SYSTEM_PROP(BLEND_MODE_DIFFERENCE,kCGBlendModeDifference);
MAKE_SYSTEM_PROP(BLEND_MODE_EXCLUSION,kCGBlendModeExclusion);
MAKE_SYSTEM_PROP(BLEND_MODE_HUE,kCGBlendModeHue);
MAKE_SYSTEM_PROP(BLEND_MODE_SATURATION,kCGBlendModeSaturation);
MAKE_SYSTEM_PROP(BLEND_MODE_COLOR,kCGBlendModeColor);
MAKE_SYSTEM_PROP(BLEND_MODE_LUMINOSITY,kCGBlendModeLuminosity);
MAKE_SYSTEM_PROP(BLEND_MODE_CLEAR,kCGBlendModeClear);
MAKE_SYSTEM_PROP(BLEND_MODE_COPY,kCGBlendModeCopy);
MAKE_SYSTEM_PROP(BLEND_MODE_SOURCE_IN,kCGBlendModeSourceIn);
MAKE_SYSTEM_PROP(BLEND_MODE_SOURCE_OUT,kCGBlendModeSourceOut);
MAKE_SYSTEM_PROP(BLEND_MODE_SOURCE_ATOP,kCGBlendModeSourceAtop);
MAKE_SYSTEM_PROP(BLEND_MODE_DESTINATION_OVER,kCGBlendModeDestinationOver);
MAKE_SYSTEM_PROP(BLEND_MODE_DESTINATION_IN,kCGBlendModeDestinationIn);
MAKE_SYSTEM_PROP(BLEND_MODE_DESTINATION_OUT,kCGBlendModeDestinationOut);
MAKE_SYSTEM_PROP(BLEND_MODE_DESTINATION_ATOP,kCGBlendModeDestinationAtop);
MAKE_SYSTEM_PROP(BLEND_MODE_XOR,kCGBlendModeXOR);
MAKE_SYSTEM_PROP(BLEND_MODE_PLUS_DARKER,kCGBlendModePlusDarker);
MAKE_SYSTEM_PROP(BLEND_MODE_PLUS_LIGHTER,kCGBlendModePlusLighter);

MAKE_SYSTEM_STR(COLOR_GROUP_TABLEVIEW_BACKGROUND, IOS_COLOR_GROUP_TABLEVIEW_BACKGROUND);
MAKE_SYSTEM_STR(TABLEVIEW_INDEX_SEARCH, UITableViewIndexSearch);

-(NSString*)COLOR_SCROLLVIEW_BACKGROUND
{
    DEPRECATED_REMOVED(@"UI.iOS.COLOR_SCROLLVIEW_BACKGROUND",@"3.4.2",@"3.6.0")
    return IOS_COLOR_SCROLLVIEW_TEXTURED_BACKGROUND;
}
-(NSString*)COLOR_VIEW_FLIPSIDE_BACKGROUND
{
    DEPRECATED_REMOVED(@"UI.iOS.COLOR_VIEW_FLIPSIDE_BACKGROUND",@"3.4.2",@"3.6.0")
    return IOS_COLOR_VIEW_FLIPSIDE_BACKGROUND;
}
-(NSString*)COLOR_UNDER_PAGE_BACKGROUND
{
    DEPRECATED_REMOVED(@"UI.iOS.COLOR_UNDER_PAGE_BACKGROUND",@"3.4.2",@"3.6.0")
    return IOS_COLOR_UNDER_PAGE_BACKGROUND;
}

MAKE_SYSTEM_PROP(WEBVIEW_NAVIGATIONTYPE_LINK_CLICKED,UIWebViewNavigationTypeLinkClicked);
MAKE_SYSTEM_PROP(WEBVIEW_NAVIGATIONTYPE_FORM_SUBMITTED,UIWebViewNavigationTypeFormSubmitted);
MAKE_SYSTEM_PROP(WEBVIEW_NAVIGATIONTYPE_BACK_FORWARD,UIWebViewNavigationTypeBackForward);
MAKE_SYSTEM_PROP(WEBVIEW_NAVIGATIONTYPE_RELOAD,UIWebViewNavigationTypeReload);
MAKE_SYSTEM_PROP(WEBVIEW_NAVIGATIONTYPE_FORM_RESUBMITTED,UIWebViewNavigationTypeFormResubmitted);
MAKE_SYSTEM_PROP(WEBVIEW_NAVIGATIONTYPE_OTHER,UIWebViewNavigationTypeOther);

#ifdef USE_TI_UIIOSAPPLICATIONSHORTCUTS
-(id)createApplicationShortcuts:(id)args
{
    return [[[TiUIiOSApplicationShortcutsProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}

MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_COMPOSE,UIApplicationShortcutIconTypeCompose);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_PLAY,UIApplicationShortcutIconTypePlay);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_PAUSE,UIApplicationShortcutIconTypePause);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_ADD,UIApplicationShortcutIconTypeAdd);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_LOCATION,UIApplicationShortcutIconTypeLocation);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_SEARCH,UIApplicationShortcutIconTypeSearch);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_SHARE,UIApplicationShortcutIconTypeShare);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_PROHIBIT,UIApplicationShortcutIconTypeProhibit);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_CONTACT,UIApplicationShortcutIconTypeContact);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_HOME,UIApplicationShortcutIconTypeHome);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_MARK_LOCATION,UIApplicationShortcutIconTypeMarkLocation);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_FAVORITE,UIApplicationShortcutIconTypeFavorite);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_LOVE,UIApplicationShortcutIconTypeLove);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_CLOUD,UIApplicationShortcutIconTypeCloud);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_INVITATION,UIApplicationShortcutIconTypeInvitation);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_CONFIRMATION,UIApplicationShortcutIconTypeConfirmation);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_MAIL,UIApplicationShortcutIconTypeMail);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_MESSAGE,UIApplicationShortcutIconTypeMessage);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_DATE,UIApplicationShortcutIconTypeDate);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_TIME,UIApplicationShortcutIconTypeTime);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_CAPTURE_PHOTO,UIApplicationShortcutIconTypeCapturePhoto);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_CAPTURE_VIDEO,UIApplicationShortcutIconTypeCaptureVideo);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_TASK,UIApplicationShortcutIconTypeTask);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_TASK_COMPLETED,UIApplicationShortcutIconTypeTaskCompleted);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_ALARM,UIApplicationShortcutIconTypeAlarm);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_BOOKMARK,UIApplicationShortcutIconTypeBookmark);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_SHUFFLE,UIApplicationShortcutIconTypeShuffle);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_AUDIO,UIApplicationShortcutIconTypeAudio);
MAKE_SYSTEM_PROP(SHORTCUT_ICON_TYPE_UPDATE,UIApplicationShortcutIconTypeUpdate);
#endif

//Modal Transition and Presentatiom
MAKE_SYSTEM_PROP(MODAL_TRANSITION_STYLE_COVER_VERTICAL,UIModalTransitionStyleCoverVertical);
MAKE_SYSTEM_PROP(MODAL_TRANSITION_STYLE_FLIP_HORIZONTAL,UIModalTransitionStyleFlipHorizontal);
MAKE_SYSTEM_PROP(MODAL_TRANSITION_STYLE_CROSS_DISSOLVE,UIModalTransitionStyleCrossDissolve);

MAKE_SYSTEM_PROP(MODAL_PRESENTATION_FULLSCREEN,UIModalPresentationFullScreen);
MAKE_SYSTEM_PROP(MODAL_TRANSITION_STYLE_PARTIAL_CURL,UIModalTransitionStylePartialCurl);
MAKE_SYSTEM_PROP(MODAL_PRESENTATION_PAGESHEET,UIModalPresentationPageSheet);
MAKE_SYSTEM_PROP(MODAL_PRESENTATION_FORMSHEET,UIModalPresentationFormSheet);
MAKE_SYSTEM_PROP(MODAL_PRESENTATION_CURRENT_CONTEXT,UIModalPresentationCurrentContext);
@end
#endif

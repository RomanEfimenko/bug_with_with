#import <GameKit/GameKit.h>
#import <StoreKit/StoreKit.h>

@interface gm_ios:NSObject{}

-(double)		rate_us;
-(void)			audio_set_playback_category;
-(NSString*)	decode_base64:(char*) input;
-(NSString*)	bundle_id;

@end

#import "gm_ios.h"

@implementation gm_ios
	
	-(double) rate_us {
		if([SKStoreReviewController respondsToSelector:@selector(requestReview)]) {
			[SKStoreReviewController requestReview];
			return 1.0;
		}
		return 0.0;
	}

	-(void) audio_set_playback_category {
		NSError *error;
		[[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&error];
	}

	-(NSString*) decode_base64:(char*) input {
		NSString *s_input  = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
		NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:s_input options:0];
		NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
		return decodedString; 
	}

	-(NSString*) bundle_id {
		NSString *bi = [[NSBundle mainBundle] bundleIdentifier];
		return bi;
	}

@end
//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Eldon Chan on 6/10/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (strong, nonatomic, readwrite) NSString *sentence;

@end

@implementation FISSentence

-(void)assembleSentence{
    
    self.sentence = [self.words componentsJoinedByString:@" "];
    self.sentence = [self.sentence stringByAppendingString:self.punctuation];
    
}

-(BOOL)validWord:(NSString *)word{
    
    if (([word length] == 0) || [word isEqualToString:@""] || [word isEqualToString:@" "] ){
        
        return NO;
    }
    
    else {
        
        return YES;
    }
}

-(BOOL)validPuncuation:(NSString *)punctuation{
    
    NSString *goodPunc = @".?!,;:—";
    NSCharacterSet *goodPunctuation = [NSCharacterSet characterSetWithCharactersInString:goodPunc];
    NSRange puncRange = [punctuation rangeOfCharacterFromSet:goodPunctuation];
    
    if (([punctuation length] == 0) || [punctuation isEqualToString:@""]||[punctuation isEqualToString:@" "] || puncRange.location == NSNotFound){
        
        return NO;
    }
    
    else {
        
        self.punctuation = punctuation;
        
        return YES;
        
    }
}

-(BOOL)validIndex:(NSUInteger)index{
    
    if ([self.words count] <= index){
        return NO;
    }
    
    else {
        return YES;
    }
}

-(void)addWord:(NSString *)word{
    
    if ([self validWord:word]){
        [self.words addObject: word];
    }
    [self assembleSentence];
}

-(void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation{
    
    
    if (!([words count] == 0) && [self validPuncuation:punctuation]){
        
        for (NSString *word in words){
            
            if ([self validWord:word]){
                [self.words addObject: word];
            }
            
        }
    }
    
    [self assembleSentence];
}

-(void)removeWordAtIndex:(NSUInteger)index{
    
    
    if ([self validIndex:index]){
        
         [self.words removeObjectAtIndex:index];
    }
    
    [self assembleSentence];
    
}

-(void)insertWord:(NSString *)word atIndex:(NSUInteger)index{
    

    if ([self validWord:word] && [self validIndex:index]){

        [self.words insertObject:word atIndex:index];
    }
    
    [self assembleSentence];


    
}

-(void)replacePunctuationWithPunctuation:(NSString *)punctuation{
    
    if ([self validPuncuation:punctuation]){
        
        [self.sentence stringByReplacingOccurrencesOfString:self.punctuation withString:punctuation];
    }

    [self assembleSentence];
    
}

-(void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word{
    
    if ([self validWord:word] && [self validIndex:index]){
        
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    
    [self assembleSentence];
}


@end

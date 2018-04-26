//
//  DrawHuman.m
//  QuartHuman
//
//  Created by George on 2018/3/5.
//  Copyright © 2018年 George. All rights reserved.
//

#import "DrawHuman.h"
#define JKRadius 70
#define JKTopY 100
#define JKColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@implementation DrawHuman


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //1.获取图形的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //2.图形绘制
    drawBody(context, rect);
    drawBody1(context, rect);
    drawMouse(context, rect);
    drawLEyes(context, rect);
    drawREyes(context, rect);
    drawFoot(context, rect);
    drawFoot1(context, rect);
    drawHand(context, rect);
    drawHand1(context, rect);
    drawHair(context, rect);
    
    
}

//身体绘制
void drawBody(CGContextRef context,CGRect rect){
    //上半圆
    CGFloat topX = rect.size.width *0.5;
    CGFloat topY = JKTopY;
    CGFloat topRadius = JKRadius;
    CGContextAddArc(context, topX, topY, topRadius, 0, M_PI, 1);
    
    //线条的向下延伸
    CGFloat middleX = topX - topRadius;
    CGFloat middleH = JKTopY;
    CGFloat middleY = topY + middleH;
    CGContextAddLineToPoint(context, middleX, middleY);
    
    CGFloat middleX1 = topX + topRadius;
    CGContextAddLineToPoint(context, middleX1, middleY);
    
    //下半圆
    /*CGFloat bottomX = topX;
    CGFloat bottomY = middleY;
    CGFloat bottomRadius = topRadius;
    CGContextAddArc(context, bottomX, bottomY, bottomRadius, M_PI, 0, 1);*/
    
    //合并路径
    CGContextClosePath(context);
    
    //设置颜色
    [JKColor(252, 218, 0) set];
    
    CGContextFillPath(context);
}

void drawBody1(CGContextRef context,CGRect rect){
    //控制点
    CGFloat controlX = rect.size.width *0.5;
    CGFloat controlY = rect.size.height *0.33;
    
    //设置当前点
    CGFloat marginX = JKRadius;
    CGFloat marginY = JKTopY * 2;
    CGFloat currentX = controlX - marginX;
    CGFloat currentY = marginY;
    CGContextMoveToPoint(context, currentX, currentY);
    CGContextSetLineWidth(context, 5);
    
    //设置结束点
    CGFloat endX = controlX + marginX;
    CGFloat endY = currentY;
    
    //绘制贝塞尔曲线
    CGContextAddQuadCurveToPoint(context, controlX, controlY, endX, endY);
    
    //颜色
    [JKColor(0, 74, 128) set];
    
    CGContextFillPath(context);
    
    
}

//嘴巴绘制
void drawMouse(CGContextRef context,CGRect rect){
    //1.设置一个控制点
    CGFloat controlX = rect.size.width *0.5;
    CGFloat controlY = rect.size.height *0.22;
    
    //设置当前点
    CGFloat marginX = 20;
    CGFloat marginY = 10;
    CGFloat currentX = controlX - marginX;
    CGFloat currentY = controlY - marginY;
    CGContextMoveToPoint(context, currentX, currentY);
    CGContextSetLineWidth(context, 5);
    
    //设置结束点
    CGFloat endX = controlX + marginX;
    CGFloat endY = currentY;
    
    //绘制贝塞尔曲线
    CGContextAddQuadCurveToPoint(context, controlX, controlY, endX, endY);
    
    //颜色
    [[UIColor blackColor] set];
    
    CGContextStrokePath(context);
}
//左眼睛绘制
void drawLEyes(CGContextRef context,CGRect rect){
    //黑色绑带
    CGFloat startX = rect.size.width *0.5 - JKRadius;
    CGFloat startY = JKTopY;
    CGContextMoveToPoint(context, startX, startY);
    
    CGFloat endX = startX + 2 * JKRadius;
    CGFloat endY = startY;
    CGContextAddLineToPoint(context, endX, endY);
    CGContextSetLineWidth(context, 15);
    
    [[UIColor blackColor] set];
    CGContextStrokePath(context);
    
    //黑色镜框
    [JKColor(61, 62, 66) set];
    CGFloat kuangRadius = JKRadius *0.4;
    CGFloat kuangY = startY;
    CGFloat kuangX = rect.size.width *0.5 - kuangRadius;
    CGContextAddArc(context, kuangX, kuangY, kuangRadius, 0, M_PI*2, 0);
    CGContextFillPath(context);
    
    //白色区域
    [[UIColor whiteColor] set];
    CGFloat whiteRadius = kuangRadius *0.7;
    CGFloat whiteX = kuangX;
    CGFloat whiteY = kuangY;
    CGContextAddArc(context, whiteX, whiteY, whiteRadius, 0, M_PI*2, 0);
    CGContextFillPath(context);
    
    //眼睛
    [[UIColor blackColor] set];
    CGFloat blackRadius = whiteRadius *0.5;
    CGFloat blackX = whiteX;
    CGFloat blackY = whiteY;
    CGContextAddArc(context, blackX, blackY, blackRadius, 0, M_PI*2, 0);
    CGContextFillPath(context);
}

//右眼睛绘制
void drawREyes(CGContextRef context,CGRect rect){
    //黑色绑带
    CGFloat startX = rect.size.width *0.5 - JKRadius;
    CGFloat startY = JKTopY;
    CGContextMoveToPoint(context, startX, startY);
    
    CGFloat endX = startX + 2 * JKRadius;
    CGFloat endY = startY;
    CGContextAddLineToPoint(context, endX, endY);
    CGContextSetLineWidth(context, 15);
    
    [[UIColor blackColor] set];
    
    //黑色镜框
    [JKColor(61, 62, 66) set];
    CGFloat kuangRadius = JKRadius *0.4;
    CGFloat kuangY = startY;
    CGFloat kuangX = rect.size.width *0.5 + kuangRadius;
    CGContextAddArc(context, kuangX, kuangY, kuangRadius, 0, M_PI*2, 0);
    CGContextFillPath(context);
    
    //白色区域
    [[UIColor whiteColor] set];
    CGFloat whiteRadius = kuangRadius *0.7;
    CGFloat whiteX = kuangX;
    CGFloat whiteY = kuangY;
    CGContextAddArc(context, whiteX, whiteY, whiteRadius, 0, M_PI*2, 0);
    CGContextFillPath(context);
    
    //眼睛
    [[UIColor blackColor] set];
    CGFloat blackRadius = whiteRadius *0.5;
    CGFloat blackX = whiteX;
    CGFloat blackY = whiteY;
    CGContextAddArc(context, blackX, blackY, blackRadius, 0, M_PI*2, 0);
    CGContextFillPath(context);
}

//腿
void drawFoot(CGContextRef context,CGRect rect){
    CGFloat startX1 = rect.size.width *0.5 - 25;
    CGFloat startY1 = JKTopY * 2;
    
    
    CGContextMoveToPoint(context, startX1, startY1);
    
    CGFloat endX1 = startX1;
    CGFloat endY1 = startY1 + 50;

    CGContextAddLineToPoint(context, endX1, endY1);
    
    CGFloat startX2 = rect.size.width *0.5 + 25;
    CGFloat startY2 = JKTopY * 2;
    
    
    CGContextMoveToPoint(context, startX2, startY2);
    
    CGFloat endX2 = startX2;
    CGFloat endY2 = startY2 + 50;
    
    CGContextAddLineToPoint(context, endX2, endY2);
    
    [JKColor(0, 74, 128) set];
    CGContextStrokePath(context);
}

void drawFoot1(CGContextRef context,CGRect rect){
    //脚
    CGFloat x1 = rect.size.width *0.5 - 25;
    CGFloat y1 = JKTopY * 2 + 60;
    CGFloat Radius = 15;
    CGContextAddArc(context, x1, y1, Radius, 0, M_PI*2, 0);
    
    CGFloat x2 = rect.size.width *0.5 + 25;
    CGFloat y2 = JKTopY * 2 + 60;
    CGContextAddArc(context, x2, y2, Radius, 0, M_PI*2, 0);
    
    //设置颜色
    [[UIColor blackColor] set];
    CGContextFillPath(context);
}

//手臂
void drawHand(CGContextRef context,CGRect rect){
    //控制点
    CGFloat controlX = rect.size.width *0.5 - JKRadius - 3;
    CGFloat controlY = JKTopY * 1.8;
    
    //设置当前点
    CGFloat currentX = rect.size.width *0.5 - JKRadius + 3;
    CGFloat currentY =JKTopY * 1.7;
    CGContextMoveToPoint(context, currentX, currentY);
    
    CGContextSetLineWidth(context, 10);
    
    //设置结束点
    CGFloat endX = rect.size.width *0.5 - JKRadius - 10;
    CGFloat endY = JKTopY * 2.1;
    
    //绘制贝塞尔曲线
    CGContextAddQuadCurveToPoint(context, controlX, controlY, endX, endY);

    CGFloat controlX1 = rect.size.width *0.5 + JKRadius + 3;
    CGFloat controlY1 = JKTopY * 1.8;
    
    CGFloat currentX1 = rect.size.width *0.5 + JKRadius - 3;
    CGFloat currentY1 =JKTopY * 1.7;
    CGContextMoveToPoint(context, currentX1, currentY1);
    CGContextSetLineWidth(context, 10);
    
    CGFloat endX1 = rect.size.width *0.5 + JKRadius + 10;
    CGFloat endY1 = JKTopY * 2.1;
    
    CGContextAddQuadCurveToPoint(context, controlX1, controlY1, endX1, endY1);
    
    //颜色
    [JKColor(252, 218, 0) set];
    
    CGContextStrokePath(context);
}
//手掌
void drawHand1(CGContextRef context,CGRect rect){
    CGFloat X = rect.size.width *0.5 - JKRadius - 10;
    CGFloat Y = JKTopY * 2.1;
    CGFloat Radius = 8;
    CGContextAddArc(context, X, Y, Radius, 0, M_PI*2, 0);
    
    CGFloat x2 = rect.size.width *0.5 + JKRadius + 10;
    CGFloat y2 = JKTopY * 2.1;
    CGContextAddArc(context, x2, y2, Radius, 0, M_PI*2, 0);
    
    //设置颜色
    [[UIColor blackColor] set];
    CGContextFillPath(context);
}
void drawHair(CGContextRef context,CGRect rect){
    
    CGFloat controlX = rect.size.width *0.5 - 5;
    CGFloat controlY = JKTopY * 0.2;
    
    CGFloat startX = rect.size.width *0.5 - 5;
    CGFloat startY = JKTopY * 0.3;
    
    
    CGContextMoveToPoint(context, startX, startY);
    
    CGFloat endX = startX - 50;
    CGFloat endY = startY + 5;
    
    CGContextAddQuadCurveToPoint(context, controlX, controlY, endX, endY);
    
    CGFloat controlX1 = rect.size.width *0.5 + 5;
    CGFloat controlY1 = JKTopY * 0.2;
    
    CGFloat startX1 = rect.size.width *0.5 + 5;
    CGFloat startY1 = JKTopY * 0.3;
    
    
    CGContextMoveToPoint(context, startX1, startY1);
    
    CGFloat endX1 = startX1 + 50;
    CGFloat endY1 = startY1 + 5;
    
    CGContextAddQuadCurveToPoint(context, controlX1, controlY1, endX1, endY1);
    
    CGContextSetLineWidth(context, 3);
    
    [[UIColor blackColor] set];
    CGContextStrokePath(context);
}
@end

//
//  Conversion.h
//  ConvCooking
//
//  Created by  on 13-4-3.
//  Copyright (c) 2013年 ChenShun. All rights reserved.
//

#ifndef ConvCooking_Conversion_h
#define ConvCooking_Conversion_h

// U.S. volume unit
enum LiquidMeasure 
{
    teaspoon = 0,       //茶匙
    tablespoon = 1,     //汤匙
    fluidounce = 2,    // 液盎司
    gill = 3,           //及耳
    cup = 4,            //杯
    pint = 5,           //品脱
    quart = 6,          //夸脱
    gallon = 7,         //加仑
    ml,
    l,
};

// U.S. Liquid Measurements
float volume[8][10] = {
    {1, 1/3, 1/6, 1/24, 1/48, 1/96, 1/192, 1/768, 5, 5/1000},           //teaspoon
    {3, 1,   1/2, 1/8,  1/16, 1/32, 1/64, 1/256, 15, 15/1000},          //tablespoon
    {6, 2,   1,   1/4,  1/8,  1/16, 1/32, 1/128, 29.573, 29.573/1000},  //fluidounce
    {24, 8,  4,   1,    1/2,  1/4,  1/8,  1/32, 118.29,  0.12 },        //gill
    {48, 16, 8,   2,    1,    1/2,  1/4, 1/16, 236.59, 0.236},          //cup
    {96, 32, 16,  4,    2,    1,    1/2, 1/8, 473.18, 0.473},           //pint
    {192, 64, 32, 8,    4,    2,    1,   1/4, 946.36, 0.94635},         //quart
    {768, 256, 128, 32, 16,   8,    4,   1,   3776,   3.776},           //gallon
}; 

/*
 http://gwydir.demon.co.uk/jo/units/foreign.htm#usa
 http://www.kingarthurflour.com/recipe/master-weight-chart.html
 http://www.thebakingpan.com/baking-basics/measurements-conversions.html
 https://www.aibonline.org//resources/Conversion_Chart_Volume_Weight.pdf
 http://www.buzzle.com/articles/liquid-measurement-and-equivalents.html
 
 -- 0.5 ml = 1/8 teaspoon
 -- 1 ml = 1/4 teaspoon 
 -- 2 ml = 1/2 teaspoon 
 -- 5 ml = 1 teaspoon 
 -- 15 ml = 1 tablespoon 
 -- 25 ml = 2 tablespoons
 -- 50 ml = 2 fluid ounces = 1/4 cup
 -- 75 ml = 3 fluid ounces = 1/3 cup
 -- 125 ml = 4 fluid ounces = 1/2 cup
 -- 150 ml = 5 fluid ounces = 2/3 cup
 -- 175 ml = 6 fluid ounces = 3/4 cup
 -- 250 ml = 8 fluid ounces = 1 cup
 -- 500 ml = 1 pint = 2 cups
 -- 1 liter = 1 quart = 2 pints = 4 cups
 
 
 metric	imperial	 	 	 	metric	imperial	 
 3.79 L	128 fl oz	1 gallon	 (4 quarts)	225 ml	8 fl oz	1 cup
 0.95 L	32 fl oz	1 quart	 (2 pints)	 *16 ml	½ fl oz	1 tablespoon
 450 ml	16 fl oz	1 pint	 (2 cups)	5 ml	 	1 teaspoon

 
 */

/*
Imperial Liquid Measurements

Imperial teaspoon	Imperial tablespoon	Imperial fluid ounce	Imperial gill	Imperial cup	Imperial pint	Imperial quart	Imperial gallon
1 imperial teaspoon =	1	1/3	1/6	1/30	1/60	1/120	1/240	1/960
1 imperial tablespoon =	3	1	1/2	1/10	1/20	1/40	1/80	1/320
1 imperial fluid ounce =	6	2	1	1/5	1/10	1/20	1/40	1/160
1 imperial gill =	30	10	5	1	1/2	1/4	1/8	1/32
1 imperial cup =	60	20	10	2	1	1/2	1/4	1/16
1 imperial pint =	120	40	20	4	2	1	1/2	1/8
1 imperial quart =	240	80	40	8	4	2	1	1/4
1 imperial gallon =	960	320	160	32	16	8	4	1
*/
#endif

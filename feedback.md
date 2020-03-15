## Jan 20
`ProblemTwo.m` and `ProblemTwoA.m` both look good. I like the amount of comments, and it's producing correct results (for the most part) - there is something very wrong on line 13 of `ProblemTwoA.m` that will mess up the calculation, do you see it? I also would like some comments in `ProblemTwo.m` addressing the questions in that assignment.

## Jan 26
Problem 3 checks out except that very last part with the summation of the series. You made one small, but crucial error - look at where to start the summation. After look at Problem 2, I think you're basically there. For your own education, I would make sure that you can easily write a statement that would take the difference between the altitude of the sidereal and solar day.

## Feb 2
It looks like you fixed up Problem 3 just fine. I love the number of comments that you are putting in your code in Problem 4/4a/4b. Doing this will reinforce the syntax in your head. All of the programs are working and producing the correct results except 1 minor problem on 4a line 29 - take another look at the line and ask yourself what is it that you're actually taking the average of

## Feb 9
You're getting an error on that scatterplot I see. Have you taken a look at the numbers in `t`? I thing if you go to the first row of `t` you'll see the problem. Problem2b looks good, but has one mistake. It's such a small thing, but small things mean everything in programming.

## Feb 17
Looks like you found the small mistake in 2b, I'm happy with that now. Your `climate.m` program is working and producing some nice graphs. The only criticism that I have is that there is a lot of hard coding going on in your program. What I mean is that your program relies on the fact that you have exactly 168 rows of data, you may want to try to generalize this a bit more so that if I were to update the file up to 2020 data, your program would incorporate the new data.

## Feb 24
Problem 6 looks good. And you have a solid start on projectile.m, but there are still major issues to be figured out. Right now your program works for h=0, but not otherwise. You also are calculating the height of the projectile and not the range. As far as animation - what have you tried? Can you catch me tomorrow?

## Mar 9
Checked around, I don't see much change from the last time I looked.
## Mar 15
I think your motion.py package looks good and is basically there. Some corrections are needed though:
1) when importing a package of functions, the `.py` is always implied, so your first statement in `motiontest.ipynb` should be `import motion as motion` or more concise later, `import motion as m`, then you can call your functions `m.projectile(45,60,10,9.8)`, you need the arguments because you have no defaults set (yet I hope). 
2) the angles on line 23, 24 of motion.py should be `ang` since that's the variable that stores the input OR as it seems you want to do is convert on line 21, but you need to store the output from convertangle into n2 - the `convertangle` is a separate function and teh `projectile` function cannot "see" n2 (technically, n2 is not in the scope of projectile).

I hope that's useful

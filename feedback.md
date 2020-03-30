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

## Mar 24
Looking again at your motion.py - you seem to be having trouble setting default values for the arguments - in python it's actually much easier than in MATLAB - you set them in your function definition - `projectile(v=45,ang=60,h=0,g=9.81)` Python will take these values unless you execute the command giving values.
You asked about this in an email the other day - there is something up with your delta function on line 40 - the problem is that you are passing an array to a function that is assigning a value d based on 1 value - delta is determining the the coefficient of one of the terms in the SEM formula - this term could be different for every element in `an` for instance - delta isn't designed to look at each individual element in the array - it's only written to handle 1 value at a time. My suggestion would be to fold `delta` into the `semiemp` function. It seems like a lot of overhead to pass these arguments among several functions when they naturally go together.

## Mar 26 - things I need help with
- In Project 1, I put my delta if statements inside semiemp, but I still can't figure out how to calculate the delta term of the arrays when I have 0 inputs.
- For Problem 5 (projectile.m), I am still having trouble getting the line to animate. I also got a 5/10 in the gradebook for this so I'm not sure if that's because my line won't animate or if there are other issues.
- I fixed the default value problem in Problem 6a (motion.py) and it seems to be working fine now.
- I know I am not caught up with Problems 7 and 7a; I'll continue to work on those now that I've got the bulk of Project 1 out of the way.

## Mar 28 - a note on the final paper
I just wanted to let you know why our first draft is kind of empty - I reached out to Danny and Aly to let them know we need to start the first draft, but unfortunately I've been the only one to work on it so far. I did as much as I could before the 5pm today, but as you can probably understand I didn't want to do the whole thing myself since the project should be split up between the 3 of us.
Also, in the final project summary, in one section it says we need 5 sources but in another it says we need 7 - which is correct?

## Mar 30
Oh, geez!! Go with the lower reference number.
Please see the announcement I put out today about all those due dates - and yes, each member of the group should be contributing to any product that I look at, so please let me know if you need some kind of online facilitation among your group members. 
Problem 6a is looking better, but as with the MATLAB version, you are calculating negative time values somehow, and so you get the wrong values for the time and range, and height - also can you display some more values in the .ipynb file?
For those that you need help on:
1) Problem 5's problems arise from having the wrong expressions for the time in the program, you aren't getting the correct answers, so look at the way you calculate time in line 45. The animated line isn't strictly necessary, I would like people to get a working example however. I would look for an example in the doc - the code usually involves a for loop.
2) for the delta term in the case of no inputs, you have to calculate the mass for all the elements. Using the function you have (heck, using the function that I wrote), it's not easy to calculate this mass using an array in - array out thinking, this is a good time to use a for loop around the call to the massformula.


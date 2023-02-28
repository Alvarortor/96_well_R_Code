# practice using ANOVA

c1 = c(0.425932633,0.301340094,0.336110105,0.292647591,0.41724013,0.15936255,0.283955089,0.165157552
)
c2 = c(0.359290112,0.620065194,0.785222745,0.443317639,0.257877581,0.883737776,0.304237595,0.301340094
)
c3 = c(0.301340094,0.19123506,0.234697573,0.231800072,0.379572619,0.081130025,0.055052517,0.124592539
)
c4= c(0.391162622,0.272365085,0.260775081,0.136182543,0.156465049,0.081130025,0.107207534,0.240492575
)
# can I just copy and repeat it for the 12 times i need?
#Should be as a csv then, try that for anova b/c it works on other one

y = c(c1, c2, c3,c4)
n = rep(7,4) # is number repeated 3 times
n

group = rep(1:4, n) # repeat number 7 times though 3
group

tmp = tapply( y, group, stem)
stem(y)

data = data.frame(y = y, group = factor(group))
fit = lm(y ~ group, data)
anova (fit)

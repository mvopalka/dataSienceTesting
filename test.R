# Title     : TODO
# Objective : TODO
# Created by: STOAL
# Created on: 7/24/2020

x <- 1:6
y <- x^2
z <- x * 7.000 -9.333

print(x)
print(y)
print(z)


plot(x,y)
lines(x,z)

model <- lm(y ~ x)
print(model)

summary(model)

par(mfrow = c(2, 2))
plot(model)

# install.packages("caTools")  # install external package
library(caTools)             # external package providing write.gif function
jet.colors <- colorRampPalette(c("red", "blue", "#007FFF", "cyan", "#7FFF7F",
                                 "yellow", "#FF7F00", "red", "#7F0000"))
dx <- 1500                    # define width
dy <- 1400                    # define height
C  <- complex(real = rep(seq(-2.2, 1.0, length.out = dx), each = dy),
              imag = rep(seq(-1.2, 1.2, length.out = dy), dx))
C <- matrix(C, dy, dx)       # reshape as square matrix of complex numbers
Z <- 0                       # initialize Z to zero
X <- array(0, c(dy, dx, 20)) # initialize output 3D array
for (k in 1:20) {            # loop with 20 iterations
  Z <- Z^2 + C               # the central difference equation
  X[, , k] <- exp(-abs(Z))   # capture results
}
write.gif(X, "output/Mandelbrot.gif", col = jet.colors, delay = 100)
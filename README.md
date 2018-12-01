# Textons-for-texture-synthesis

Texture synthesis is the operation that, from an example of a texture image, consists of synthesizing images that provide the same visual sensation, without being mere copies of the initial image. As we will see in detail in progress, a very simple approach to the problem is to generate Gaussian fields whose statistics are identical to the example, as presented in [1]. A simple way to synthesize such fields is to convolute the sample image with white Gaussian noise.

In [2], it has been proposed to replace the example image with a small thumbnail (a texton), which is particularly important for storage purposes. In [3], an altenrative choice is proposed for the texton, which makes it possible to replace the Gaussian white noise by a simple Poisson process, which makes it possible to accelerate the synthesis.

### The purpose of the project will be
 - To understand the papers below
 - To implement the proposal of [2]
 - Compare the three approaches [1], [2], [3], using a code provided for [3]
 
 ## Articles : 
 
 [1]  Galerne, B., Gousseau, Y., & Morel, J. M. (2011). Random phase textures: Theory and synthesis. IEEE Transactions on image processing, 20(1), 257-267 
[2]  Desolneux, A., Moisan, L., & Ronsin, S. (2012, March). A compact representation of random phase and Gaussian textures. In 2012 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP) (pp. 1381-1384). IEEE. 
[3]  Galerne, B., Leclaire, A. Gaussian inpainting, SIAM Imaging Sciences, 2017.

# image-processing-Matlab-Application
Operations on Images
This is an Image processing based project developed using Matlab.
It has an UI which looks like this:

<img width="1278" alt="screen_shot" src="https://user-images.githubusercontent.com/22193264/37880871-1d58b030-305d-11e8-9ab4-b080c87d4ca0.png">

This program performs following Operators on the images entered by the user using "Load Image" pushbutton.

- Sobel Operator
Sobel Operator is used to find the approximate absolute gradient magnitude at each point in an input grayscale image. The operator undertakes two masks: vertical and horizontal.

Gx = [-1, -2, -1, 0 ,0 ,0, 1, 2 ,1]

Gy = [ -1,0 , 1, -2, 0, 2, -1, 0, 1]


On square rooting the resulting the Gx and Gy we get the pixels at the edges highlighted.

- Robert's Operator

Robert’s Operator is an edge detection operator used in image processing.
It uses two kernel mask.
[1 0 0 -1] and [ 0 -1 1 0 ].
When these masks are applied on the gray-scale image matrix and the resultant square root of the matrix gives more highlighted images.
After the mask is applied on the image, then the resultant matrix undergoes the  square root function. 

- Kirsch Operator
Kirsch Operator is used to detect the edges in the diagonal direction of pixel matrix of the image. All the directions are considered and the following mask is applied on the entire image matrix. The resultant is stored in an empty matrix, which is used to highlight the edges of the image and divide with the pixel intensity values.
Following is the mask which are been applied on the image and the maximum of all them is applied on the image. The eight filters are a rotation of a basic compass convolution filter. The resultant image matrix is computed using the square root function.

North 		= [-3 -3 5; -3 0 5; -3 -3 5];
 North West     = [-3 5 5; -3 0 5; -3 -3 -3];
 West		= [5 5 5; -3 0 -3; -3 -3 -3];
  South West   = [5 5 -3; 5 0 -3; -3 -3 -3];
 South 		= [5 -3 -3; 5 0 -3; 5 -3 -3];
  South East.   = [-3 -3 -3; 5 0 -3; 5 5 -3];
 East                = [-3 -3 -3; -3 0 -3; 5 5 5];
 North East.     = [-3 -3 -3; -3 0 5; -3 5 5];



- Laplacian Operator (Visualized)

The Laplacian operator is applied on the image for the edge detection. The major difference that Laplacian operator stands out from all the other including sobel, kirsch, robert, prewitt operators is that the Laplacian operator is a second order derivative mask. As it has positive and negative laplacian mask which is applied on the image. Here the positive mask is used to take out the outward edges of an image whereas the negative mask is used to take out the inward edges of an image. 

Following mask is used on the: 
Image i) and ii) has Negative Laplacian Mask = [1 1 1 ; 1 -8 1 ; 1 1 1 ];  
Image iii) has Positive  Laplacian Mask=[-1 -1 -1;-1 8 -1;-1 -1 -1];

- Prewitt Operator
Prewitt Operator is quite similar to the Sobel Operator, except the fact that mask used in Prewitt is fixed. In the vertical mask, It calculates the difference of pixel intensities in a edge region. As the center column is of zero so it does not include the original values of an image but rather it calculates the difference of right and left pixel values around that edge. In the horizontal mask, the center row of mask is consist of zeros so it does not include the original values of edge in the image but rather it calculate the difference of above and below pixel intensities of the particular edge. 

x -axis = [-1 -1 -1;0 0 0;1 1 1] =Horizontal mask
Y -axis = [-1 0 1;-1 0 1;-1 0 1] =  Vertical mask

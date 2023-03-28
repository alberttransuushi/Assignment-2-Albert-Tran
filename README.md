# Assignment 2 In Class Albert Tran
 Assignment 2 in class activity for Internediate Computer Graphics 

![Screenshot](Base.png)

Deffered and Forward rendering: What's the difference and implementation

Within the field of Computer Graphics there are typically two different kinds of rendering pipelines we can use Forward Rendering and Deffered Rendering.

Forward rendering consists of 4 main parts, The base geometry of a shape, the vertex shader, the geometry shader, and the fragment shader. Essentially this is the basic rendering technique most engines use, the vertex shader providing vertex information and transformations such as rotation, translation, or scaling, The Geometry shader can then take this information and change the geometry of the object itself, as the name implies. Finally the fragment shader adds color and lighting to the object, and creates a basic object for use.

The pipeline for this may look like the following:

![Screenshot](Forward Rendering.png)


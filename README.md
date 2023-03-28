# Assignment 2 In Class Albert Tran
 Assignment 2 in class activity for Internediate Computer Graphics 

![Screenshot](Base.png)

Deffered and Forward rendering: What's the difference and implementation

Within the field of Computer Graphics there are typically two different kinds of rendering pipelines we can use Forward Rendering and Deffered Rendering.

Forward rendering consists of 4 main parts, The base geometry of a shape, the vertex shader, the geometry shader, and the fragment shader. Essentially this is the basic rendering technique most engines use, the vertex shader providing vertex information and transformations such as rotation, translation, or scaling, The Geometry shader can then take this information and change the geometry of the object itself, as the name implies. Finally the fragment shader adds color and lighting to the object, and creates a basic object for use.

The pipeline for this may look like the following:

![Screenshot](ForwardRendering.png)

Deferred Rendering on the other hand uses the same steps as Forward Rendering, going from Vertex to Geometry, and then to Fragment. However it is changed a bit, instead of simplely going through all of the shaders, it instead defers the the shaders until the pipeline has gone through everything. It then also handles the lighting and other shading information by applying it at the end, instead of at the fragment shader. 

The pipeline for this may look like the following:

![Screenshot](DeferredRendering.png)

The reason why you may want to use Deffered Rendering over Forward Rendering may be for a few reasons. The main reason why is that with Forward rendering, since the fragment shader takes in your geometry and vertex information, it can only apply lighting on a per vertex basis, which can result in very intensive calculations if your object has a lot of vertices. Since deffered rendering splits this process, you end not having to do as many calculations, which results in less intensitivity for your object. 

A Flowchart for both pipelines may look like the following:

![Screenshot](Flowchart.png)


# Instructions for implementing form factors


## Creating a model with form factors

The UFO format allows for including arbitrary functions multiplying vertices.
This can be used to include form factors for effective (or loop induced) couplings.
The implementation of form factors can be done through the following steps:

 1. Create a FeynRules model containing the desired effective operators multiplied by new (EFT) coupling constants (see [example](./auxFiles/Examples/hGG/hGG.fr))
 2. Export the model to the UFO format
 3. Identify the vertices to be modified in the vertices.py file and replace the coupling name in the line (see [example](./auxFiles/Examples/hGG/vertices.py#L849)): 
    ```
     lorentz = [ L.<new coupling name> ]
    ```
 4. Modify the lorentz.py file to add the new coupling function (see [example](./auxFiles/Examples/hGG/lorentz.py#L72)):
 
    ```
    <new coupling name> = Lorentz(name = '<new name>',
               spins = ...,
               structure = '<form factor function>(function arguments) * <tensor structure or simple factors>')
    ```
    
 5. Create a Fortran/functions.f file inside the UFO folder and define the form factor function (see [example](./auxFiles/Examples/hGG/functions.f)).
 6. If the function requires the evaluation of loop integrals (should be finite!), it can be done by using the [Collier](https://collier.hepforge.org/) library (see  [example](./auxFiles/Examples/hGG/functions.f)).
 
 
## Running MadGraph with form factors

For the case of simple form factors which have an explicit analytic expression, [MadGraph5]() can be run normally. 
After importing the modified UFO model, events can be generated running  bin/generate_events. Note that in many cases the order of the effective
couplings might have to be specifically specified (e.g. NP=1) in order to generate the desired process.

If the form factors include the evaluation of loop integrals, the [Collier](https://collier.hepforge.org/) library can be
used (see discussion above concerning the implementation). In this case the following steps must be taken after the creation
of the process folder and before generating events:

 0. Collier must be installed through MadGraph5
 1. The file MG5/HEPTools/collier/COLLIER-1.2.7/collier.mod *must be coppied to the model folder* (found in Source/MODEL)
 2. The static collier library, which can be found in MG5/HEPTools/collier/COLLIER-1.2.7/libcollier.a, *must be coppied to the lib folder* (in <process folder>/lib)
 3. In addition the Source/makefile has to be modified in order to include the collier library (see [example](./auxFiles/Source/makefile))

 4. Finally, the SubProcess/makefile also has to be modified in order to include the collier library (see [example](./auxFiles/SubProcess/makefile))
 
     
After all the above changes, it should be possible to generate events using bin/generate_events.

# oct-image-analysis
Work developed with Adriana Costa during the course of Computer Vision and Biological Perception

The proposed work was to see if any of retinal layers (in mice) contain any information that can be translated to a early diagnosis of neuro degenerative diseases like Alzheimer's, MS or Parkinson's.
The images are obtained using and OCT (Optical Coherence Tomography) and segmented by layer.

Most functions are documented and the use of self explainatory variables was encouraged.

The code follows a simple workflow. Executing ```Script.m``` yields 3 matrices called lineDataset, paramsArray and paramsArrayCumulative with the relevant data.

In lineDataset the last 2 columns are the label and the refering layer, respectively. Each line is a new instance, a new image that was analyzed.

The saved matrices are then loaded in ```ScriptDataClassification``` and are ready to be fed into a classifier. During the work and to save time Matlab's Classification toolbox was used.

# Capstone-Vestibular Shwannoma
NYU Center of Data Science Capstone Project for Vestibular Shwannoma

All data are stored in Big Purple (HPC provided by NYU Langone Health). The directories or environment settings in the code are all under the Big Purple setting.


(`VS_censor_send.xlsx`) contains the patient subject to be included and exluded in the model as well as ground truth tumor volumes.


Data Processing (`DataProcessing.ipynb`)
- Resize all input images to (256,256,208)
- Convert mask values from 255 to 1
- Rename the mask file for each patient to `mask_VS_{Patient_number}.nii.gz`
- Rename whole brain scan image for each patient to `image_{Patient_number}.nii.gz`


Subject File Generation (`Generate_VS_Subject.ipynb`)
- Generate `VS_subject.json` to stream data


Model 
- The code used for building the model are based on [3DUnetCNN](https://github.com/ellisdg/3DUnetCNN) with modification
- Modified code in folder `unet3d`
- Further fine tuned the [pretrained model](https://zenodo.org/record/4289225#.YbqM2S-B2Cc) from David G Ellis [BraTS2020](https://www.med.upenn.edu/cbica/brats2020/data.html)  for extra 99 epochs, where the final model is linked [here](https://drive.google.com/file/d/1qC04-SPZOyn4IxmmzPHVJI1VrFHbBxmo/view?usp=sharing)
- Configuration file used during training is `VS_config.json`
- Script to train the model `script_pretrain.sh`
- Script to predict tumor label `script_predict.sh`
- [Final Model](https://drive.google.com/file/d/1qC04-SPZOyn4IxmmzPHVJI1VrFHbBxmo/view?usp=sharing)


Model Evaluation (`model_evaluation.ipynb`)
- Visualizing the learning curve on train and validation set based on prediction log
- Display model performance on test set (dice score)
- Show the top and worst predictions with predicted tumor mask

Evaluation Metrics 
- Make calculation of confidence score (`Confidence_Score.ipynb`) on the model prediction

Volume Calculation 
- Tumor volume calculation based on pixel counts (`tumor_vol_calculation.ipynb`)
- Volume performance evaluation(`vol_comparison_version_2.ipynb`)



    

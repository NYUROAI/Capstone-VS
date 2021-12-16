# Capstone-VS
CDS Capstone Project for Vestibular Shwannoma

Data Processing (`Data Processing.ipynb`)
- Resize all input images to (256,256,208)
- Convert mask values from 255 to 1
- Rename the mask file for each patient to `mask_VS_{Patient_number}.nii.gz`
- Rename whole brain scan image for each patient to `image_{Patient_number}.nii.gz`

Model 
- Code used for building the model from [3DUnetCNN](https://github.com/ellisdg/3DUnetCNN)
- Further fine tuned the [pretrained model](https://zenodo.org/record/4289225#.YbqM2S-B2Cc) from David G Ellis for [BraTS2020](https://www.med.upenn.edu/cbica/brats2020/data.html)  for extra 99 epochs linked here ``
- Configuration file used during training `VS_config.json`
- Script to train the model `script_pretrain.sh`
- Script to predict tumor label `script_predict.sh`


Model Evaluation (`model_evaluation.ipynb`)
- Learning curve on train and validation set 
- Model Performance on test set (dice score)
- Top and Worst Predictions

Evaluation Metrics 
- Calculation of confidence score (`Confidence_Score.ipynb`)

Volume Calculation 
- Tumor volume calculation based on pixel counts (`tumor_vol_calculation.ipynb`)
- Volume performance evaluation(`vol_comparison_version_2.ipynb`)
    

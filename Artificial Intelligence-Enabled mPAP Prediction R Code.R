###########################################################################################################################
# Loading basic libraries:
library(xgboost)

# Load the trained XGB model from desktop:
XGB_for_mPAP_prediction <- xgb.load("~/Desktop/XGB_for_future_mPAP_prediction_V2")

# mPAP prediction in future patients - firstly create a new data matrix with the respective individual echocardiographic parameters:
new_patient <- data.frame(
  LVEF_pre = 45,                          # left ventricular ejection fraction in %
  LVESD = 35,                             # left ventricular end-systolic diameter in mm
  LA_area = 30,                           # left atrial area in cm2
  TAPSE_pre = 18,                         # tricuspid annular plane systolic excursion in mm
  RV_basal_diameter_pre = 45,             # basal right ventricular diameter in mm
  sPAP_pre = 45,                          # systolic pulmonary artery pressure (as assessed by echocardiography) in mmHg
  Vena_contracta_pre = 12,                # tricuspid regurgitation vena contracta width in mm
  RA_area = 30,                           # right atrial area in cm2
  VCI_Diameter_pre = 23,                  # inferior vena cava diameter in mm
  TV_EROA_pre = 1.2                       # tricuspid valve effective regurgitant orifice area in cm2
)

# Convert the data frame into appropriate format for the XGB algorithm:
new_patient <- as.matrix(new_patient)
new_patient = xgb.DMatrix(data = new_patient)

# Make a prediction:
mPAP_predicted <- predict(XGB_for_mPAP_prediction, new_patient)

# Please print the mPAP level as predicted (in mmHg):
print(mPAP_predicted)   




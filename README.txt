### Deploy a new version
library(rsconnect)
options(timeout=400)
if(!require(devtools)) install.packages("devtools")
devtools::install_github("thoree/BIAS.data")
rsconnect::deployApp('C:/Users/theg/Dropbox/Rlibs/dbias')

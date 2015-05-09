sudo apt-get install r-base
#install a package
install.packages(``pckgname'')
#load a package
library(pckgname)
#see available functions
search()
#install packages from Bioconductor
source(``http://www.bioconductor.org/biocLite.R'')
biocLite()
biocLite(c(``pckg1'', ``pckg2'', ``pckg3''))


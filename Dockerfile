FROM rocker/r-rmd

# Install required packages
COPY requirements.txt /requirements.txt
RUN R -e "install.packages(readLines('/requirements.txt', warn = F))"

COPY data /src/data
COPY unwrapper.Rmd /src/unwrapper.Rmd
WORKDIR /src
CMD ["R", "-e", "rmarkdown::render(input = 'unwrapper.Rmd', output_file = 'output.html')"]
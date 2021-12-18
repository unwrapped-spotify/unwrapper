FROM rocker/r-rmd

# Install required packages
COPY requirements.txt /requirements.txt
RUN R -e "install.packages(readLines('/requirements.txt', warn = F))"

COPY unwrapper.Rmd /src/unwrapper.Rmd
COPY data.json /src/data.json
WORKDIR /src
CMD ["R", "-e", "rmarkdown::render(input = '/src/unwrapper.Rmd', output_file = 'output.html')"]
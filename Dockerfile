FROM rocker/r-rmd

# Install required packages
COPY requirements.txt /requirements.txt
RUN R -e "install.packages(readLines('/requirements.txt', warn = F))"

COPY unwrapper.Rmd /workspace/unwrapper.Rmd
#COPY data.json /src/data.json
RUN mkdir /workspace/output
WORKDIR /workspace
CMD ["R", "-e", "rmarkdown::render(input = 'unwrapper.Rmd', output_file = '/workspace/output/output.html')"]
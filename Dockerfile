FROM rocker/r-rmd

# Install required packages
COPY requirements.txt /requirements.txt
RUN R -e "install.packages(readLines('/requirements.txt', warn = F))"

COPY src /src
#COPY data.json /src/data.json
WORKDIR /src
CMD cp -r /workspace/data /src/data && \
    R -e "rmarkdown::render('unwrapper.Rmd', output_file = 'output.pdf')" && \
    cp /src/output.pdf /workspace/output.pdf
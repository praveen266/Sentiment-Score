FROM trestletech/plumber
MAINTAINER Docker User <docker@user.org>
  
  RUN apt-get update --allow-releaseinfo-change -qq && apt-get install -y \
git-core \
libssl-dev \
default-jdk \
libcurl4-openssl-dev \
libxml2-dev \
libpq-dev -y

RUN R CMD javareconf

RUN R -e "install.packages('sentimentr')"
RUN R -e "install.packages('dplyr')"
RUN R -e "install.packages('rvest')"
RUN R -e "install.packages('Rcurl')"
RUN R -e 'devtools::install_github("praveen266/Sentiment-Score")'

EXPOSE 8000
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=8787)"]
CMD ["/app/plumber.R"]
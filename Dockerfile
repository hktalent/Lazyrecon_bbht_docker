FROM ubuntu:latest

LABEL version="1.0.0" \
      author="Author 51pwn.com (https://51pwn.com)" \
      docker_build="docker build -t 51pwn_com/Lazyrecon_bbht:1.0.0 ." 

RUN apk update \
  && apk add --no-cache --virtual .build-deps \
     perl \
     perl-net-ssleay \
  && echo 'Cleaning cache from APK.' \
  && rm -rf /var/cache/apk/* \
  && apt-get -y update  \
  && apt-get -y upgrade  \
  && apt-get install -y libcurl4-openssl-dev  \
  && apt-get install -y libssl-dev  \
  && apt-get install -y jq  \
  && apt-get install -y ruby-full  \
  && apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev  \
  && apt-get install -y build-essential libssl-dev libffi-dev python-dev  \
  && apt-get install -y python-setuptools  \
  && apt-get install -y libldns-dev  \
  && apt-get install -y python3-pip  \
  && apt-get install -y python-pip  \
  && apt-get install -y python-dnspython  \
  && apt-get install -y git  \
  && apt-get install -y rename  \
  && apt-get install -y xargs \
  && echo "installing bash_profile aliases from recon_profile" \
  && git clone https://github.com/nahamsec/recon_profile.git \
  && cd recon_profile \
  && cat bash_profile >> ~/.bash_profile \
  && source ~/.bash_profile \
  && cd ~/tools/ \
  && echo "done" \
  # Don't forget to set up AWS credentials! \
  && echo "Don't forget to set up AWS credentials!" \
  && apt install -y awscli \
  && echo "Don't forget to set up AWS credentials!" \
  #create a tools folder in ~/ \
  && mkdir ~/tools \
  && cd ~/tools/ \
  #install aquatone \
  && echo "Installing Aquatone" \
  && go get github.com/michenriksen/aquatone \
  && echo "done" \
  #install chromium \
  && echo "Installing Chromium" \
  && sudo snap install chromium \
  && echo "done" \
  && echo "installing JSParser" \
  && git clone https://github.com/nahamsec/JSParser.git \
  && cd JSParser* \
  && sudo python setup.py install \
  && cd ~/tools/ \
  && echo "done" \
  && echo "installing Sublist3r" \
  && git clone https://github.com/aboul3la/Sublist3r.git \
  && cd Sublist3r* \
  && pip install -r requirements.txt \
  && cd ~/tools/ \
  && echo "done" \
  && echo "installing teh_s3_bucketeers" \
  && git clone https://github.com/tomdev/teh_s3_bucketeers.git \
  && cd ~/tools/ \
  && echo "done" \
  && echo "installing wpscan" \
  && git clone https://github.com/wpscanteam/wpscan.git \
  && cd wpscan* \
  && sudo gem install bundler && bundle install --without test \
  && cd ~/tools/ \
  && echo "done" \
  && echo "installing dirsearch" \
  && git clone https://github.com/maurosoria/dirsearch.git \
  && cd ~/tools/ \
  && echo "done" \
  && echo "installing lazys3" \
  && git clone https://github.com/nahamsec/lazys3.git \
  && cd ~/tools/ \
  && echo "done" \
  && echo "installing virtual host discovery" \
  && git clone https://github.com/jobertabma/virtual-host-discovery.git \
  && cd ~/tools/ \
  && echo "done" \
  && echo "installing sqlmap" \
  && git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev \
  && cd ~/tools/ \
  && echo "done" \
  && echo "installing knock.py" \
  && git clone https://github.com/guelfoweb/knock.git \
  && cd ~/tools/ \
  && echo "done" \
  && echo "installing lazyrecon" \
  && git clone https://github.com/nahamsec/lazyrecon.git \
  && cd ~/tools/ \
  && echo "done" \
  && echo "installing nmap" \
  && sudo apt-get install -y nmap \
  && echo "done" \
  && echo "installing massdns" \
  && git clone https://github.com/blechschmidt/massdns.git \
  && cd ~/tools/massdns \
  && make \
  && cd ~/tools/ \
  && echo "done" \
  && echo "installing asnlookup" \
  && git clone https://github.com/yassineaboukir/asnlookup.git \
  && cd ~/tools/asnlookup \
  && pip install -r requirements.txt \
  && cd ~/tools/ \
  && echo "done" \
  && echo "installing httprobe" \
  && go get -u github.com/tomnomnom/httprobe  \
  && echo "done" \
  && echo "installing unfurl" \
  && go get -u github.com/tomnomnom/unfurl  \
  && echo "done" \
  && echo "installing waybackurls" \
  && go get github.com/tomnomnom/waybackurls \
  && echo "done" \
  && echo "installing crtndstry" \
  && git clone https://github.com/nahamsec/crtndstry.git \
  && echo "done" \
  && echo "downloading Seclists" \
  && cd ~/tools/ \
  && git clone https://github.com/danielmiessler/SecLists.git \
  && cd ~/tools/SecLists/Discovery/DNS/ \
  ##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
  && cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt \
  && cd ~/tools/ \
  && echo "done"

# ENTRYPOINT ["nikto.pl"]


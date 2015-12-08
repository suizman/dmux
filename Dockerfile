FROM ubuntu
# Install some packages
RUN apt-get update -y
RUN apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository -y ppa:pi-rho/dev
RUN apt-get update -y
RUN apt-get install -y vim nano tig git zsh tmux curl fontconfig tmux=2.0-1~ppa1~t

# Install/Configure Oh My Zsh
RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
    sed -i 's/robbyrussell/random/' /root/.zshrc

# Add Tmux conf
COPY conf/10-powerline-symbols.conf /etc/fonts/conf.d/10-powerline-symbols.conf
COPY conf/PowerlineSymbols.otf /usr/share/fonts/PowerlineSymbols.otf
COPY conf/tmux.conf /root/.tmux.conf

# Refresh config
RUN fc-cache

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add dmux personal conf
RUN echo "source ~/.dmux.conf" >> /root/.zshrc
COPY conf/dmux.conf /root/.dmux.conf

# Add entrypoint
COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh

# The entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

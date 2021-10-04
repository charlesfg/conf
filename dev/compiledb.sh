# intall pip                                                                                                                                                                                                       
VERSION_OS=$(lsb_release -r -s)

if [[ ${VERSION_OS} == 16.04 ]];
then 
    echo ${VERSION_OS}
    sudo apt-get -y install python-dev libsasl2-dev libldap2-dev python-ldap libssl-dev python-tk python3-dev;  
    curl https://bootstrap.pypa.io/get-pip.py > get-pip.py
    #curl https://bootstrap.pypa.io/get-pip.py > get-pip.py && \
    curl https://bootstrap.pypa.io/pip/2.7/get-pip.py > get-pip.py
    sudo python get-pip.py && rm  get-pip.py
    sudo pip install virtualenvwrapper httpie  
    export WORKON_HOME=~/Envs

    ve_cnf=("/usr/local/bin/virtualenvwrapper.sh" \
        "/usr/local/share/python/virtualenvwrapper.sh" \
        "$HOME/.local/bin/virtualenvwrapper.sh")

    for i in ${ve_cnf[@]};
    do 
        if [[ -e $i ]];
        then
            source $i
        fi 
    done
    mkvirtualenv -p python3 compiledb
    echo "activate the compiledb env and them: sudo pip install compiledb"
else
	sudo pip install compiledb
fi

exit;



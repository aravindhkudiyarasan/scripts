while true; do
    read -p "Do you wish to see the date?" yn
    case $yn in
        [Yy]* ) date; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


echo "Select your choice ../?"

select dhe in "Date" "Hostname" "Exit"; do

case $dhe in
    Date )
            date
            break;;

    Hostname )
            hostname
            break;;

    Exit )

            echo "See You Again.!"
            exit 5
            ;;

esac

done


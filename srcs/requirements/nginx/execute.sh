sudo docker build -t inception . >/dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Inception part is builded ...."
else
    echo "ERROR:"
    echo "---"
    echo " "
    sudo docker build -t inception .
    echo " "
    echo "Solve this problem, Inception is not builded !"
    exit 1
fi

echo "Launch with -it ? (y/n)"
read answer
if [ "$answer" = "y" ]; then
    echo "Use 'exit to stop container"
    sudo docker run -it inception
else
    sudo docker run inception
fi
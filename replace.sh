export handler=index.application
myhandler=$(echo $handler | cut -d"." -f1)
myfunction=$(echo $handler | cut -d"." -f2)
echo $myhandler $myfunction
handlerstr=$(echo 's/HandlerName/'$myhandler'/')
echo $handlerstr
sed -i $handlerstr server.py

functionstr=$(echo 's/FunctionName/'$myfunction'/')
echo $functionstr
sed -i $functionstr server.py

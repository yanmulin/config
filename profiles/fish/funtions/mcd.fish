# Defined in - @ line 1
function mcd --description 'mkdir DIR;cd DIR'
    mkdir -p $argv[1]
    cd $argv[1]
end

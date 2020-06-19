ssh-keygen -t rsa -b 4096 -C "yans1996@outlook.com"	
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
echo "===================PUBLIC KEY==================="
cat ~/.ssh/id_rsa.pub

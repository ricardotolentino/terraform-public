export exitcode=0
echo "BEFORE: exitcode = $exitcode"
terraform plan -detailed-exitcode -no-color -out tfplan || export exitcode=$?
echo "AFTER: exitcode = $exitcode"
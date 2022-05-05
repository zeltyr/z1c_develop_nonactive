cd "C:\VSA\develop.git\"
call vrunner decompileepf "./build/ext" "./src/ext"
call vrunner decompileepf "./build/old_test" "./src/old_test"
call vrunner decompileepf "./build/tests" "./src/tests"


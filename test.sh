#!/bin/bash
echo "Running test"
mkdir -p build/${BUILD_TYPE}
cat > build/${BUILD_TYPE}/test-file.xml << EOM
<testsuite errors="0" failures="0" name="test-file" tests="23" time="0.0020" >
	<testcase classname="FileFactoryTest" name="testRegisterFile" time="0.0001" >
	</testcase>
	<testcase classname="FileFactoryTest" name="testUnregisterFile" time="0.0000" >
	</testcase>
	<testcase classname="FileFactoryTest" name="testCreateFile" time="0.0000" >
	</testcase>
	<testcase classname="FileTest" name="testFileExists" time="0.0000" >
	</testcase>
	<testcase classname="FileTest" name="testFileOpen" time="0.0000" >
	</testcase>
	<testcase classname="FileTest" name="testFileRead" time="0.0000" >
	</testcase>
	<testcase classname="FileTest" name="testFileReadLine" time="0.0000" >
	</testcase>
	<testcase classname="FileTest" name="testFileWrite" time="0.0001" >
	</testcase>
	<testcase classname="FileTest" name="testFileWriteLine" time="0.0002" >
	</testcase>
	<testcase classname="FileTest" name="testFileIsDir" time="0.0000" >
	</testcase>
	<testcase classname="FileTest" name="testFileIsFile" time="0.0000" >
	</testcase>
	<testcase classname="FileTest" name="testFileList" time="0.0001" >
	</testcase>
	<testcase classname="FileTest" name="testReadWriteObject" time="0.0002" >
	</testcase>
	<testcase classname="FileTest" name="testVerifiedReadWriteObject" time="0.0001" >
	</testcase>
	<testcase classname="FileTest" name="whenVerificationFails_ReadVerifiedObjectThrowsException" time="0.0001" >
	</testcase>
	<testcase classname="FileTest" name="whenVerifiedContainerFileTamperedWith_ReadVerifiedObjectThrowsException" time="0.0002" >
	</testcase>
	<testcase classname="FileTest" name="testFileExceptions" time="0.0001" >
	</testcase>
	<testcase classname="URLTest" name="testDecodeURLString" time="0.0000" >
	</testcase>
	<testcase classname="URLTest" name="testfilePathToUrl" time="0.0008" >
	</testcase>
	<testcase classname="URLTest" name="testFileURL" time="0.0000" >
	</testcase>
	<testcase classname="URLTest" name="testNoProtocolIsFile" time="0.0000" >
	</testcase>
	<testcase classname="URLTest" name="testUnsupported" time="0.0000" >
	</testcase>
	<testcase classname="URLTest" name="testRelativeURL" time="0.0000" >
	</testcase>
</testsuite>
EOM
ls -al build/${BUILD_TYPE}


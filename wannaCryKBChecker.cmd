@ECHO off
SET wannaCryFile=%userprofile%\Desktop\wannaCry.txt

(ver && echo.) >> %wannaCryFile%

:: use this as the generic check
(echo FINDALL && findstr /i "KB4012598 KB4012212 KB4012213 KB4012214 KB4012215 KB4012216 KB4012217 KB4012606 KB4013198 KB4013429" %windir%\WindowsUpdate.log && echo.) >> %wannaCryFile%

goto comment
:: Included commands for specific tests
:: As found here - https://technet.microsoft.com/en-us/library/security/ms17-010.aspx
:: Windows Vista requires KB4012598
:: Windows Server 2008 requires KB4012598
:: Windows 7 requires KB4012212 or KB4012215
:: Windows Server 2008 R2 requires KB4012212 or KB4012215
:: Windows 8.1 requires KB4012213 or KB4012216
:: Windows Server 2012 and Server 2012 R2 requires KB4012214 or KB4012217 or KB4012213 or KB4012216
:: Windows RT 8.1 requires KB4012216
:: Windows Windows 10 requires KB4012606 or KB4013198 or KB4013429
:: Windows Server 2016 requires KB4013429

(echo KB4012598 && find /i "KB4012598" %windir%\WindowsUpdate.log && echo.) >> %wannaCryFile%
(echo KB4012212 && find /i "KB4012212" %windir%\WindowsUpdate.log && echo.) >> %wannaCryFile%
(echo KB4012215 && find /i "KB4012215" %windir%\WindowsUpdate.log && echo.) >> %wannaCryFile%
(echo KB4012213 && find /i "KB4012213" %windir%\WindowsUpdate.log && echo.) >> %wannaCryFile%
(echo KB4012216 && find /i "KB4012216" %windir%\WindowsUpdate.log && echo.) >> %wannaCryFile%
(echo KB4012214 && find /i "KB4012214" %windir%\WindowsUpdate.log && echo.) >> %wannaCryFile%
(echo KB4012217 && find /i "KB4012217" %windir%\WindowsUpdate.log && echo.) >> %wannaCryFile%
(echo KB4012606 && find /i "KB4012606" %windir%\WindowsUpdate.log && echo.) >> %wannaCryFile%
(echo KB4013198 && find /i "KB4013198" %windir%\WindowsUpdate.log && echo.) >> %wannaCryFile%
(echo KB4013429 && find /i "KB4013429" %windir%\WindowsUpdate.log && echo.) >> %wannaCryFile%
:comment

:: These are the ports affected; if your system isn't patched they should be closed
(echo Port137 && netstat -na | find "137" && echo.) >> %wannaCryFile%
(echo Port138 && netstat -na | find "138" && echo.) >> %wannaCryFile%
(echo Port139 && netstat -na | find "139" && echo.) >> %wannaCryFile%
(echo Port445 && netstat -na | find "445" && echo.) >> %wannaCryFile%

:: This simply opens the output file for review
%userprofile%\Desktop\wannaCry.txt

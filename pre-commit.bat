@echo off
@echo off& setlocal enabledelayedexpansion

set REPOS=%1
set TXN=%2
set MAX_BYTES= 157286400

for /f "tokens=1 delims=" %%i in ('svnlook changed --copy-info -t %TXN% %REPOS%') do (
	set changed=%%i
	set changedname="!changed:~4!"
::	echo changedname: !changedname! 1>&2
::	echo REPOS: %REPOS% 1>&2
::	echo txn: %TXN% 1>&2
	for /f %%j in ('svnlook filesize -t !TXN! !REPOS! !changedname!') do (
		echo j:%%j
		set filesize=%%j
		echo filesize: !filesize! 1>&2
		echo max: !MAX_BYTES! 1>&2
		if !filesize! GEQ !MAX_BYTES! (goto err) else (goto nextfile)
			:err
			echo 您提交的文件过大. 1>&2  
			echo 最大为150M. 1>&2
			echo 大于此大小请上传FTP 1>&2
			exit 1
			:nextfile
::			echo 正常 1>&2
	)
	
)
exit 0
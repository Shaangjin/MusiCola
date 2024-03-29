tell application "Logic Pro X" to activate -- Logic Pro X를 활성화합니다.

tell application "System Events"
	tell process "Logic Pro X"
		keystroke "d"
		delay 0.5
		keystroke "a" using {command down} -- 모든 항목을 선택합니다.
		delay 0.5 -- 선택이 완료되기를 기다립니다.
		keystroke "c" using {command down} -- 선택한 항목을 복사합니다.
		delay 0.5
		keystroke "d" using {shift down}
		delay 0.5
		keystroke "d"
		
	end tell
end tell

-- Logic Pro X에서 필요한 정보를 클립보드에 복사하는 단계가 선행되어야 합니다.

tell application "System Events"
	-- 클립보드의 내용을 가져옵니다.
	set clipboardData to the clipboard as text
end tell

-- UTF-8로 인코딩된 데이터를 변수에 저장합니다.
set utf8Data to clipboardData as �\class utf8�]

-- 클립보드 데이터를 텍스트 파일로 저장합니다.
--set filePath to "/Users/sangjin/Desktop/12345.txt" -- 저장할 파일의 경로와 이름을 지정합니다.
set filePath to "YOUR_TXT_PATH" --python에서 txt 파일이름 지정하기 위해 사용

-- 파일 참조 생성
set fileRef to POSIX file filePath

tell application "System Events"
	if not (exists fileRef) then
		-- 파일이 존재하지 않으면 새 파일 생성
		set fileRef to open for access fileRef with write permission
		write "" to fileRef -- 빈 내용으로 파일 생성
		close access fileRef
	end if
end tell



set fileRef to open for access POSIX file filePath with write permission -- 파일을 쓰기 가능하게 열기
set eof of fileRef to 0
-- UTF-8로 인코딩된 데이터를 파일에 씁니다.
write utf8Data to fileRef starting at eof as �\class utf8�]
close access fileRef -- 파일 닫기

tell application "Logic Pro X" to activate -- Logic Pro X�� Ȱ��ȭ�մϴ�.

tell application "System Events"
	tell process "Logic Pro X"
		keystroke "d"
		delay 0.5
		keystroke "a" using {command down} -- ��� �׸��� �����մϴ�.
		delay 0.5 -- ������ �Ϸ�Ǳ⸦ ��ٸ��ϴ�.
		keystroke "c" using {command down} -- ������ �׸��� �����մϴ�.
		delay 0.5
		keystroke "d" using {shift down}
		delay 0.5
		keystroke "d"
		
	end tell
end tell

-- Logic Pro X���� �ʿ��� ������ Ŭ�����忡 �����ϴ� �ܰ谡 ����Ǿ�� �մϴ�.

tell application "System Events"
	-- Ŭ�������� ������ �����ɴϴ�.
	set clipboardData to the clipboard as text
end tell

-- UTF-8�� ���ڵ��� �����͸� ������ �����մϴ�.
set utf8Data to clipboardData as �\class utf8�]

-- Ŭ������ �����͸� �ؽ�Ʈ ���Ϸ� �����մϴ�.
--set filePath to "/Users/sangjin/Desktop/12345.txt" -- ������ ������ ��ο� �̸��� �����մϴ�.
set filePath to "YOUR_TXT_PATH" --python���� txt �����̸� �����ϱ� ���� ���

-- ���� ���� ����
set fileRef to POSIX file filePath

tell application "System Events"
	if not (exists fileRef) then
		-- ������ �������� ������ �� ���� ����
		set fileRef to open for access fileRef with write permission
		write "" to fileRef -- �� �������� ���� ����
		close access fileRef
	end if
end tell



set fileRef to open for access POSIX file filePath with write permission -- ������ ���� �����ϰ� ����
set eof of fileRef to 0
-- UTF-8�� ���ڵ��� �����͸� ���Ͽ� ���ϴ�.
write utf8Data to fileRef starting at eof as �\class utf8�]
close access fileRef -- ���� �ݱ�

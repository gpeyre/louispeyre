function str = html_char(str)

str = strrep(str, '�', '&eacute;');
str = strrep(str, '�', '&egrave;');
str = strrep(str, '�', '&agrave;');
str = strrep(str, '�', '&ecirc;');
str = strrep(str, '�', '&ugrave;');
str = strrep(str, '�', '&ucirc;');
str = strrep(str, '�', '&ccedil;');
str = strrep(str, '�', '&iuml;');
str = strrep(str, '"', '&quot;');
str = strrep(str, '''', '&#39;');


end
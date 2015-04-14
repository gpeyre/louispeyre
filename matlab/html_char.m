function str = html_char(str)

str = strrep(str, 'é', '&eacute;');
str = strrep(str, 'è', '&egrave;');
str = strrep(str, 'à', '&agrave;');
str = strrep(str, 'ê', '&ecirc;');
str = strrep(str, 'ù', '&ugrave;');
str = strrep(str, 'û', '&ucirc;');
str = strrep(str, 'ç', '&ccedil;');
str = strrep(str, 'ï', '&iuml;');
str = strrep(str, '"', '&quot;');
str = strrep(str, '''', '&#39;');


end
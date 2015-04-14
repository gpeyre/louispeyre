%%
% Script to exports the images from the database.

% load the data

base_rep_site = '/Users/gabrielpeyre/Dropbox/louis/';
addpath([base_rep_site 'pdf/matlab/']); % add matlab toolbox

in_img = [base_rep_site 'images/imgs/'];
in_thumbs = [base_rep_site 'images/thumbs/'];

out_img = 'images/imgs/';
out_thumbs = 'images/thumbs/';

in_data_rep = 'data_txt/';
out_data_rep = '../_data/';

[DataBase,fname] = load_xls([base_rep_site '/database/LouisDataBase.xlsx']);

NumList = selcol(DataBase,fname,'Numero');
NumList = convert_cell_str(NumList);
TitreList = selcol(DataBase,fname,'Titre');
AppelList = selcol(DataBase,fname,'Appellation');
DateList = selcol(DataBase,fname,'Datation');
EpoqueList = selcol(DataBase,fname,'Epoque');
MesList = selcol(DataBase,fname,'Mesures');


if not(exist(out_img))
    mkdir(out_img);
    mkdir(out_thumbs);
    mkdir(out_data_rep);
end

L = dir([in_data_rep '*.txt']);
for i=1:length(L)    
    in_file = L(i).name;
    name = in_file(1:end-4);
    disp(['---- ' name ' ----']);
    a = read_data_file([in_data_rep in_file]);
    fid = fopen([out_data_rep name '.yml'], 'wt');
    for j=1:length(a)
        u = a{j};
        if not(isstr(u))
            u = num2str(u);
        end
        % number in the database
        ind = locate_num( NumList, u );
        if isempty(ind)
            error('Problem in database');
        end
        % copy image file
        copyfile([in_img u '.jpg'],[out_img u '.jpg']);
        copyfile([in_thumbs u '.jpg'],[out_thumbs u '.jpg']);
        % check orient
        img = imread([in_thumbs u '.jpg']);
        if size(img,1)>size(img,2)
            or = 'V';
        else
            or = 'H';
        end
        % generate title
        str = TitreList{ind};
        if isnan(str)
            str = AppelList{ind};
        end
        if isnan(str)
            str = '';
        end
        str = html_char(str);
        % generate date
        date = DateList{ind};
        if isnan(date)
            date = EpoqueList{ind};
        end
        if isnan(date)
            date = '';
        end
        date = html_char(date);
        date = strrep(date, ' ?', '');
        % generate mesure
        measure = MesList{ind};
        if isnan(measure)
            measure = '';
        end 
        % generate tag
        fprintf(fid, ['- id: ' u '\n']);
        fprintf(fid, ['  name: "' str '"\n']);
        fprintf(fid, ['  orient: ' or '\n']);
        fprintf(fid, ['  size: ' measure '\n']);
        fprintf(fid, ['  date: ' date '\n']);
    end
    fclose(fid);
end

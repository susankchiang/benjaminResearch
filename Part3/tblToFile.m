%Writes a container.Map tbl into a file fileName
function tblToFile(tbl, fileName)
fileID = fopen(fileName, 'w');

ks = tbl.keys;
for i=1:length(ks)
    key = ks{i};
    fprintf(fileID,'%s,%f\n',key, tbl(key));
end

fclose(fileID);
function IA1_fin
load 'IA1Seqs.mat';
M = IA1Seqs;
[r,c] = size(M);
IA1_res = zeros(r,c);

tbls = containers.Map;

%Generate all the probabilities for all the combinations
for q=1:10
    IA1(i);
    load(strcat('IA1_',int2str(q),'_results.mat'));
    tbls(int2str(q)) = tbl;
end

%For first column and six entries
t = tbls('1'); 
for i=1:6
    IA1_res(i,1) = rand(1)<= t('[]');
end

%For rest of input
for i=1:r
    for j= 2:c
        if(M(i,j)~=0)
            mat = num2str(M(i,j)); 
            len = length(mat)+1;
            tb = tbls(num2str(len)); %Gets the appropriate table
            formatted = format(mat);
            
            %Get the probability generated from IA1
            if(tb.isKey(formatted))
                prob = tb(formatted);  
            else
                prob=0;
            end
            IA1_res(i,j) = rand(1)<= prob; %Choose heads with a probability of 
                                       %prob
        end
    end
end

save('IA1_results.mat','IA1_res','tbls');
end

%Formats sequence of flips to the format of the keys in the tables produced
%by IA1.
function str = format(in) 
    if(length(in)<=1)
        str= num2str(str2num(in)-1);
    else
        str = '[';
        for i=1:length(in)
            in2 = num2str(str2double(in(i))-1);
            if(i<length(in))
                str = strcat(str,in2,';');
            else
                str = strcat(str,in2);
            end
        end
        str = strcat(str,']');
    end
end
